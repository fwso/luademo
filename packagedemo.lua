-- import package
--

package.path = package.path .. ';./packages/?.lua'
print("Search path: ", package.path)

print("\n");

local hello = require("demo.hello")

local obj1 = hello:new("HELO, ")
local obj2 = hello:new("Hi, ")

obj1:print("world")
obj2:print("world")
obj2.print(obj1, "world")
