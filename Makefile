# --- Variables ---
PROJECT = "TGA Data Analysis"
FILE = presentation.qmd
OUTPUT_DIR = docs
PYTHON = python
PIP = pip

.PHONY: preview render pdf clean install check

preview:
	quarto preview $(FILE)

render:
	quarto render $(FILE) 

pdf:
	quarto render $(FILE) --to pdf

clean:
	rm -rf _site/ _freeze/ .quarto/ $(OUTPUT_DIR)/ *.html *.pdf
	find . -type d -name "__pycache__" -exec rm -rf {} +

install:
	$(PIP) install -r requirements.txt

check:
	@echo "Active Python: $$(which $(PYTHON))"
	@echo "Active Pip:    $$(which $(PIP))"
	@echo "Active Quarto: $$(which quarto)"