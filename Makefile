##
## EPITECH PROJECT, 2019
## Project libmy_malloc.so
## File description:
## Build libmy_malloc.so binary.
##

SRC	=	src/strlen.asm	\
		src/memmove.asm 	\
		src/memcpy.asm 	\
		src/memset.asm 	\
		src/strchr.asm 	\
		src/strcmp.asm 	\
		src/strncmp.asm 	\
		src/strcasecmp.asm 	\
		src/rindex.asm 	\
		src/strstr.asm 	\
		src/strpbrk.asm 	\
		src/strcspn.asm	\
		src/read.asm	\
		src/write.asm


OBJ	=	$(SRC:.asm=.o)

CFLAGS	=	-shared -fPIC

LDFLAGS =	-f elf64

NAME	=	libasm.so

CC	=	nasm
LD	=	ld

all:	$(NAME)

%.o: %.asm
	$(CC) -o $@ $< $(LDFLAGS)


$(NAME):	$(OBJ)
	$(LD) $(CFLAGS) -o $(NAME) $(OBJ)


clean:
	rm -f $(OBJ)
	rm -f $(UT_OBJ)

fclean: clean
	rm -f $(NAME)
	rm -f units
	rm -f *.html

re: fclean all
