FONTSDIR ?= ~/.fonts
PCF = daisy.pcf daisy_bold.pcf

all: $(PCF)

deploy:
  zip /var/www/htdocs/daisy.zip daisy.bdf daisy_bold.bdf

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
