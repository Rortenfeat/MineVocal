data remove storage minevocal:render temp.sp[0]
data remove storage minevocal:render temp.ap[0]
scoreboard players remove #mv.targ minevocal.var 1
execute if score #mv.targ minevocal.var matches 1.. run function minevocal:render/crop