#include "lua.h"
#include "lauxlib.h"

#define MESSAGE "hello world!"

int say_hello(lua_State *L) {
    const char *name;
    name = lua_tostring(L, -1);
    lua_pushstring(L, name);
    return 1;
}

static const struct luaL_Reg functions [] = {
    {"say_hello", say_hello},
    {NULL, NULL}
};

static void createmetatable (lua_State *L) {
  lua_createtable(L, 0, 1);  /* table to be metatable for strings */
  lua_pushliteral(L, "");  /* dummy string */
  lua_pushvalue(L, -2);  /* copy table */
  lua_setmetatable(L, -2);  /* set table as metatable for strings */
  lua_pop(L, 1);  /* pop dummy string */
  lua_pushvalue(L, -2);  /* get string library */
  lua_setfield(L, -2, "__index");  /* metatable.__index = string */
  lua_pop(L, 1);  /* pop metatable */
}

int luaopen_hello(lua_State *L) {
    //luaL_register(L, "hello", functions);
    luaL_newlib(L, functions);
    createmetatable(L);
    return 1;
}
