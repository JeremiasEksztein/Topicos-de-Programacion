CC = gcc
CFLAGS = -Wall -Werror -O2 -std=c99


SRC_DIRS = master vector secuenciaPalabras proceso cadenas comunes
SRC = $(foreach dir,$(SRC_DIRS),$(filter-out %/prueba.c %/pruebaVector.c,$(wildcard $(dir)/*.c)))
OBJ = $(SRC:.c=.o)

TARGET = pruebaTP

nomAperturas = serie_ipc_aperturas.csv
nomDivisiones = serie_ipc_divisiones.csv
dirBackup = backup

.PHONY: all clean restaurarCSV

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ)


# Listado de headers
HDR = $(wildcard master/*.h vector/*.h secuenciaPalabras/*.h proceso/*.h cadenas/*.h comunes/*.h tablaDeDatos/*.h)

%.o: %.c $(HDR)
	$(CC) $(CFLAGS) -c $< -o $@

restaurarCSV:
	rm -f $(nomAperturas) $(nomDivisiones)
	cp $(dirBackup)/$(nomAperturas) ./
	cp $(dirBackup)/$(nomDivisiones) ./

clean:
	rm -f $(OBJ) $(TARGET)



