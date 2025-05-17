CC = clang
CFLAGS = \
	-target x86_64-pc-win32-coff \
	-mno-red-zone -fno-stack-protector \
	-fshort-wchar \
	-Wall
LLD = lld-link
LLDFLAGS = /subsystem:efi_application
ENTRY = EfiMain
TARGET = BOOTX64.EFI
SRCS = hello.c
OBJS = $(SRCS:.c=.o)

$(TARGET): $(OBJS)
	$(LLD) $(LLDFLAGS) /entry:$(ENTRY) /out:$@ $^

$(OBJS): $(SRCS)
	$(CC) $(CFLAGS) -c $(SRCS)

all: $(OBJS) $(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)
