BUILDDIR=build
LATEXMK=latexmk -lualatex -shell-escape -f
INKSCAPE=NO_AT_BRIDGE=1 dbus-run-session inkscape
FIGDIR=assets/figures
DRAWIO=drawio
OUT=report

SVGS=$(wildcard $(FIGDIR)/*.svg)
DIOS=$(wildcard $(FIGDIR)/*.drawio)
PDFS=$(wildcard $(FIGDIR)/*.pdf)
PYFS=$(wildcard $(FIGDIR)/*.py)
FIGS_SVG=$(patsubst %.svg, $(BUILDDIR)/%.svg.pdf, $(SVGS))
FIGS_DIO=$(patsubst %.drawio, $(BUILDDIR)/%.drawio.pdf, $(DIOS))
FIGS_PDF=$(patsubst %.pdf, $(BUILDDIR)/%.pdf, $(PDFS))
FIGS_PY=$(patsubst %.py, $(BUILDDIR)/%.py.pdf, $(PYFS))

FIGS=$(FIGS_SVG) $(FIGS_DIO) $(FIGS_PDF) $(FIGS_PY)

BLUE=\033[1;34m
GREEN=\033[1;32m
RESET=\033[0m

all: $(OUT).tex $(FIGS) | $(BUILDDIR)
	$(LATEXMK) -pdf $<

figures: $(FIGS)

$(FIGS_SVG): $(BUILDDIR)/%.svg.pdf: %.svg | dirs
	@printf "$(GREEN)Converting svg diagram '$<' to '$@'$(RESET)\n"
	$(INKSCAPE) --export-area-drawing -o $@ $<

$(FIGS_PY): $(BUILDDIR)/%.py.pdf: %.py | dirs
	python3 $< > $@


$(FIGS_DIO): $(BUILDDIR)/%.drawio.pdf: %.drawio | dirs
	@printf "$(BLUE)Converting drawio diagram '$<' to '$@'$(RESET)\n"
	xvfb-run $(DRAWIO) --crop --export --format pdf --output $@ $<

$(FIGS_PDF): $(BUILDDIR)/%.pdf: %.pdf | dirs
	cp $< $@

dirs: $(BUILDDIR)

$(BUILDDIR): $(BUILDDIR)/$(FIGDIR)

$(BUILDDIR)/$(FIGDIR):
	mkdir -p $@

clean:
	$(RM) $(BUILDDIR)/$(OUT).*
	$(LATEXMK) -C

mrproper:
	$(RM) -rf $(BUILDDIR)

biber: bibliography.bib
	biber --tool --validate-datamodel $<

.PHONY: all figures dirs clean mrproper biber