CC = gcc
CFLAGS = -Wall -Werror -g -std=c99

dirBackup = ./dirBackup
nomAperturas = serie_ipc_aperturas.csv
nomDivisiones = serie_ipc_divisiones.csv

dirCadenas = ./cadenas
dirComunes = ./comunes
dirMaster = ./master
dirProceso = ./proceso
dirSecPal = ./SecuenciaPalabras
dirVector = ./vector

all: pruebaTP

pruebaTP: 
	$(CC) $(CFLAGS) master.c -L. 


restaurarCSV:
	rm nomAperturas nomDivisiones
	cp $(dirBackup)/$(nomAperturas) ./
	cp $(dirBackup)/$(nomDivisiones) ./

clear:
	rm pruebaTP

