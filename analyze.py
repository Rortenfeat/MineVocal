import pyworld as pw
import numpy as np
import soundfile as sf
import os
import math

singers = ["lty", "miku", "tong"]

def midi2fq(note): return 440 * pow(2, (note-198)/72)

for s in singers:
	phones = []; text = "data modify storage minevocal:render library set value ["
	for fn in os.listdir("samples/"+s):
		if os.path.isdir(f'samples/{s}/{fn}'): phones.append(fn)
	for p in phones:
		text += f'{{phone: "{p}", mt:['
		multitone = []
		for sample in os.listdir(f'samples/{s}/{p}'):
			if os.path.isfile(f'samples/{s}/{p}/{sample}') and sample[-4:] == '.wav':
				x, fs = sf.read(f'samples/{s}/{p}/{sample}')
				if len(x.shape) > 1: x = np.array(x[:,0], order='C')

				# pyworld analyzing
				_f0, t = pw.dio(x, fs)
				f0 = pw.stonemask(x, _f0, t, fs)
				_sp = pw.cheaptrick(x, f0, t, fs)
				_ap = pw.d4c(x, f0, t, fs)

				_sp_mean = np.mean(np.sqrt(_sp), axis=0)
				_ap_mean = np.mean(_ap, axis=0)
				sp=[]; ap=[]
				for n in range(0, 591):
					i = midi2fq(n)/(fs/2/(len(_sp_mean)-1))
					it = (int(math.floor(i)), i-i//1)
					sp.append(_sp_mean[it[0]]*(1-it[1])+_sp_mean[it[0]+1]*(it[1]))
					ap.append(_ap_mean[it[0]]*(1-it[1])+_ap_mean[it[0]+1]*(it[1]))
				multitone.append(dict(f0=np.mean(f0), sp=sp, ap=ap))
		multitone.sort(key=lambda a: a['f0'])
		power_max = 0
		for m in multitone:
			text += str(round(12*math.log2(m['f0']/440)+69)) + ', ' 
			power_max = max(power_max, np.max(m['sp']))
		text = text[:-2] + '], sp:['
		for n in range(591):
			text += '['
			for o in range(len(multitone)): text += "{:.7f}".format(multitone[o]['sp'][n]/power_max) + ', '
			text = text[:-2] + '], '
		text = text[:-2] + '], ap:['
		for n in range(591):
			text += '['
			for o in range(len(multitone)): text += "{:.7f}".format(multitone[o]['ap'][n]) + ', '
			text = text[:-2] + '], '
		text = text[:-2] + ']}, '
	text = text[:-2] + ']\ndata modify storage minevocal:render singer set value "' + s + '"'
	path = f'MineVocal/data/minevocal/functions/singers/{s}'
	if not os.path.exists(path): os.makedirs(path)
	with open(f'{path}/setup.mcfunction', mode="w", encoding="utf-8") as f: f.write(text)
	with open(f'{path}/reg.mcfunction', mode="w", encoding="utf-8") as f: f.write(f'execute if data storage minevocal:main {{Singer: "{s}"}} run function minevocal:singers/{s}/setup')
