# scoreboard init
scoreboard objectives add minevocal.var dummy
scoreboard objectives add minevocal.const dummy

# scoreboard const
scoreboard players set $mv.6 minevocal.const 6
scoreboard players set $mv.36 minevocal.const 36
scoreboard players set $mv.100 minevocal.const 100
scoreboard players set $mv.10000 minevocal.const 10000

function minevocal:cache/off