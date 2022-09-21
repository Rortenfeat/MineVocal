scoreboard players operation #mv.n.power minevocal.var = #mv.n.v minevocal.var
scoreboard players operation #mv.n.power minevocal.var += #mv.n._power minevocal.var
execute unless score #mv.n.power minevocal.var matches 0..2000000000 run scoreboard players set #mv.n.power minevocal.var 2000000000
execute store result storage minevocal:render temp.noise[-1] long 1.0 run scoreboard players get #mv.n.power minevocal.var