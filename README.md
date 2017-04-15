Introduction
============

This document introduces the options and usage of the class
`TUD_NA_PhD_thesis.cls`, which is intended for easily typesetting a PhD thesis
made at the Delft University of Technology, The Netherlands.

Loading the class
=================

This class can be loaded with the command

    \documentclass[<options>]{TUD_NA_PhD_thesis}

Minimal working example
=======================

A MWE for this class is

    \documentclass{TUD_NA_PhD_thesis}
    \title{Your PhD thesis title}
    \begin{document}
    \frontmatter
    \maketitle
    \tableofcontents
    % include here your summary, samenvatting and/or preface
    \mainmatter
    % include here your chapters
    \appendix
    % include here your appendices
    \backmatter
    \setcounter{chapter}{0}
    % include here your cv, list of publications
    \end{document}

This MWE and any other base file can be compiled easily to a PDF by using

    latexmk -gg -f -bibtex -ps -pdfps <file>

for the DVI→PS→PDF route or by using

    latexmk -gg -f -bibtex -pdf <file>

Class options
=============

This class has several options.  The following options load the the packages
`fncychap` and `fncypart` and set the chapter and part styles:

*   `Sonny`;
*   `Lenny`;
*   `PetersLenny` (similar to `Lenny`);
*   `Bjornstrup`;
*   `DennisBjornstrup` (like `Bjornstrup` but with "Chapter" or "Part" in front of the chapter/part
    number);
*   `Glenn`;
*   `Conny`;
*   `Rejne`;
*   `Bjarne`.

For an example of the chapter styles see the [fncychap documentation].  When
specifying more than one of the above options, only the last one will be
active.

[fncychap documentation]: https://www.ctan.org/tex-archive/macros/latex/contrib/fncychap/fncychap.pdf

The remaining class options are:

*   `chapterbib`

    This option loads the package chapterbib and redefines a few commands to
    obtain a bibliography per chapter.  Default of the class is one
    bibliography for the entire document.

*   `authoryear`

    This option enforces the author-year format for citations and the
    bibliography.  Default of the class is the numbered format.

Preamble commands
=================

This package provides several new commands for convenience to use between
`\documentclass[<options>]{TUD_NA_PhD_thesis}` and `\begin{document}`:

*   `\setbibfile{<file>}`

    This command sets the use of `<file>.bib` as being your Bibtex repository.
    The default of the class is `<jobname>.bib`, with `<jobname>` the name of your
    main Latex file.

*   `\setbibstyle{<file>}`

    This command sets the use of `<file>.bst` as being your Bibtex style.  The
    default of the class is `plainnat.bst`.

Document commands
=================

*   `\printbibliography`

    This command prints the bibliography at the place requested and as defined
    by the options set by the commands `\setbibfile{<file>}` and
    `\setbibstyle{<file>}` and the options `chapterbib` and `authoryear`.

*   `\Switch{<S>}{<P>}{<p>}`

    This command must be used within your Bibtex repository for first authors
    with a surname prefix.  The correct syntax within the Bibtex repository is:

        author = {\Switch{<S>}{<P>}{<p>}} <S>, <I> and ... }

    Here `<S>` is the surname without prefixes, `<P>` are the prefixes with the
    first letter capitalised, `<p>` the prefixed without capitals and `<I>` are the
    initials or first names.  For example, "Dennis den Ouden" must be given
    as:

        author = {\Switch{Ouden}{Den}{den}} Ouden, D, and ... }

    This command will force Bibtex to sort on the surname without prefixes, but
    will print the prefixes capitalised when using `\cite` and noncapitalised
    in front of the surname in the bibliography.

*   `\bibentry{<handle>}`

    This command will print at the given location a full citation for the entry
    `<handle>` in your Bibtex repository.  These citations will not appear in
    any of bibliographies, thanks to Joost van Zwieten.

*   `\basedon{<handle1>}[<handle2>]`

    This command will print at the bottom of the current page a full citation
    for the entry `<handle1>` and possible for the entry `<handle2>` in your
    Bibtex repository, with the text:

        This chapter is based on the article(s):
        ...

    These citations will not appear in any of bibliographies, thanks to Joost
    van Zwieten.

*   `\basedon*{<handle1>}[<handle2>]`

    This command will print at the bottom of the current page a full citation
    for the entry `<handle1>` and possible for the entry `<handle2>` in your
    Bibtex repository, with the text:

        This chapter is based on the article(s):
        ...
        and additional work.

    These citations will not appear in any of bibliographies, thanks to Joost
    van Zwieten.

