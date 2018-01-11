local ffitime = require("ffidemo.time")

local ts = ffitime.microtime(true)
print("Timestamp: ", ts)
