data modify storage minevocal:render temp.mt set from storage minevocal:render temp.ft_list[0].mt
data modify storage minevocal:render temp.mtv set value [0s]
execute store result score #mv.mt.t minevocal.var run data get storage minevocal:render temp.mt[0]
scoreboard players operation #mv.mt._t minevocal.var = #mv.mt.t minevocal.var

execute if score #mv.mt.t minevocal.var >= mv.note minevocal.var run data modify storage minevocal:render temp.mtv set value [100s]
execute if score #mv.mt.t minevocal.var < mv.note minevocal.var run function minevocal:render/mt/main