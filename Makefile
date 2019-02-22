FONTSDIR ?= ~/.fonts
PCF = daisy.pcf daisy_bold.pcf

all: $(PCF)

install: $(FONTSDIR) $(PCF)
	install -t $^
	mkfontdir $<
	mkfontscale $<
	xset +fp $<
	xset fp rehash
	fc-cache
	fc-cache -fv

$(FONTSDIR):
	mkdir $@

%.pcf: %.bdf
	bdftopcf -o $@ $<
