--[[
    gSQL Code examples
]]--

local driver = 'tmysql' -- We can imagine this as a config-file's variable
--- The same code works with the MySQLOO and SQLite drivers
local database = {       -- Idem
    host = 'localhost',
    port = nil, -- Default port will be used (3306)
    name = 'gsql',
    user = 'root',
    pass = ''
}
--- We're creating the new gsql object, which will be used to do our queries
local db = Gsql:new(driver, database, function (success, message)
    if not success then
        MsgC(Color(137, 222, 255), 'gSQL -- ', Color(139, 0, 0), ' CAN\'T CONNECT TO THE DATABASE.\n')
        return
    end
    MsgC(Color(137, 222, 255), 'gSQL -- Connected to the', Color(85, 207, 71), ' database', Color(137, 222, 255), '.\n')
end)

--- We can do a simple query
local parameters = {
    ['name'] = 'Gabyfle'
}
db:query('SELECT * FROM development WHERE name = {{name}}', parameters, function (success, message, data)
    if not success then print(message) return end
    PrintTable(data)
end)

--- Or a prepared one
local index = db:prepare('SELECT * FROM development WHERE number = ?')
db:execute(index, {7000}, function(success, message, data)
    if not success then print(message) return end
    PrintTable(data)
end)
