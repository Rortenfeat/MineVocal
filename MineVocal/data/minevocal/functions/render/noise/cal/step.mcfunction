scoreboard players add #mv.n.d minevocal.var 1
function minevocal:render/noise/cal/interp
scoreboard players operation #mv.n.power minevocal.var = #mv.n.v minevocal.var
scoreboard players operation #mv.n.power minevocal.var /= $mv.10 minevocal.const
scoreboard players operation #mv.n.power minevocal.var *= #mv.n.id minevocal.var
execute if score #mv.n.d minevocal.var < #mv.n.r minevocal.var if score #mv.n._power minevocal.var matches 1.. run function minevocal:render/noise/cal/fade
data modify storage minevocal:render temp.noise append value 0l
execute store result storage minevocal:render temp.noise[-1] long 1.0 run scoreboard players get #mv.n.power minevocal.var
execute if score #mv.n.d minevocal.var < #mv.n.r minevocal.var run function minevocal:render/noise/cal/step