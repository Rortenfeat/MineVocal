data modify storage minevocal:render cache.sine append value {tone: 0s, vol:0l}
execute store result storage minevocal:render cache.sine[-1].tone short 1.0 run scoreboard players get #mv.tone minevocal.var
execute store result storage minevocal:render cache.sine[-1].vol long 1.0 run scoreboard players get #mv.s.v minevocal.var