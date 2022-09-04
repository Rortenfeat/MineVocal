# rou<0, f(ap)=(rou+100)*ap/100
scoreboard players operation #mv.math1 minevocal.var = mv.rou minevocal.var
scoreboard players operation #mv.math1 minevocal.var += $mv.100 minevocal.const
scoreboard players operation #mv.math1 minevocal.var *= #mv.ap minevocal.var
scoreboard players operation #mv.math1 minevocal.var /= $mv.100 minevocal.const
scoreboard players operation #mv.ap minevocal.var = #mv.math1 minevocal.var