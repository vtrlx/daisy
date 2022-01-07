FONTSDIR ?= ~/.local/share/fonts
OTB = daisy.otb daisy_bold.otb

all: $(OTB)

deploy:
	zip /var/www/htdocs/daisy.zip daisy.bdf daisy_bold.bdf

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
	fonttosfnt -b -c -g 2 -m 2 -o $@ $<

.PHONY: clean install

clean:
	rm -f *.otb
