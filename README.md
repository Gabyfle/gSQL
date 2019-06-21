# gSQL
gSQL - Simple Query Library 

## What's this ?

**gSQL** is a simple object-oriented library designed to make effortless the use of the different existing SQL modules. The goal is that the developers only have to send the SQL queries and parameters, gSQL takes care of security and error management.

**With gSQL, write your code only ONCE and use it on any supported driver!**

## Supported modules
1. **[MySQLOO](https://github.com/FredyH/MySQLOO)** : An object oriented MySQL module for Garry's Mod
1. **[SQLite](https://wiki.garrysmod.com/page/Category:sql)** : Access powerful database software included with Garry's Mod
1. **[tMySQL4](https://github.com/bkacjios/gm_tmysql4)** : An other MySQL module for Garry's Mod

## Features
* Lightweight, only 5 methods
* Freaking easy to use
* **Write your code only once** to use it with several drivers
* Error logs management
* Security management: send your parameters, gSQL does the rest
* Parameter system in unprepared queries
* **Cache connections** to avoid connecting to the same database several times!

## Available functions

**gSQL** includes a total of 5 functions that will allow you to interact with your SQL server in a basic way.

### Constructor : `Gsql:new()`

* Prototype : `Gsql:new(driver, dbhost, dbname, dbuser, dbpass, port, callback)`
* Description : This function creates a new **gSQL** object and return it.
* Example :
```lua
local database = {
    host = 'localhost',
    name = 'gsql',
    user = 'root',
    pass = '',
    port = 3306
}
local db = Gsql:new('sqlite', database, function(success, message)
    print(success)
    print(message)
end)
-- We could call it like that :
-- Gsql:new('sqlite', database.host, database.name, database.user, database.pass, database.port, function()end)
-- better_gsql.lua (by @Guthen) add the possibility to directly call the constructor :
local db = Gsql('sqlite', database, function(success, message)
    print(success)
    print(message)
end)
```

### Query : `Gsql:query()`

* Prototype : `Gsql:query(sqlStr, parameters, callback)`
* Description : This function do a basic query to the SQL server that has been set in `gsql:new`
* Example :
```lua
local parameters = {
    ['userid'] = ply:SteamID64()
}
db:query('SELECT * FROM development WHERE steamid = {{userid}}', parameters, function (success, message, data)
    if not success then print(message) return end
end)
```

### Prepare : `Gsql:prepare()`

* Prototype : `Gsql:prepare(sqlStr)`
* Description : Creates a prepared query and returns its ID in an internal table.
* Example :
```lua
local index = db:prepare('SELECT * FROM development WHERE number = ?')
```

### Delete : `Gsql:delete()`

* Prototype : `Gsql:prepare(index)`
* Description : Delete a prepared query, identified by its index, from an internal table
* Example :
```lua
if not db:delete(index) then
    print('An error occurred here, see your logs for more details.')
end
```

### Execute : `Gsql:execute()`

* Prototype : `Gsql:execute(index, parameters, callback)`
* Description : Execute a prepared query, identified by its index
* Example :
```lua
local index = db:prepare('SELECT * FROM development WHERE number = ?')
db:execute(index, {1533}, function(success, message, data)
    if not success then print(message) return end
    PrintTable(data)
end)
```

## License
This code is distributed free of charge under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). The code is distributed "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND. For more information, please visit [LICENSE](https://github.com/Gabyfle/gSQL/blob/master/LICENSE)
