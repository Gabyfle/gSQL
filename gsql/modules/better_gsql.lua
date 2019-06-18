--  > this allow you to call « gsql( ... ) » instead of « gsql:new( ... ) »

gsql = gsql or {}
setmetatable( gsql, { __call = function( self, ... )
      return self:new( ... )
end } )
