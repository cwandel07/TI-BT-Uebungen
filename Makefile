# Variablen definieren (erleichtert spätere Änderungen)
ASM = nasm
ASMFLAGS = -o

# Ordnernamen
SRC_DIR = boot
OUT_DIR = out

# Das Standard-Ziel (wird ausgeführt, wenn du nur "make" tippst)
all: $(OUT_DIR)/boot1.flp

# Regel zum Erstellen des Ausgabe-Ordners und Kompilieren
$(OUT_DIR)/boot1.flp: $(SRC_DIR)/boot.asm
	echo making $(SRC_DIR)/boot.asm
	mkdir -p $(OUT_DIR)
	$(ASM) $(ASMFLAGS) $(OUT_DIR)/boot1.flp $(SRC_DIR)/boot.asm

# Aufräumen (löscht den out-Ordner wieder)
clean:
	rm -rf $(OUT_DIR)

run:
	qemu-system-x86_64 -drive file=out/boot1.flp,format=raw,if=floppy