# multi-tone sampling weight calculation
scoreboard players set #mv.sp minevocal.var 0
scoreboard players set #mv.ap minevocal.var 0
data modify storage minevocal:render temp._mtv set from storage minevocal:render temp.mtv
function minevocal:render/mtv
scoreboard players operation #mv.sp minevocal.var /= $mv.100 minevocal.const
scoreboard players operation #mv.ap minevocal.var /= $mv.100 minevocal.const

# ap bias
execute if score mv.rou minevocal.var matches 1.. run function minevocal:render/ap/biasup
execute if score mv.rou minevocal.var matches ..-1 run function minevocal:render/ap/biasdown

# sine volume
scoreboard players operation #mv.s.v minevocal.var = $mv.10000 minevocal.const
scoreboard players operation #mv.s.v minevocal.var -= #mv.ap minevocal.var
scoreboard players operation #mv.s.v minevocal.var *= mv.vol minevocal.var
scoreboard players operation #mv.s.v minevocal.var /= $mv.100 minevocal.const
scoreboard players operation #mv.s.v minevocal.var *= #mv.sp minevocal.var

# noise compute
scoreboard players operation #mv.n.v minevocal.var = #mv.ap minevocal.var
scoreboard players operation #mv.n.v minevocal.var *= mv.vol minevocal.var
scoreboard players operation #mv.n.v minevocal.var /= $mv.100 minevocal.const
scoreboard players operation #mv.n.v minevocal.var *= #mv.sp minevocal.var
function minevocal:render/noise/into

execute if score mv.docache minevocal.var matches 1 run function minevocal:cache/push
execute unless score mv.docache minevocal.var matches 1 if score #mv.s.v minevocal.var matches 200001..2000000000 run function minevocal:play/lookup

# debug
# tellraw @s [{"score":{"name":"#mv.tone", "objective": "minevocal.var"}},{"text":" "},{"score":{"name":"#mv.s.v", "objective": "minevocal.var"}}]

data remove storage minevocal:render temp.hs[0]
execute store result score #mv.delta minevocal.var run data get storage minevocal:render temp.hs[0] 1.0
scoreboard players operation #mv.targ minevocal.var += #mv.delta minevocal.var