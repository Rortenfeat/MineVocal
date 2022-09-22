scoreboard players operation #mv.mt.r minevocal.var = #mv.mt.t minevocal.var
scoreboard players operation #mv.mt.r minevocal.var -= #mv.mt._t minevocal.var
scoreboard players operation #mv.mt.d minevocal.var = mv.note minevocal.var
scoreboard players operation #mv.mt.d minevocal.var -= #mv.mt._t minevocal.var

scoreboard players operation #mv.mt.v minevocal.var = $mv.100 minevocal.const
scoreboard players operation #mv.mt.v minevocal.var *= #mv.mt.d minevocal.var
scoreboard players operation #mv.mt.v minevocal.var /= #mv.mt.r minevocal.var

scoreboard players operation #mv.mt._v minevocal.var = $mv.100 minevocal.const
scoreboard players operation #mv.mt._v minevocal.var -= #mv.mt.v minevocal.var

execute store result storage minevocal:render temp.mtv[-1] short 1.0 run scoreboard players get #mv.mt._v minevocal.var
data modify storage minevocal:render temp.mtv append value 0s
execute store result storage minevocal:render temp.mtv[-1] short 1.0 run scoreboard players get #mv.mt.v minevocal.var