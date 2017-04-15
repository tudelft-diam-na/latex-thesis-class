%% TUD_NA_PhD_thesis.cls
%% Copyright 2017 Dennis den Ouden-van der Horst
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `unmaintained'.
%
% This work consists of all files listed in manifest.txt.

%% Identification

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TUD_NA_PhD_thesis}[2015/03/17 Thesis template for NA PhD of TUD] 

%% preliminary declarations

\LoadClass[a4paper,10pt]{book}

% Ifthen package for command decisions
\RequirePackage{ifthen}

% Set booleans for option-specific choices
\newboolean{chapterbibbool}
\setboolean{chapterbibbool}{false}
\newboolean{fancybool}
\setboolean{fancybool}{false}
\newif\ifinapp
\inappfalse

%% Options

% Options derived from and passed to package fncychap and fncypart
% Option 'DennisBjornstrup' is an adaptation of option 'Bjornstrup'
% For more details, see the documentation of package fncychap
\DeclareOption{Sonny}{\setboolean{fancybool}{true}\PassOptionsToPackage{\CurrentOption}{fncypart}\PassOptionsToPackage{\CurrentOption}{fncychap}}
\DeclareOption{Lenny}{\setboolean{fancybool}{true}\PassOptionsToPackage{\CurrentOption}{fncypart}\PassOptionsToPackage{\CurrentOption}{fncychap}}
\DeclareOption{PetersLenny}{\setboolean{fancybool}{true}\PassOptionsToPackage{\CurrentOption}{fncypart}\PassOptionsToPackage{\CurrentOption}{fncychap}}
\DeclareOption{Bjornstrup}{\setboolean{fancybool}{true}\PassOptionsToPackage{\CurrentOption}{fncypart}\PassOptionsToPackage{\CurrentOption}{fncychap}}
\DeclareOption{DennisBjornstrup}{\setboolean{fancybool}{true}\PassOptionsToPackage{Bjornstrup}{fncypart}\PassOptionsToPackage{Bjornstrup}{fncychap}\AtEndOfClass{%
\ChTitleVar{\raggedleft\huge\bfseries}
\PaTitleVar{\raggedleft\Huge\bfseries}
\PaNumVar{\fontsize{76}{80}\usefont{OT1}{pzc}{m}{n}\selectfont\partname~}
\ChNumVar{\fontsize{76}{80}\usefont{OT1}{pzc}{m}{n}\selectfont\ifinapp\appendixname\else\chaptername\fi~}}}
\DeclareOption{Glenn}{\setboolean{fancybool}{true}\PassOptionsToPackage{\CurrentOption}{fncypart}\PassOptionsToPackage{\CurrentOption}{fncychap}}
\DeclareOption{Conny}{\setboolean{fancybool}{true}\PassOptionsToPackage{\CurrentOption}{fncypart}\PassOptionsToPackage{\CurrentOption}{fncychap}}
\DeclareOption{Rejne}{\setboolean{fancybool}{true}\PassOptionsToPackage{\CurrentOption}{fncypart}\PassOptionsToPackage{\CurrentOption}{fncychap}}
\DeclareOption{Bjarne}{\setboolean{fancybool}{true}\PassOptionsToPackage{\CurrentOption}{fncypart}\PassOptionsToPackage{\CurrentOption}{fncychap}}

% Option ''chapterbib'
% This option should be used if bibliography per chapter is wished
\DeclareOption{chapterbib}{\setboolean{chapterbibbool}{true}}

% Option 'authoryear'
% This option should be used if citations should be in author (year) style.
\DeclareOption{authoryear}{} % empty action, as this option is passed implicitly to the needed classes and packages

\ProcessOptions\relax

%% Loading of packages

% Geometry to set the correct paper size and margins for publishing
\RequirePackage[paperwidth=170mm,paperheight=240mm,margin=20mm,dvips]{geometry}
% Babel package.
% Both dutch and english are loaded, as the title page is in dutch.
\RequirePackage[main=english,dutch]{babel}
% Datetime package for typesetting the title page.
\RequirePackage[dayofweek]{datetime}
% Emptypage package for really empty pages before/after chapters and parts.
\RequirePackage{emptypage}
% Graphicx package for including the logo in the title page.
\RequirePackage{graphicx}
% Footmisc package for typesetting footnotes and the title page
\RequirePackage[perpage,symbol]{footmisc}
% Xparse package for command constructions
\RequirePackage{xparse}
% Natbib package for citations and bibliography
\RequirePackage[numbers]{natbib}
% Fncypart package for nice layout options for parts
% only load when option for fncypart/fncychap is given
\ifthenelse{\boolean{fancybool}}{\RequirePackage{fncypart}}{}
% Fncychap package for nice layout options for chapters
% only load when option for fncypart/fncychap is given
\ifthenelse{\boolean{fancybool}}{\RequirePackage{fncychap}}{}
% Bibentry package for typesetting your own articles/publications
\RequirePackage{bibentry}
% Caption package for nice captions
\RequirePackage[font={it}]{caption}
% Letltxmacro package for command constructions
\RequirePackage{letltxmacro}
% Fancyhdr package for nice page layout
\RequirePackage{fancyhdr}
% Chapterbib package for bibliography per chapter
% only load when option 'chapterbib' is given
\ifthenelse{\boolean{chapterbibbool}}{\RequirePackage{chapterbib}}{}
% Frame package for use in command \basedon
\RequirePackage{framed}

%% Counters

% Counter for the number of supervisors within your committee
\newcounter{SupervisorCounter}
\setcounter{SupervisorCounter}{2}

%% Storage commands with default values
\newcommand{\SubTitle}{.}
\newcommand{\FirstName}{Please define first names}
\newcommand{\LastName}{Please define last name}
\newcommand{\Initials}{Pleas define first names}
\newcommand{\BirthPlace}{Please define birth place}
\newcommand{\DefenceDate}{\today}
\newcommand{\DefenceTime}{\currenttime}
\newcommand{\AcademicTitle}{wiskundig ingenieur}
\newcommand{\Promotor}{Please define promotor}
\newcommand{\SecondPromotor}{}
\newcommand{\CoPromotor}{.}
\newcommand{\Committee}{Rector Magnificus & voorzitter \\}
\newcommand{\SuperVisor}{\setcounter{SupervisorCounter}{2}}
\newcommand{\Logo}{.}
\newcommand{\ExtraText}{.}
\newcommand{\ISBN}{Please define ISBN}
\newcommand{\Printer}{.}
\newcommand{\Publisher}{.}

%% Title page commands

% Commands to define subtitle, initials, first name, last name, birthplace, defence date, defence time and academic title
% These commands overrule the default value given above
\DeclareRobustCommand{\subtitle}[1]{\renewcommand{\SubTitle}{#1}}
\DeclareRobustCommand{\initials}[1]{\renewcommand{\Initials}{#1}}
\DeclareRobustCommand{\firstname}[1]{\renewcommand{\FirstName}{#1}\renewcommand{\Initials}{\shortenthis{#1}}}
\DeclareRobustCommand{\lastname}[1]{\renewcommand{\LastName}{#1}}
\DeclareRobustCommand{\birthplace}[1]{\renewcommand{\BirthPlace}{#1}}
\DeclareRobustCommand{\defencedate}[3]{\renewcommand{\DefenceDate}{\newdate{defence}{#1}{#2}{#3}\displaydate{defence}}}
\DeclareRobustCommand{\defencetime}[2]{\renewcommand{\DefenceTime}{#1:#2}}
\DeclareRobustCommand{\academictitle}[1]{\renewcommand{\AcademicTitle}{#1}}
% Commands to define your (co)promotor(s), committee members, supervisors and spare member
% These commands overrule the default value given above
\DeclareDocumentCommand{\promotor}{ m o }{\ifthenelse{\equal{\Promotor}{Please define promotor}}{\renewcommand{\Promotor}{#1\\}\renewcommand{\SecondPromotor}{en}}{\g@addto@macro\Promotor{#1\\}}\IfNoValueTF{#2}{\g@addto@macro\Committee{#1 & Technische Universiteit Delft, promotor \\}}{\g@addto@macro\Committee{#1 & #2, promotor \\}}}
\DeclareDocumentCommand{\copromotor}{ m o }{\renewcommand{\CoPromotor}{#1}\IfNoValueTF{#2}{\g@addto@macro\Committee{#1 & Technische Universiteit Delft, copromotor \\}}{\g@addto@macro\Committee{#1 & #2, copromotor \\}}}
\DeclareDocumentCommand {\committeemember}{ s m m }{\IfBooleanTF #1{\g@addto@macro\Committee{\footnotemark[\arabic{SupervisorCounter}]#2 & #3\stepcounter{SupervisorCounter} \\}\g@addto@macro\SuperVisor{\noindent\footnotemark[\arabic{SupervisorCounter}]#2 heeft als begeleider in belangrijke mate aan de totstandkoming van het proefschrift bijgedragen.\stepcounter{SupervisorCounter}\\}}{\g@addto@macro\Committee{#2 & #3 \\}}}
\DeclareDocumentCommand{\sparemember}{ m o }{\IfNoValueTF{#2}{\g@addto@macro\Committee{#1 & Technische Universiteit Delft, reservelid \\}}{\g@addto@macro\Committee{#1 & #2, reservelid \\}}}
\DeclareRobustCommand{\supervisor}[1]{\g@addto@macro\SuperVisor{\noindent#1 heeft als begeleider in belangrijke mate aan de totstandkoming van het proefschrift bijgedragen.\\}}
% Commands to define logo, extra text, isbn, printer and/or publisher
% These commands overrule the default value given above
\DeclareRobustCommand{\logo}[1]{\renewcommand{\Logo}{#1}}
\DeclareRobustCommand{\extratext}[1]{\ifthenelse{\equal{\ExtraText}{.}}{\renewcommand{\ExtraText}{#1\\}}{\g@addto@macro\ExtraText{#1\\}}}
\DeclareRobustCommand{\isbn}[1]{\renewcommand{\ISBN}{#1}}
\DeclareRobustCommand{\printer}[1]{\renewcommand{\Printer}{#1}}
\DeclareRobustCommand{\publisher}[1]{\renewcommand{\Publisher}{#1}}
% Weekdays in Dutch for title page
\providecommand*{\dayofweeknameiddutch}[1]{%
\ifcase#1\relax
\or zondag%
\or maandag%
\or dinsdag%
\or woensdag%
\or donderdag%
\or vrijdag%
\or zaterdag%
\fi}
% command to shorten first names to initials
\ExplSyntaxOn
\NewDocumentCommand\shortenthis{ m }
    {
        \shorten_this:n { #1 }
    }
\seq_new:N \l_shorten_seq
\cs_new_protected:Npn \shorten_this:n #1
    {
        \seq_set_split:Nnn \l_shorten_seq { ~ } { #1 }
        \seq_map_inline:Nn \l_shorten_seq
            {
                \tl_head:n { ##1 }.
            }
    }
\ExplSyntaxOff

% Command to strip linebreaks from title
\makeatletter%
  \newcommand{\patchtitle}{%
\patchcmd{\@title}{\\}{}{\patchtitle}{\@title}}%
\makeatother

% General lay-out commands

% Command needed to add a subtitle to a part
\newcommand{\clearforpart}{%
\checkoddpage
\ifoddpage
  \thispagestyle{empty}~\newpage\thispagestyle{empty}
 \else
   \thispagestyle{empty}~
\fi
}

% redefine chapter command to include an optional subtitle
\LetLtxMacro{\oldchapter}{\chapter}
\DeclareDocumentCommand{\chapter}{ o m o }{\oldchapter[\IfNoValueTF{#1}{#2}{#1}]{#2}\IfNoValueF{#3}{\vskip-3em\textit{\large#3}}}

% Redefine part command to include subtitle
\let\oldpart\part
\DeclareDocumentCommand{\part}{ o m o }{\clearforpart\begingroup
    \cleardoublepage
    \let\newpage\relax\oldpart[\IfNoValueTF{#1}{#2}{#1}]{#2}\endgroup
    \IfNoValueF{#3}{\vskip-5em
    \begin{center}#3\end{center}
    }
  \newpage
  \thispagestyle{empty}~
}

%% Bibtex-related commands

% Storage commands with default values
\newcommand{\BibStyle}{plainnat}
\newcommand{\BibFile}{\jobname}

% Commands to define your bibfile and bibstyle
% These commands overrule the default value given above
\DeclareRobustCommand{\setbibstyle}[1]{\renewcommand{\BibStyle}{#1}}
\DeclareRobustCommand{\setbibfile}[1]{\renewcommand{\BibFile}{#1}}

% Command to use footnotes nicely on first chapter page with \basedon
\makeatletter
\def\blfootnote{\xdef\@thefnmark{}\@footnotetext}
\makeatother

% Command to print the bibliography, irrespective of the option chapterbib
\DeclareRobustCommand{\printbibliography}{%
  \bibliographystyle{\BibStyle}%
  \DeclareRobustCommand{\Switch}[3]{##3}%
  \bibliography{\BibFile}%
  \DeclareRobustCommand{\Switch}[3]{##2}%
}

% Create the aux-file for use with \bibentry and \basedon
\makeatletter%
\AtBeginDocument{%
\newwrite\@phantombibaux%
\immediate\openout\@phantombibaux phantombib.aux%
\immediate\write\@phantombibaux{\relax}%
\immediate\write\@phantombibaux{\string\bibstyle{\BibStyle}}%
\immediate\write\@phantombibaux{\string\bibdata{\BibFile}}}%
\makeatother

% redefine command bibentry so that the cited article is not added to the bibliography
\makeatletter
\let\oldbibentry\bibentry
\def\bibentry#1{%
  \begingroup%
    \DeclareRobustCommand{\Switch}[3]{##3}
    \let\@auxout\@phantombibaux%
    \def\bibliography##1{%
      \@input@{phantombib.bbl}}
    \def\nocite##1{%
      \immediate\write\@phantombibaux{\string\citation{##1}}}%
    \nobibliography{unused}%
    \oldbibentry{#1}%
    \DeclareRobustCommand{\Switch}[3]{##2}
  \endgroup%
}%
\makeatother%

% Command to print the text and article(s) on which a chapter is based
\DeclareDocumentCommand{\basedon}{ s m O{.}}{\blfootnote{\begin{framed}\begin{sloppypar}\noindent This \MakeLowercase{\ifinapp\appendixname\else\chaptername\fi}~is based on the article\ifthenelse{\equal{#3}{.}}{%
}{s}:\\%
                                              \bibentry{#2}\ifthenelse{\equal{#3}{.}}{%
}{,\\\indent\bibentry{#3}}\IfBooleanTF #1{,\\\\and additional work.}{.}
                                             \end{sloppypar}\end{framed}}}

% Command to sort and print (Dutch/German) surname prefixes correctly
\DeclareRobustCommand{\Switch}[3]{#2}

% Redefine style of bibliography to be chapter or section, depending ion the option 'chapterbib'
\ifthenelse{\boolean{chapterbibbool}}{\renewcommand{\bibsection}{\section*{\bibname}}}{\renewcommand{\bibsection}{\setcounter{chapter}{0}\setcounter{section}{0}\oldchapter*{\bibname}}}

%% Creation of title page lay-out

% format of date for title page
\newdateformat{dutchdate}{\dayofweekname{\THEDAY}{\THEMONTH}{\THEYEAR}~\THEDAY~\monthname[\THEMONTH]~\THEYEAR}

% Set the list of footnote symbols instead of numbers
\DefineFNsymbols*{mine}[math]{\dagger\ddagger\S\P\|%
{\dagger\dagger}{\ddagger\ddagger}{\S\S}{\P\P}{\|\|}%
{\dagger\dagger\dagger}{\ddagger\ddagger\ddagger}{\S\S\S}{\P\P\P}}
\setfnsymbol{mine}

% redefine the default title page
\renewcommand{\maketitle}{%
  \include{titlepage}
}

%% General lay-out

% Set the depth of the table of contents
\setcounter{tocdepth}{2}

% redefine the table of contents to be a chapter
\makeatletter
\renewcommand\tableofcontents{%
\addtocontents{toc}{\protect\setcounter{tocdepth}{-1}}
    \chapter{\contentsname}%
    \@starttoc{toc}%
    \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
    \clearpage
    }
\makeatother

% Set the page lay-out
\pagestyle{fancy}
% header lay-out
\fancyhead{}
\fancyhead[LE,RO]{\thepage}
\fancyhead[RE]{\ifnum\value{chapter}>0 \ifinapp\appendixname\else\chaptername\fi~\thechapter \fi}
\fancyhead[LO]{\ifnum\value{section}>0 Section \thesection \else \ifnum\value{chapter}>0 \ifinapp\appendixname\else\chaptername\fi~\thechapter \fi \fi}
\fancyhead[CE]{\ifnum\value{chapter}>0 \Chaptername \fi}
\fancyhead[CO]{\ifnum\value{section}>0 \Sectionname \else \ifnum\value{chapter}>0 \Chaptername \fi \fi}
\renewcommand{\headrulewidth}{0.4pt}
% footer lay-out
\fancyfoot{}
\renewcommand{\footrulewidth}{0pt}

% Command to easily print 'Chapter X' or 'Appendix X'
% Somehow this can ony be defined here
\let\Chaptermark\chaptermark
\def\chaptermark#1{\def\Chaptername{#1}\Chaptermark{#1}}
% Command to easily print 'Section X.Y'
% Somehow this can ony be defined here
\let\Sectionmark\sectionmark
\def\sectionmark#1{\def\Sectionname{#1}\Sectionmark{#1}}

% Set captions to normal size and italic
\captionsetup{labelfont={normalfont},font=it}

% Force even number of pages
\AtEndDocument{\cleardoublepage}
