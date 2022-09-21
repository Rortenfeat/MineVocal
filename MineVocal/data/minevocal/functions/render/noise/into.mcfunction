scoreboard players operation #mv.n.t minevocal.var = #mv.tone minevocal.var
scoreboard players operation #mv.n.t minevocal.var /= $mv.6 minevocal.const

execute if score #mv.n._t minevocal.var matches 0 run function minevocal:render/noise/bottom
execute unless score #mv.n._power minevocal.var matches 0.. run scoreboard players set #mv.n._power minevocal.var 0

scoreboard players operation #mv.n.r minevocal.var = #mv.n.t minevocal.var
scoreboard players operation #mv.n.r minevocal.var -= #mv.n._t minevocal.var
scoreboard players set #mv.n.d minevocal.var 0
execute if score #mv.n.r minevocal.var matches 1.. run function minevocal:render/noise/cal/step
execute if score #mv.n.r minevocal.var matches ..0 run function minevocal:render/noise/cal/overlap

scoreboard players operation #mv.n._t minevocal.var = #mv.n.t minevocal.var
scoreboard players operation #mv.n._power minevocal.var = #mv.n.power minevocal.var