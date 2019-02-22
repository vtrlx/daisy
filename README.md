daisy
=====

BDF (Bitmap) font designed to be small but very readable. Glyphs are
5x8 pixels, plus an additional two pixels below. Includes a bold variant
at the same size as the non-bold.

![daisy](daisy.png)

Dependencies
------------

- bdftopcf
- make

(Most UNIXes will have these pre-installed.)

Installation
------------

    make
    make install

This will install `daisy.pcf` and `daisy_bold.pcf` to `~/.fonts` by
default. To install elsewhere, set the FONTSDIR variable before
installing:

    make
    FONTSDIR=/usr/local/share/fonts make install
