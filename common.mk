.PHONY:all clean
SRCS = $(wildcard *.c)   #scan all source files
OBJS = $(SRCS:.c=.o)     #replace all source files from .c to .o
DEPS = $(SRCS:.c=.d)
BIN := $(addprefix /home/david/share/mp3/, $(BIN))
LINK_OBJ_DIR = /home/david/share/mp3/app/link_obj
$(shell mkdir -p $(LINK_OBJ_DIR))
OBJS := $(addprefix $(LINK_OBJ_DIR)/, $(OBJS))  #add prefix
LINK_OBJ = $(wildcard $(LINK_OBJ_DIR)/*.o)
LINK_OBJ += $(OBJS)
all: $(BIN) $(OBJS) $(DEPS)
ifneq ("$(wildcard $(DEPS))", "")
include $(DEPS)
endif 
$(BIN):$(LINK_OBJ)
	echo "LINK_OBJ=$(LINK_OBJ)"
	gcc -o $@  $^
$(LINK_OBJ_DIR)/%.o:%.c
	gcc -o $@ -c $(filter %.c, $^)
%.d:%.c
	gcc -MM $^ > $@
clean:
	rm -f $(BIN) $(OBJS) $(DEPS)
