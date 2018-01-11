
local ffi = require("ffi")

ffi.cdef[[
    typedef unsigned int mode_t;
    typedef long int time_t;
    typedef long int ssize_t;
    struct timeval {
        long int tv_sec;     /* seconds */
        long int tv_usec;    /* microseconds */
    };
    struct tm {
        int tm_sec;         /* seconds */
        int tm_min;         /* minutes */
        int tm_hour;        /* hours */
        int tm_mday;        /* day of the month */
        int tm_mon;         /* month */
        int tm_year;        /* year */
        int tm_wday;        /* day of the week */
        int tm_yday;        /* day in the year */
        int tm_isdst;       /* daylight saving time */
    };

    int gettimeofday(struct timeval *tv, void *tz);
    struct tm *localtime(const time_t *timep);
    time_t time(time_t *t);
 ]]

local name = ...
--
-- @param boolean as_float
-- @return float|table, float if as_float=ture, table(sec, usec) otherwise
--
local function microtime(as_float)
    local tm = ffi.new("struct timeval");
    ffi.C.gettimeofday(tm, nil)
    local sec =  tonumber(tm.tv_sec)
    local usec =  tonumber(tm.tv_usec)
    if as_float then
        return sec + usec * 10^-6
    else
        return {sec, usec}
    end
end

--local ts = microtime(true)

--print("Timestamp: ", ts)
return {
    microtime = microtime,
    --name = name
}

