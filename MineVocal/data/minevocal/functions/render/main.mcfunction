function minevocal:play/prepare
execute if score mv.docache minevocal.var matches 1 run data modify storage minevocal:render cache set value []

data modify storage minevocal:render temp.sp set from storage minevocal:render temp.ft_list[0].sp
data modify storage minevocal:render temp.ap set from storage minevocal:render temp.ft_list[0].ap

# sp shift
scoreboard players operation #mv.gen minevocal.var = mv.gen minevocal.var
execute if score #mv.gen minevocal.var matches ..-1 run function minevocal:render/sp/push
execute if score #mv.gen minevocal.var matches 1.. run function minevocal:render/sp/pull

# harmonic series
scoreboard players set #mv.tone minevocal.var 0
scoreboard players operation #mv.targ minevocal.var = mv.note minevocal.var
# convert midi from 12edo to 36edo
function minevocal:misc/36edo
data modify storage minevocal:render temp.hs set value [0,36,21,15,12,9,8,7,6,6,5,4,4,4,4,3,3,3,3,3,2,3,2,2,2,2,2,2,2,2,1,2]
function minevocal:render/hs