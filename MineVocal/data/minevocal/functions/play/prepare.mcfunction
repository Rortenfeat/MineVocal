schedule clear minevocal:stop
function minevocal:stop

execute unless entity @e[tag=mv.spe] run tag @s add mv.spe
execute unless entity @a[tag=mv.lis] run tag @a add mv.lis