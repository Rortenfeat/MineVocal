execute store result score #mv.tone minevocal.var run data get storage minevocal:render temp.cache[0].tone 1.0
execute store result score #mv.s.v minevocal.var run data get storage minevocal:render temp.cache[0].vol[0] 1.0
execute store result score #mv.n.v minevocal.var run data get storage minevocal:render temp.cache[0].vol[1] 1.0
data remove storage minevocal:render temp.cache[0]