data remove storage minevocal:render temp.ft_list[0]
execute store success score #mv.test2 minevocal.var run data get storage minevocal:render temp.ft_list[0]
execute if score #mv.test2 minevocal.var matches 1 run function minevocal:render/phones/1