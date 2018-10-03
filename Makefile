# Ethan Malenchek
# CS3560
# This a makefile designed for the example project provided for HW #5
# 9/25/2018

.DEFAULT_GOAL := all

all: game main.o game.o othello.o doc

build: game

game: main.o game.o othello.o
	g++ -o game main.cc game.cc othello.cc

main.o: main.cc game.h othello.h
	g++ -c main.cc

game.o: game.cc game.h
	g++ -c game.cc

othello.o: othello.cc othello.h game.h piece.h colors.h
	g++ -c othello.cc

doc:
	doxygen -g
	doxygen Doxyfile

clean:
	rm -f -rf html latex
	rm -f game main.o game.o othello.o Doxyfile
