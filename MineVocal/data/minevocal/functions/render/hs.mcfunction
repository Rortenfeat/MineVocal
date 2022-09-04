execute if score #mv.targ minevocal.var = #mv.tone minevocal.var run function minevocal:render/cal

scoreboard players add #mv.tone minevocal.var 1
data remove storage minevocal:render temp.sp[0]
data remove storage minevocal:render temp.ap[0]
execute store success score #mv.test1 minevocal.var run data get storage minevocal:render temp.hs[0] 1.0
execute store success score #mv.test2 minevocal.var run data get storage minevocal:render temp.sp[0] 1.0
execute if score #mv.test1 minevocal.var matches 1 if score #mv.test2 minevocal.var matches 1 run function minevocal:render/hs