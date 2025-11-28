build:
	tinygo build --size html --target embedfire-py32f002b .
	arm-none-eabi-objdump -dS py32.elf > py32.S

flash: build
	pyocd load -t py32f002bx5 py32.elf

gdb:
	pyocd gdb --target py32f002bx5 --semihosting --persist

install-pack:
	pyocd pack install PY32F002B