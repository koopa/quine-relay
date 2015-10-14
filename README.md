# Quine Relay

[![Build Status](https://travis-ci.org/mame/quine-relay.svg?branch=master)](https://travis-ci.org/mame/quine-relay)

## What this is

This is a Ruby program that generates
Scala program that generates
Scheme program that generates
...(through 100 languages in total)...
REXX program that generates
the original Ruby code again.

![Language Uroboros][langs]

[langs]: https://raw.github.com/mame/quine-relay/master/langs.png

(If you want to see the old 50-language version, see [50](https://github.com/mame/quine-relay/tree/50) branch.)

## Usage

### Ubuntu 15.04 "Vivid Vervet"

#### 1. Install all interpreters/compilers.

First, type the following apt-get command to install all of them.

    $ sudo apt-get install afnix algol68g aplus-fsf asymptote \
      ats-lang-anairiats bash bc bf boo bsdgames cduce clisp clojure1.6 \
      cmake coffeescript dc ecere-sdk emacs24 erlang f2c falconpl \
      fp-compiler fsharp g++ gambas3-script gap gauche gawk gcc gdc genius \
      gforth gfortran ghc ghostscript gnat gnu-smalltalk gnuplot gobjc \
      golang gpt gri groff groovy haxe icont iconx intercal iverilog \
      jasmin-sable julia kaya libgd2-xpm-dev libpng12-dev lisaac llvm lua5.2 \
      make maxima mlton mono-devel mono-mcs mono-vbnc nasm neko nickle ocaml \
      octave open-cobol openjdk-6-jdk pari-gp parrot perl php5-cli pike7.8 \
      python r-base ratfor regina-rexx rhino ruby2.1 scala scilab slsh \
      spl-core swi-prolog tcl ucblogo valac xsltproc yorick zoem

Then, build the bundled interpreters.

    $ make -C vendor

#### 2. Run each program on each interpreter/compiler.

    $ ruby QR.rb > QR.scala
    $ scalac QR.scala && scala QR > QR.scm
    $ gosh QR.scm > QR.sci
    $ scilab -nw -nb -f QR.sci > QR.bash
    $ bash QR.bash > QR.sl
    $ slsh QR.sl > QR.st
    $ gst QR.st > QR.spl
    $ splrun QR.spl > QR.sml
    $ mlton @MLton fixed-heap 200M -- QR.sml && ./QR > QR.sq
    $ ruby vendor/subleq.rb QR.sq > QR.tcl
    $ tclsh QR.tcl > QR.t
    $ ruby vendor/thue.rb QR.t > QR.unl
    $ ruby vendor/unlambda.rb QR.unl > QR.vala
    $ valac QR.vala && ./QR > QR.v
    $ iverilog -o QR QR.v && ./QR -vcd-none > QR.vb
    $ vbnc QR.vb && mono ./QR.exe > QR.ws
    $ ruby vendor/whitespace.rb QR.ws > QR.xslt
    $ xsltproc QR.xslt > QR.yorick
    $ yorick -batch QR.yorick > QR.azm
    $ zoem -i QR.azm > QR.+
    $ a+ QR.+ > qr.adb
    $ gnatmake qr.adb && ./qr > QR.als
    $ axi QR.als > QR.a68
    $ a68g QR.a68 > QR.ante
    $ ruby vendor/ante.rb QR.ante > QR.asy
    $ asy QR.asy > QR.dats
    $ atscc -o QR QR.dats && ./QR > QR.awk
    $ awk -f QR.awk > QR.bc
    $ BC_LINE_LENGTH=4000000 bc -q QR.bc > QR.bef
    $ cfunge QR.bef > QR.Blc
    $ ruby vendor/blc.rb < QR.Blc > QR.boo
    $ booi QR.boo > QR.bf
    $ bf QR.bf > QR.c
    $ gcc -o QR QR.c && ./QR > QR.cpp
    $ g++ -o QR QR.cpp && ./QR > QR.cs
    $ mcs QR.cs && mono QR.exe > QR.cd
    $ cduce QR.cd > QR.chef
    $ PERL5LIB=vendor/local/lib/perl5 compilechef QR.chef QR.chef.pl &&
      perl QR.chef.pl > QR.clj
    $ clojure QR.clj > QR.cob
    $ cobc -O2 -x QR.cob && ./QR > QR.coffee
    $ coffee QR.coffee > QR.lisp
    $ clisp QR.lisp > QR.d
    $ gdc -o QR QR.d && ./QR > QR.dc
    $ dc QR.dc > QR.ec
    $ ecp -c QR.ec -o QR.sym && ecc -c QR.ec -o QR.c && ecs -console QR.sym QR.imp -o QR.main.ec &&
      ecp -c QR.main.ec -o QR.main.sym && ecc -c QR.main.ec -o QR.main.c &&
      gcc -o QR QR.c QR.main.c -lecereCOM && ./QR > QR.el
    $ emacs -Q --script QR.el > QR.erl
    $ escript QR.erl > QR.fsx
    $ fsharpc QR.fsx -o QR.exe && mono QR.exe > QR.fal
    $ falcon QR.fal > QR.false
    $ ruby vendor/false.rb QR.false > QR.fs
    $ gforth QR.fs > QR.f
    $ f2c QR.f && gcc -o QR QR.c -L/usr/lib -lf2c -lm && ./QR > QR.f90
    $ gfortran -o QR QR.f90 && ./QR > QR.gbs
    $ gbs3 QR.gbs > QR.g
    $ gap -q QR.g > QR.gel
    $ genius QR.gel > QR.plt
    $ gnuplot QR.plt > QR.go
    $ go run QR.go > QR.gpt
    $ gpt -o QR QR.gpt && ./QR > QR.gri
    $ gri QR.gri > QR.groovy
    $ groovy QR.groovy > QR.hs
    $ ghc QR.hs && ./QR > QR.hx
    $ haxe -main QR -neko QR.n && neko QR.n > QR.icn
    $ icont -s QR.icn && ./QR > QR.i
    $ ick -bfO QR.i && ./QR > QR.j
    $ jasmin QR.j && java QR > QR.java
    $ javac QR.java && java QR > QR.js
    $ rhino QR.js > QR.jl
    $ julia QR.jl > QR.k
    $ kayac QR.k && ./QR > QR.lazy
    $ lazyk QR.lazy > qr.li
    $ lisaac qr.li && ./qr > QR.ll
    $ llvm-as QR.ll && lli QR.bc > QR.logo
    $ logo QR.logo > QR.lol
    $ lci QR.lol > QR.lua
    $ lua QR.lua > QR.mk
    $ make -f QR.mk > QR.mac
    $ maxima -q --init-mac=QR.mac > QR.il
    $ ilasm QR.il && mono QR.exe > QR.asm
    $ nasm -felf QR.asm && ld -m elf_i386 -o QR QR.o && ./QR > QR.neko
    $ nekoc QR.neko && neko QR.n > QR.5c
    $ nickle QR.5c > QR.m
    $ gcc -o QR QR.m && ./QR > QR.ml
    $ ocaml QR.ml > QR.octave
    $ octave -qf QR.octave > QR.ook
    $ ruby vendor/ook-to-bf.rb QR.ook QR.ook.bf && bf QR.ook.bf > QR.gp
    $ gp -f -q QR.gp > QR.pasm
    $ parrot QR.pasm > QR.pas
    $ fpc QR.pas && ./QR > QR.pl
    $ perl QR.pl > QR.php
    $ php QR.php > QR.png
    $ npiet QR.png > QR.pike
    $ pike QR.pike > QR.ps
    $ gs -dNODISPLAY -q QR.ps > QR.ppt
    $ ppt -d < QR.ppt > QR.prolog
    $ swipl -q -t qr -f QR.prolog > QR.py
    $ python QR.py > QR.R
    $ R --slave -f QR.R > QR.ratfor
    $ ratfor -o QR.ratfor.f QR.ratfor && gfortran -o QR QR.ratfor.f &&
      ./QR > QR.rexx
    $ rexx ./QR.rexx > QR2.rb

You will see that `QR.rb` is the same as `QR2.rb`.

    $ diff QR.rb QR2.rb

Alternatively, just type `make`.

    $ make

Note: It may require huge memory to compile some files.

### Arch Linux

Just install [quine-relay-git](https://aur.archlinux.org/packages/quine-relay-git/) from AUR and run `quine-relay`.
Report any problems as comments to the AUR package or to the respective packages, if one of the many compilers should have issues.

### Other platforms

You may find [instructions for other platforms in the wiki](https://github.com/mame/quine-relay/wiki/Installation).

If you are not using these Linux distributions, please find your way yourself.
If you could do it, please let me know.  Good luck.


## Tested interpreter/compiler versions

See the [Travis CI log](https://travis-ci.org/mame/quine-relay).  
Note that some languages are not available in Ubuntu (marked as `*N/A*`).
This repository includes their implementations in `vendor/`.
See also `vendor/README` in detail.


## Frequently asked questions

### Q. Why?

A. [Take your pick](https://github.com/mame/quine-relay/issues/11).

### Q. How?

A. Good news: I published a book, ["The world of obfuscated, esoteric, artistic programming"](http://gihyo.jp/book/2015/978-4-7741-7643-7).
It explains how to write a quine, an ascii-art quine, and a uroboros quine like this quine-relay.
You can buy my book on [amazon.co.jp](http://www.amazon.co.jp/dp/4774176435).

It also contains my almost all (about forty) works, including
[alphabet-only Ruby program](http://www.slideshare.net/mametter/ruby-esoteric-obfuscated-ruby-programming-5088683),
[radiation-hardened quine](https://github.com/mame/radiation-hardened-quine),
etc., and explains many techniques to write such programs.

Bad news: It is written in Japanese.
I hope you could translate it to English <strike>and help me earn royalties</strike>.

### Q. Language XXX is missing!

A. See [the criteria for language inclusion][criteria] in detail.  (In short: please create a deb package and contribute it to Ubuntu.)

[criteria]: https://github.com/mame/quine-relay/wiki/Criteria-for-language-inclusion

### Q. Does it really work?

A. [![Build Status](https://travis-ci.org/mame/quine-relay.svg?branch=master)](https://travis-ci.org/mame/quine-relay)

### Q. How long did it take you?

A. [Do you try to cross the world line?](https://github.com/mame/quine-relay/issues/60)

### Q. The code does not fit into my display!

A. [Here you go][thumbnail].

[thumbnail]: https://raw.github.com/mame/quine-relay/master/thumbnail.png

### Q. How was the code generated?

A.

    $ sudo apt-get install rake ruby-cairo ruby-rsvg2 ruby-gdk-pixbuf2 \
      optipng advancecomp ruby-chunky-png
    $ cd src
    $ rake2.0 clobber
    $ rake2.0

## License

The MIT License applies to all resources
*except* the files in the `vendor/` directory.

The files in the `vendor/` directory are from third-parties
and are distributed under different licenses.
See `vendor/README` in detail.

---

The MIT License (MIT)

Copyright (c) 2013, 2014, 2015 Yusuke Endoh (@mametter), @hirekoke

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