*   `\chapter[<short title>]{<title>}[<subtitle>]`

    This command is an adapted version of the original `\chapter` command,
    which will typeset `<subtitle>` in italic below the main chapter title.

*   `\part[<short title>]{<title>}[<subtitle>]`

    This command is an adapted version of the original `\part` command, which
    will typeset `<subtitle>` in italic below the main part title.

Title page commands
===================

The following commands must be used between \documentclass[<options>]{TUD NA PhD thesis}
and \begin{document} and will typeset the correct information on the mandatory title page.

*   `\title{<title>}`

    This commands sets the title to `<title>`.  You can use `\\ ∼` to enforce a
    line break in the main title.  The space `∼` must be included for later
    use.

*   `\subtitle{<subtitle>}`

    This commands sets the subtitle to `<subtitle>`.  You cannot use line
    breaks in the subtitle.

*   `\firstname{<firstnames>}`

    This command sets your first (given) names to `<firstnames>`.  Please
    provide all your first (given) names.  This command also automatically sets
    your initials by taking all first letters of each name.

*   `\lastname{<lastname>}`

    This command sets your last (sur) names to `<lastname>`.  Please also
    provide any prefixes.

*   `\initials{<initials>}`

    This command sets your initials to `<initials>`.  Only use this function if
    `\firstname` does not provide the correct initials and only after
    `\firstname` has been used.

*   `\academictitle{<at>}`

    This command sets your academic title to `<at>`.  Default value is
    "wiskundig ingenieur".  Please use dutch titles if possible.  If you have
    obtained your title outside of The Netherlands, please also provide the
    country of where you obtained the title, in Dutch.

*   `\birthplace{<bp>}`

    This command sets your birth place to `<bp>`.  Please provide city and
    country, all in Dutch.

*   `\defencedate{<dd>}{<mm>}{<yyyy>}`

    This command sets your defence date to `<dd>-<mm>-<yyyy>`.

*   `\defencetime{<hh>}{<mm>}`

    This command sets your defence time to `<hh>:<mm>`.

*   `\promotor{<name>}[<aff>]`

    For every time this command is issued, a promotor is added to the
    committee, with name `<name>` and affiliation `<aff>`.  If `<aff>` is not
    provided, the default value "Technische Universiteit Delft" is inserted.

*   `\copromotor{<name>}[<aff>]`

    For every time this command is issued, a copromotor is added to the
    committee, with name `<name>` and affiliation `<aff>`.  If `<aff>` is not
    provided, the default value "Technische Universiteit Delft" is inserted.

*   `\committeemember{<name>}{<aff>}`

    For every time this command is issued, a committee member is added to the
    committee, with name `<name>` and affiliation `<aff>`.  If you wish to
    include the text

    > `<name>` heeft als begeleider in belangrijke mate aan de totstandkoming
    > van het proefschrift bijgedragen.

    below the committee, use the command `\committeemember*{<name>}{<aff>}`.

*   `\sparemember{<name>}[<aff>]`

    For every time this command is issued, a spare member is added to the
    committee, with name `<name>` and affiliation `<aff>`.  If `<aff>` is not
    provided, the default value "Technische Universiteit Delft" is inserted.

*   `\supervisor{<name>}`

    For every time this command is issued, the text 

    > `<name>` heeft als begeleider in belangrijke mate aan de totstandkoming
    > van het proefschrift bijgedragen.

    is added below the committee.

*   `\logo{<file>}`

    If you wish to include a logo on the back of the title page, please use this
    command.  Currently this command only supports one logo.

*   `\extratext{<text>}`

    This commands adds `<text>` below the copyright for every execution.

*   `\isbn{<number>}`

    This commands adds the ISBN `<number>` below the copyright.

*   `\printer{<company>}`

    This commands adds

    > Printed by: `<company>`

    below the copyright.

*   `\publisher{<company>}`

    This commands adds

    > Published by: `<company>`

    below the copyright.

The order in which the committee is printed is:

1.  Rector Magnificus;
2.  Promotors;
3.  Copromotors;
4.  Other committee members;
5.  Spare member.

The associated commands must also be given in this order.

Disclaimer
==========

I have done my best to adhere to the rules as stated for the title page in the
Doctoral Regulations and Implementation Decree from the Graduate School of the
Delft University of Technology, but I will not guarantee correctness, so please
confirm with the beadle and/or Graduate School before printing.  If changes are
mandatory, please adjust this in `titlepage.tex`.  If you have done so, please
let me know.

Any other bugs or improvements are also welcome.
