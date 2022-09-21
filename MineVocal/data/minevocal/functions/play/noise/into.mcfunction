execute store result score #mv.n.power minevocal.var run data get storage minevocal:render temp.noise[0] 1.
execute if score #mv.n.t minevocal.var matches 12..98 run function minevocal:play/noise/compress/into
execute if score #mv.n.t minevocal.var matches 12..98 if score #mv.n.power minevocal.var matches 1..2000000000 run function minevocal:play/noise/lookup

scoreboard players add #mv.n.t minevocal.var 1
data remove storage minevocal:render temp.noise[0]
execute store success score #mv.test1 minevocal.var run data get storage minevocal:render temp.noise[0] 1.0
execute if score #mv.test1 minevocal.var matches 1 run function minevocal:play/noise/into