data remove storage minevocal:render temp.mt[0]
execute store result score #mv.mt.t minevocal.var run data get storage minevocal:render temp.mt[0]

execute if score #mv.mt.t minevocal.var > mv.note minevocal.var run function minevocal:render/mt/cal
execute if score #mv.mt.t minevocal.var = mv.note minevocal.var run data modify storage minevocal:render temp.mtv append value 100s
execute if score #mv.mt.t minevocal.var < mv.note minevocal.var run scoreboard players operation #mv.mt._t minevocal.var = #mv.mt.t minevocal.var

execute store success score #mv.mt.test1 minevocal.var run data get storage minevocal:render temp.mt[0]
execute if score #mv.mt.test1 minevocal.var matches 1 if score #mv.mt.t minevocal.var < mv.note minevocal.var run data modify storage minevocal:render temp.mtv append value 0s
execute if score #mv.mt.test1 minevocal.var matches 1 if score #mv.mt.t minevocal.var < mv.note minevocal.var run function minevocal:render/mt/main
execute unless score #mv.mt.test1 minevocal.var matches 1 if score #mv.mt.t minevocal.var < mv.note minevocal.var run data modify storage minevocal:render temp.mtv[-1] set value 100s