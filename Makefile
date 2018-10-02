# Ethan Malenchek
# CS3560
# This a makefile designed for the example project provided for HW #5
# 9/25/2018

.DEFAULT_GOAL := all

all: game main.o game.o othello.o archive

game: main.o game.o othello.o
	g++ -o game main.cc game.cc othello.cc

main.o: main.cc game.h othello.h
	g++ -c main.cc

game.o: game.cc game.h
	g++ -c game.cc

othello.o: othello.cc othello.h game.h piece.h colors.h
	g++ -c othello.cc

archive: main.cc game.cc othello.cc othello.h colors.h game.h piece.h Makefile
	tar -cvf homework_5_game.tar .


clean:
	rm edit game main.o game.o othello.o
