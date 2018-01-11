LUA_DIR=/usr/local/lua-5.3
LUA_LIBDIR=$(LUA_DIR)/include
LIBFLAG= -shared -fpic

hello.so:	hello.c
	$(CC) -o hello.so $(LIBFLAG) $(CFLAGS) hello.c -I$(LUA_LIBDIR) -llua

clean:
	$(RM) hello.so
