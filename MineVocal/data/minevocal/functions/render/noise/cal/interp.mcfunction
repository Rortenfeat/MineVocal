scoreboard players operation #mv.n.i minevocal.var = #mv.n.d minevocal.var
scoreboard players operation #mv.n.i minevocal.var *= $mv.10 minevocal.const
scoreboard players operation #mv.n.i minevocal.var /= #mv.n.r minevocal.var

execute if score #mv.n.i minevocal.var matches ..4 run scoreboard players set #mv.n.id minevocal.var 0
execute if score #mv.n.i minevocal.var matches 5..6 run scoreboard players set #mv.n.id minevocal.var 1
execute if score #mv.n.i minevocal.var matches 7 run scoreboard players set #mv.n.id minevocal.var 2
execute if score #mv.n.i minevocal.var matches 8 run scoreboard players set #mv.n.id minevocal.var 4
execute if score #mv.n.i minevocal.var matches 9 run scoreboard players set #mv.n.id minevocal.var 7
execute if score #mv.n.i minevocal.var matches 10.. run scoreboard players set #mv.n.id minevocal.var 10

execute if score #mv.n.i minevocal.var matches 6.. run scoreboard players set #mv.n._id minevocal.var 0
execute if score #mv.n.i minevocal.var matches 4..5 run scoreboard players set #mv.n._id minevocal.var 1
execute if score #mv.n.i minevocal.var matches 3 run scoreboard players set #mv.n._id minevocal.var 2
execute if score #mv.n.i minevocal.var matches 2 run scoreboard players set #mv.n._id minevocal.var 4
execute if score #mv.n.i minevocal.var matches 1 run scoreboard players set #mv.n._id minevocal.var 7
execute if score #mv.n.i minevocal.var matches ..0 run scoreboard players set #mv.n._id minevocal.var 10