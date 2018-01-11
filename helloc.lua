
package.cpath = package.cpath .. ';./cmodules/hello/?.so'

local hello = require("hello")

local s = hello.say_hello("Hello, world")
print(s)
