function minevocal:cache/pull
execute if score #mv.s.v minevocal.var matches 200001..2000000000 run function minevocal:play/lookup
execute store success score #mv.test1 minevocal.var run data get storage minevocal:render temp.sine[0]
execute if score #mv.test1 minevocal.var matches 1 run function minevocal:play/loop