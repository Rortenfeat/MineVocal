execute store result score #mv.sp minevocal.var run data get storage minevocal:render temp.sp[0] 200000.0
execute store result score #mv.ap minevocal.var run data get storage minevocal:render temp.ap[0] 10000.0

# ap bias
execute if score mv.rou minevocal.var matches 1.. run function minevocal:render/ap/biasup
execute if score mv.rou minevocal.var matches ..-1 run function minevocal:render/ap/biasdown

# sine volume
scoreboard players operation #mv.s.v minevocal.var = $mv.10000 minevocal.const
scoreboard players operation #mv.s.v minevocal.var -= #mv.ap minevocal.var
scoreboard players operation #mv.s.v minevocal.var *= mv.vol minevocal.var
scoreboard players operation #mv.s.v minevocal.var /= $mv.100 minevocal.const
scoreboard players operation #mv.s.v minevocal.var *= #mv.sp minevocal.var

# noise volume
scoreboard players operation #mv.n.v minevocal.var = #mv.ap minevocal.var
scoreboard players operation #mv.n.v minevocal.var *= mv.vol minevocal.var
scoreboard players operation #mv.n.v minevocal.var /= $mv.100 minevocal.const
scoreboard players operation #mv.n.v minevocal.var *= #mv.sp minevocal.var

execute if score mv.docache minevocal.var matches 1 run function minevocal:cache/push
execute unless score mv.docache minevocal.var matches 1 run function minevocal:play/lookup
execute unless score mv.docache minevocal.var matches 1 run schedule function minevocal:stop 4s append

data remove storage minevocal:render temp.hs[0]
execute store result score #mv.delta minevocal.var run data get storage minevocal:render temp.hs[0] 1.0
scoreboard players operation #mv.targ minevocal.var += #mv.delta minevocal.var