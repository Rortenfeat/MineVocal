# get note info for fundamental frequency. between C3(48) and C6(84). else set to default 60(C4)
execute store result score mv.note minevocal.var run data get storage minevocal:main Note 1.0
execute unless score mv.note minevocal.var matches 48..84 run function minevocal:misc/note2midi
execute unless score mv.note minevocal.var matches 48..84 run scoreboard players set mv.note minevocal.var 60

# get gender factor for spectral envelope shift. between -12 and 12 (2 octaves). else set to default 0
# lower to get more female like and higher to get more male like
execute store result score mv.gen minevocal.var run data get storage minevocal:main Gender 1.0
execute unless score mv.gen minevocal.var matches -12..12 run scoreboard players set mv.gen minevocal.var 0

# get roughness for aperiodicity bias. between -100(completely sine) and 100(completely noise). else set to default 0
execute store result score mv.rou minevocal.var run data get storage minevocal:main Roughness 1.0
execute unless score mv.rou minevocal.var matches -100..100 run scoreboard players set mv.rou minevocal.var 0

# get volume. between 1 and 100. else set to default 100
execute store result score mv.vol minevocal.var run data get storage minevocal:main Volume 1.0
execute unless score mv.vol minevocal.var matches 1..100 run scoreboard players set mv.vol minevocal.var 100

# get singer selection.
data remove storage minevocal:render singer
data remove storage minevocal:render library
execute if data storage minevocal:main Singer run function #minevocal:singers
execute unless data storage minevocal:render singer run tellraw @s [{"text": "[MineVocal] ", "bold":true, "color": "yellow"}, {"translate": "mv.error", "color": "red"}, {"translate": "mv.error.unknownsinger", "bold": false, "color": "white"}]

execute if data storage minevocal:render singer run function minevocal:render/into