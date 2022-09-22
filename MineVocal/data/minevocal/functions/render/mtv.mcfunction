execute store result score #mv.mtv.sp minevocal.var run data get storage minevocal:render temp.sp[0][0] 200000.0
execute store result score #mv.mtv.ap minevocal.var run data get storage minevocal:render temp.ap[0][0] 10000.0
execute store result score #mv.mtv.v minevocal.var run data get storage minevocal:render temp._mtv[0] 1.0
data remove storage minevocal:render temp._mtv[0]
data remove storage minevocal:render temp.sp[0][0]
data remove storage minevocal:render temp.ap[0][0]

scoreboard players operation #mv.mtv.sp minevocal.var *= #mv.mtv.v minevocal.var
scoreboard players operation #mv.mtv.ap minevocal.var *= #mv.mtv.v minevocal.var

scoreboard players operation #mv.sp minevocal.var += #mv.mtv.sp minevocal.var
scoreboard players operation #mv.ap minevocal.var += #mv.mtv.ap minevocal.var

execute store success score #mv.mtv.test1 minevocal.var run data get storage minevocal:render temp._mtv[0]
execute if score #mv.mtv.test1 minevocal.var matches 1 run function minevocal:render/mtv