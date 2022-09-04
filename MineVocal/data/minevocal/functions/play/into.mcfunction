function minevocal:play/prepare
data modify storage minevocal:render temp.cache set from storage minevocal:render cache
function minevocal:play/loop
schedule function minevocal:stop 4s append