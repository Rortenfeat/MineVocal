execute unless score mv.docache minevocal.var matches 1 run function minevocal:play/prepare
execute if score mv.docache minevocal.var matches 1 run data modify storage minevocal:render cache set value {sine:[], noise:[]}

data modify storage minevocal:render temp.sp set from storage minevocal:render temp.ft_list[0].sp
data modify storage minevocal:render temp.ap set from storage minevocal:render temp.ft_list[0].ap

# sp shift
scoreboard players operation #mv.gen minevocal.var = mv.gen minevocal.var
execute if score #mv.gen minevocal.var matches ..-1 run function minevocal:render/sp/push
execute if score #mv.gen minevocal.var matches 1.. run function minevocal:render/sp/pull

# harmonic series
scoreboard players operation #mv.targ minevocal.var = mv.note minevocal.var
# convert midi from 12edo to 72edo
function minevocal:misc/72edo
execute if score #mv.targ minevocal.var matches 1.. run function minevocal:render/crop

scoreboard players operation #mv.targ minevocal.var = mv.note minevocal.var
function minevocal:misc/72edo
scoreboard players operation #mv.tone minevocal.var = #mv.targ minevocal.var

data modify storage minevocal:render temp.hs set value [0,72,42,30,23,19,16,14,12,11,10,9,8,8,7,7,6,6,6,5,5,5,5,4,4,4,4,4,4,3,4,3,3,3,3,3,3,3,3,2,3,2,3,2,2,3,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,2]
data modify storage minevocal:render temp.noise set value [0l]
scoreboard players set #mv.n._t minevocal.var 0
scoreboard players set #mv.n._power minevocal.var 0
function minevocal:render/hs

# play noise
scoreboard players set #mv.n.t minevocal.var 0
execute unless score mv.docache minevocal.var matches 1 run function minevocal:play/noise/into
execute if score mv.docache minevocal.var matches 1 run data modify storage minevocal:render cache.noise set from storage minevocal:render temp.noise

# schedule stop after 4s
execute unless score mv.docache minevocal.var matches 1 run schedule function minevocal:stop 4s append