.PHONY:all clean
SRCS = $(wildcard *.c)   #scan all source files
OBJS = $(SRCS:.c=.o)     #replace all source files from .c to .o
DEPS = $(SRCS:.c=.d)
BIN := $(addprefix $(BUILD_ROOT)/, $(BIN))
LINK_OBJ_DIR = $(BUILD_ROOT)/app/link_obj
$(shell mkdir -p $(LINK_OBJ_DIR))
OBJS := $(addprefix $(LINK_OBJ_DIR)/, $(OBJS))  #add prefix
LINK_OBJ = $(wildcard $(LINK_OBJ_DIR)/*.o)
LINK_OBJ += $(OBJS)
DEP_DIR = $(BUILD_ROOT)/app/dep
$(shell mkdir -p $(DEP_DIR))
DEPS := $(addprefix $(DEP_DIR)/, $(DEPS))
all: $(BIN) $(OBJS) $(DEPS)
ifneq ("$(wildcard $(DEPS))", "")
include $(DEPS)
endif 
$(BIN):$(LINK_OBJ)
	gcc -o $@  $^
$(LINK_OBJ_DIR)/%.o:%.c
	gcc -I$(HEAD_PATH) -o $@ -c $(filter %.c, $^)
$(DEP_DIR)/%.d:%.c
	gcc -I$(HEAD_PATH) -MM $^ | sed 's,\(.*\).o[ :]*, $(LINK_OBJ_DIR)/\1.o:,g' > $@
clean:
	rm -f $(BIN) $(OBJS) $(DEPS)
