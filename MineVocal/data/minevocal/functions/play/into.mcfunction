function minevocal:play/prepare
data modify storage minevocal:render temp.sine set from storage minevocal:render cache.sine
function minevocal:play/loop
data modify storage minevocal:render temp.noise set from storage minevocal:render cache.noise
scoreboard players set #mv.n.t minevocal.var 0
function minevocal:play/noise/into
schedule function minevocal:stop 4s append