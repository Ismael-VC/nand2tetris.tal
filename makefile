.ONESHELL:                   #

build: setup
	drifblim src/hack.tal bin/hack.rom

setup:
	mkdir -p bin/ tmp/src tmp/test

release:   
	cat deps/libtal/macros.tal deps/libtal/devices.tal deps/libtal/routines.tal deps/zental/routines.tal src/routines/gates.tal src/routines/chips.tal src/routines/hack.tal deps/zental/data.tal > tmp/src/Nand2Tetris.tal

run: bin/hack.rom
	uxn11 bin/hack.rom

test: setup
	cat \
		deps/libtal/macros.tal \
		deps/libtal/devices.tal \
		src/routines/symbols.tal \
		\
		src/routines/main.tal \
		\
		deps/libtal/routines.tal \
		deps/zental/routines.tal \
		src/routines/gates.tal \
		src/routines/chips.tal \
		\
		deps/zental/data.tal \
		\
		test/gates/data.tal \
		test/gates/gates.tal \
		test/chips/chips.tal > tmp/Nand2Tetris.tal
	drifblim tmp/Nand2Tetris.tal bin/Nand2Tetris.rom
	uxn11 bin/Nand2Tetris.rom

clean:
	rm -rf bin tmp
