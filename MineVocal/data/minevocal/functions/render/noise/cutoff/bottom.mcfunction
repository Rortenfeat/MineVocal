data modify storage minevocal:render temp.noise append value 0l
scoreboard players remove #mv.n.pt minevocal.var 1
execute if score #mv.n.pt minevocal.var matches 1.. run function minevocal:render/noise/cutoff/bottom