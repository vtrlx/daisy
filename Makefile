FONTSDIR ?= ~/.local/share/fonts
OTB = daisy.otb daisy_bold.otb

all: $(OTB)

install: $(FONTSDIR) $(OTB)
	install -t $^
	mkfontdir $<
	mkfontscale $<
	xset +fp $<
	xset fp rehash
	fc-cache
	fc-cache -fv

$(FONTSDIR):
	mkdir $@

%.otb: %.bdf
	fonttosfnt -b -c -r -g 2 -m 2 -o $@ $<

.PHONY: clean install

clean:
	rm -f *.otb
