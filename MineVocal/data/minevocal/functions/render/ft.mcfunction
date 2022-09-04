data modify storage minevocal:render temp.ft_list set from storage minevocal:render library
function minevocal:render/phones/1

execute unless score #mv.test1 minevocal.var matches 0 run tellraw @s [{"text": "[MineVocal] ", "bold":true, "color": "yellow"}, {"translate": "mv.error", "color": "red"}, {"translate": "mv.error.unknownphone", "bold": false, "color": "white", "with":[{"nbt": "Phone", "storage": "minevocal:main", "color": "green"}, {"nbt": "singer", "storage": "minevocal:render", "color": "aqua"}]}]
execute if score #mv.test1 minevocal.var matches 0 run function minevocal:render/main