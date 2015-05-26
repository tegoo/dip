
BUILD_DIR 	:= build
MAIN_TEX	:= main.tex

all: $(BUILD_DIR)
	pdflatex -output-directory $(BUILD_DIR) $(MAIN_TEX)
	pdflatex -output-directory $(BUILD_DIR) $(MAIN_TEX)
	bibtex8 -B -c utf8cyrillic.csf main.aux
	pdflatex -output-directory $(BUILD_DIR) $(MAIN_TEX)
	pdflatex -output-directory $(BUILD_DIR) $(MAIN_TEX)
	xdg-open main.pdf

$(BUILD_DIR):
	mkdir $(BUILD_DIR)