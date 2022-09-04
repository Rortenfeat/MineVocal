import pyworld as pw
import numpy as np
import soundfile as sf
import os
import math

singers = ["lty", "miku", "tong"]
audio_format = [".wav", ".mp3", ".ogg", ".flac"]

def midi2fq(note): return 440 * pow(2, (note-69)/12)

for s in singers:
	phones = []; text = "data modify storage minevocal:render library set value ["
	for fn in os.listdir("samples/"+s):
		if os.path.isfile(f'samples/{s}/{fn}') and os.path.splitext(fn)[1] in audio_format: phones.append(os.path.splitext(fn)[0])
	for p in phones:
		text += f'{{phone: "{p}", sp:['
		x, fs = sf.read(f'samples/{s}/{p}.wav')
		if len(x.shape) > 1: x = x.T[0]

		# pyworld analyzing
		_f0, t = pw.dio(x, fs)
		f0 = pw.stonemask(x, _f0, t, fs)
		_sp = pw.cheaptrick(x, f0, t, fs)
		_ap = pw.d4c(x, f0, t, fs)
		print(p, np.mean(f0))

		_sp_mean = np.mean(np.sqrt(_sp), axis=0)
		_ap_mean = np.mean(_ap, axis=0)
		sp=[]; ap=[]
		for n in range(0, 137):
			i = midi2fq(n)/(fs/2/(len(_sp_mean)-1))
			it = (int(math.floor(i)), i-i//1)
			sp.append(_sp_mean[it[0]]*(1-it[1])+_sp_mean[it[0]+1]*(it[1]))
			ap.append(_ap_mean[it[0]]*(1-it[1])+_ap_mean[it[0]+1]*(it[1]))
		sp = sp / np.max(sp)
		for j in sp: text += "{:.7f}".format(j) + ', '
		text = text[:-2] + "], ap:["
		for k in ap: text += "{:.7f}".format(k) + ', '
		text = text[:-2] + "]}, "
	text = text[:-2] + ']\ndata modify storage minevocal:render singer set value "' + s + '"'
	path = f'MineVocal/data/minevocal/functions/singers/{s}'
	if not os.path.exists(path): os.makedirs(path)
	with open(f'{path}/setup.mcfunction', mode="w", encoding="utf-8") as f: f.write(text)
	with open(f'{path}/reg.mcfunction', mode="w", encoding="utf-8") as f: f.write(f'execute if data storage minevocal:main {{Singer: "{s}"}} run function minevocal:singers/{s}/setup')
