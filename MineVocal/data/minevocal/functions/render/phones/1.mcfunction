data modify storage minevocal:render temp.phone set from storage minevocal:main Phone
execute store success score #mv.test1 minevocal.var run data modify storage minevocal:render temp.phone set from storage minevocal:render temp.ft_list[0].phone
execute if score #mv.test1 minevocal.var matches 1 run function minevocal:render/phones/2