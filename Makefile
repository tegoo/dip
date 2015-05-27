
BUILD_DIR 	= build
MAIN_TEX	= main.tex
SRC 		= $(wildcard *.tex)
JOB_NAME	= output

all: view

view: compile
	xdg-open $(BUILD_DIR)/$(JOB_NAME).pdf

compile: $(BUILD_DIR)/$(JOB_NAME).pdf

$(BUILD_DIR)/$(JOB_NAME).pdf: $(BUILD_DIR) $(SRC)
	xetex -jobname=$(JOB_NAME) -output-directory $(BUILD_DIR) $(MAIN_TEX)
	xetex -jobname=$(JOB_NAME) -output-directory $(BUILD_DIR) $(MAIN_TEX)
	bibtex8 -B -c utf8cyrillic.csf $(BUILD_DIR)/$(JOB_NAME).aux
	xetex -jobname=$(JOB_NAME) -output-directory $(BUILD_DIR) $(MAIN_TEX)
	xetex -jobname=$(JOB_NAME) -output-directory $(BUILD_DIR) $(MAIN_TEX)

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)