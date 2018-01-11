
local users = {}

users[#users+1] = "James"
users[#users+1] = "Bill"
users[#users+10] = "Peter"

users["key1"] = "val1"
users["key2"] = "val2"
users["key3"] = "val3"

print("User count: " .. #users)

for i = 1, #users do
    print(i, users[i])
end

print("===")

for k, v in pairs(users) do
    print(k, v)
end

print("===")

-- mimic OOP
local parent = {key1 = "val1", key2 = "val2"}
local child =  setmetatable({key3 = "val3"}, {__index = parent})

print("Key1 from child: ", child["key1"])
print("Key3 from child: ", child["key3"])

child.getKey = function(self, k)
   return self[k] 
end

print("Key2 from child: ", child.getKey(child, "key2"))
print("Key2 from child: ", child:getKey("key2"))
