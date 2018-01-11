local hello = {}

function hello.new(self, prefix)
    return setmetatable({prefix = prefix}, {__index = self})
end

function hello.print(self, msg)
    print(self.prefix, msg)
end

return hello
