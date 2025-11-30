# TARGET_TINYGO = embedfire-py32f002b
# TARGET_PYOCD = py32f002bx5
# CMSIS_PACK = PY32F002B

TARGET_TINYGO = embedfire-py32f030
TARGET_PYOCD = py32f030x8
CMSIS_PACK = PY32F030


build:
	tinygo build --size html --serial uart --scheduler tasks --gc leaking --target ${TARGET_TINYGO} -o py32.elf blinky3.go
	arm-none-eabi-objdump -dS py32.elf > py32.S

flash: build
	pyocd load -t ${TARGET_PYOCD} py32.elf

gdb:
	pyocd gdb --target ${TARGET_PYOCD} --semihosting --persist

install-pack:
	pyocd pack install ${CMSIS_PACK}

rtt:
	pyocd rtt -t ${TARGET_PYOCD}
