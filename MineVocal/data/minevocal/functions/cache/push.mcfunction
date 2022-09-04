data modify storage minevocal:render cache append value {tone: 0s, vol:[0l, 0l]}
execute store result storage minevocal:render cache[-1].tone short 1.0 run scoreboard players get #mv.tone minevocal.var
execute store result storage minevocal:render cache[-1].vol[0] long 1.0 run scoreboard players get #mv.s.v minevocal.var
execute store result storage minevocal:render cache[-1].vol[1] long 1.0 run scoreboard players get #mv.n.v minevocal.var