data modify storage minevocal:render temp.sp prepend value 0.0d
scoreboard players add mv.gen minevocal.var 1
execute if score mv.gen minevocal.var matches ..-1 run function minevocal:render/sp/push