#import "hamnosys.typ": *

#let title = "HamNoSys module for Typst"
#let author = "Bethany E. Toma"

#set document(author: author, title: title)
#set page(numbering: "1", number-align: center)
#set text(font: "Linux Libertine", lang: "en")

#show link: underline

// Display block code in a larger block
// with more padding.
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 8pt,
  radius: 4pt,
)

// Title row.
#align(center)[
    #block(text(weight: 700, 1.75em, title))
]
#pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
        columns: (1fr,),
        gutter: 1em,
        align(center, strong(author)),
    ),
)

#set par(justify: true)

#outline()

= Introduction

The Hamburg Notation System (abbreviated "HamNoSys") is a transcription system for signed languages developed at the University of Hamburg and first introduced to the public in 1987. It was principally designed for use in linguistic documentation of and research on signed languages, similarly to how the International Phonetic Alphabet (IPA) is used for spoken language.

The most recent release of HamNoSys is version 4.1, which was published in 2001. For more information about the structure and usage of HamNoSys, check out the following resources:

- #link("https://www.sign-lang.uni-hamburg.de/lrec/pub/04001.pdf")["HamNoSys -– Representing Sign Language Data in Language
Resources and Language Processing Contexts" by Thomas Hanke] (relatively short and dense but a good introduction to the system's structure)
- #link("https://robertsmithresearch.files.wordpress.com/2012/10/hamnosys-user-guide-rs-draft-v3-0.pdf")["HamNoSys 4.0 User Guide" by Robert Smith] (a longer description of how to use the system, good for beginners)
- #link("https://www.sign-lang.uni-hamburg.de/projekte/hamnosys/hns4.0/englisch/hns4.pdf")["HamNoSys 4.0" from University of Hamburg] (specifically describes differences between version 4.0 and earlier versions and thus assumes some familiarity with HamNoSys)

This module is designed to make the use of HamNoSys symbols in Typst documents easier with a number of helper functions. It's inspired by the #link("https://ctan.org/pkg/hamnosys?lang=en")[_hamnosys_ TeX package] and designed with as much compatibility as possible in mind to ease the transition from TeX to Typst for those familiar with the TeX package.

== Requirements

HamNoSys characters are not in Unicode as of April 2023, so they are instead rendered using characters in the Unicode Private Use Area and a custom font. As a result, the HamNoSysUnicode is required to render the characters in your Typst document. A #raw(".ttf") file for this font is included as part of this module, and it can also be downloaded as part of the #link("https://www.fdr.uni-hamburg.de/record/9725")[HamNoSys Software Package] from the University of Hamburg, which also includes an application (available for Mac, Linux, and Windows) for inputting HamNoSys characters. Alternatively, there is also #link("https://www.sign-lang.uni-hamburg.de/hamnosys/input/")[a web interface] available.

== License

Copyright © 2023 Bethany E. Toma. This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program.  If not, see #link("https://www.gnu.org/licenses/").

The HamNoSysUnicode 4.0 TrueType font was obtained under a #link("https://creativecommons.org/licenses/by/4.0/legalcode")[Creative Commons Attribution 4.0 International] license as part of the #link("https://www.fdr.uni-hamburg.de/record/9725")[HamNoSys software package].

= Usage

Due to the use of characters from the Unicode Private Use Area, there is little meaningful overlap between characters in the HamNoSysUnicode font and characters in a more typical font. As a result, simply adding the HamNoSysUnicode font to the end of one's font list in a #raw("#set") statement is enough to automatically render HamNoSys symbols in the correct font while displaying other text correctly.

#align(center,
    [```typst 
        #set text(font: ("Linux Libertine", "HamNoSysUnicode"))
        ```
    ]
)

This results in behavior that appears identical to that of the _hamnosys_ TeX package when used with the optional _autofont_ parameter. However, like _autofont_, this comes with some caveats. 

HamNoSys does use a small set of regular Unicode characters in addition to characters from the private use area, and under these circumstances they will be displayed using the default font rather than using their HamNoSys variants. While this could be changed by swapping the order of the fonts, this would result in the opposite problem - those characters would now _only_ use their HamNoSys variants, even in regular text.

In addition, other fonts that make use of the Private Use Area could interfere with this method. For instance, in Linux Libertine the character #raw("U+E000") displays Tux, the Linux mascot: \u{e000}. Naturally this would interfere with use of this hex for the fist symbol in HamNoSys.

This module provides two ways around these problems. One is the #raw("#hamnosys") function, which renders all text within its scope exclusively using the HamNoSysUnicode font. It can also pass along any other parameters that one could give the #raw("#text") function, with the obvious exception of the #raw("font") parameter. 

#align(center,
    [```typst 
        #hamnosys(size: 24pt)[\u{20}\u{e00a}\u{e00e}\u{e010}\u{e027}\u{e03d}\u{e042}\u{e059}\u{e0d0}\u{e0e2}\u{e082}\u{e0aa}\u{e007}\u{e010}\u{e0e3}\u{20}]
        ```
    #hamnosys(size: 24pt)[\u{20}\u{e00a}\u{e00e}\u{e010}\u{e027}\u{e03d}\u{e042}\u{e059}\u{e0d0}\u{e0e2}\u{e082}\u{e0aa}\u{e007}\u{e010}\u{e0e3}\u{20}]
    ]
)

The HamNoSys codepoints passed to this function can be specified using Unicode escape sequences (as show above) or by simply inputting the actual Unicode characters into one's text editor; while most text editors will not correctly render the characters, they will be correcly rendered in the pdf itself as long as the HamNoSysUnicode font is accessible to Typst.

The other option is a set of expressions that can be used to input HamNoSys characters without knowing the Unicode escape sequences or copy-pasting the Unicode PUA characters themselves. These correspond almost exactly to the "symbol commands" and "symbol names" provided in the _hamnosys_ TeX package, with the only principal difference being the use of #raw\# in accordance with Typst syntax.

#align(center,
    grid(
        columns: (1fr,),
        rows: (auto,auto),
        gutter: 1em,
            [
            ```typst
            #text(size: 24pt)[
            #hamceeall#hamthumbopenmod#hamfingerstraightmod#hamextfingerul
            #hampalmdl#hamforehead#hamlrat#hamclose#hamparbegin#hammover#hamreplace
            #hampinchall#hamfingerstraightmod#hamparend
            ]
            ```
            ],
        text(size: 24pt)[
        #hamceeall#hamthumbopenmod#hamfingerstraightmod#hamextfingerul
        #hampalmdl#hamforehead#hamlrat#hamclose#hamparbegin#hammover#hamreplace
        #hampinchall#hamfingerstraightmod#hamparend
        ]
    )
)