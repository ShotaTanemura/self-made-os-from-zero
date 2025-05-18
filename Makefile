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
SRCDIR = src
OBJDIR = obj
SRCFILES = \
	hello.c
SRCS = $(SRCFILES:%.c=$(SRCDIR)/%.c)
OBJS = $(SRCFILES:%.c=$(OBJDIR)/%.o)

$(TARGET): $(OBJS)
	$(LLD) $(LLDFLAGS) /entry:$(ENTRY) /out:$@ $^

$(OBJS): $(OBJDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

all: $(OBJS) $(TARGET)

clean:
	rm -rf $(OBJDIR) $(TARGET)
