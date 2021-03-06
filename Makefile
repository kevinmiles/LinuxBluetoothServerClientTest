CC = gcc

INC = 
LIB = -lbluetooth
OLD_LIB = -lbluetooth -lsdp -lsdp_lib
INSTALL = /usr/local/bin

#FLAGS = $(CFLAGS) -Wall -g -DDEBUG -DDEBUG_INFO -DDEBUG_MAIN -DDEBUG_BT -DDEBUG_NET -DDEBUG_BT_DISCOVER -DDEBUG_BTNET -DDEBUG_NET_INFO
#FLAGS = $(CFLAGS) -Wall -g -DDEBUG -DDEBUG_INFO -DDEBUG_MAIN -DDEBUG_BT -DDEBUG_NET -DDEBUG_BT_DISCOVER -DDEBUG_BTNET -DDEBUG_BTNET_INFO -DDEBUG_BT_INFO -DDEBUG_BTNET_INFO2
FLAGS = $(CFLAGS) -Wall -g -DDEBUG -DDEBUG_INFO -DDEBUG_MAIN -DDEBUG_BT -DDEBUG_NET -DDEBUG_BT_DISCOVER -DDEBUG_BTNET -DDEBUG_BTNET_INFO -DDEBUG_BT_INFO -DDEBUG_BTNET_INFO2

OBJ = main.o rfcomm-server.o rfcomm-client.o hciscan.o service-register.o 
EXEC = rfcomm

all: $(OBJ)
	$(CC) $(FLAGS) -o $(EXEC) $(OBJ) $(LIB)
	
old_libs: $(OBJ)
	$(CC) $(FLAGS) -o $(EXEC) $(OBJ) $(OLD_LIB)

.c.o:
	$(CC) $(FLAGS) -c $< $(INC)

clean:
	rm -f $(OBJ) $(EXEC)

install: all 
	cp $(EXEC) $(INSTALL)
