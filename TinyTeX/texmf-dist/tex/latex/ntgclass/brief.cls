%%
%% This is file `brief.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% brief.dtx  (with options: `brief')
%% This is a generated file.
%% 
%% The source is maintained by Johannes Braams and bug
%% reports for it can be sent to texniek at braams.xs4all.nl
%% 
%% Copyright (C) 1990-2023 Nederlandstalige TeX Gebruikersgroep.
%% All rights reserved.
%% 
%% This file was generated from file(s) of the NTG document classes distribution.
%% ------------------------------------------------------------------------------
%% 
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2008 or later.
%% 
%% This work has the LPPL maintenance status "maintained".
%% 
%% The Current Maintainer of this work is Johannes Braams.
%% 
%% This file may only be distributed together with a copy of the NTG
%% document classes distribution. You may however distribute the NTG
%% document classes distribution without such generated files.
%% 
%% The list of all files belonging to the NTG document classes
%% distribution is given in the file `manifest.txt'.
%% 
%% The list of derived (unpacked) files belonging to the distribution
%% and covered by LPPL is defined by the unpacking scripts (with
%% extension .ins) which are part of the distribution.
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{brief}
              [2023/01/10 v2.0s
               NTG LaTeX document class]
\newcommand*\@ptsize{}
\newif\if@typhulp
\newif\if@streepjes
\newif\if@adresrechts
\newif\if@elfinch
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}\@elfinchfalse}
\DeclareOption{a5paper}
   {\ClassWarning{brief}{Paper size A5 not supported, using A4}%
    \setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}\@elfinchfalse}
\DeclareOption{b5paper}
   {\ClassWarning{brief}{Paper size B5 not supported, using A4}%
    \setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}\@elfinchfalse}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}\@elfinchtrue}
\DeclareOption{USletter}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}\@elfinchtrue}
\DeclareOption{legalpaper}
   {\ClassWarning{brief}
                 {Paper size `legal' not supported, using `letter'}%
    \setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}\@elfinchtrue}
\DeclareOption{executivepaper}
   {\ClassWarning{brief}
                 {Paper size `executive' not supported, using `letter'}%
    \setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}\@elfinchtrue}
\DeclareOption{10pt}{\renewcommand*\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand*\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand*\@ptsize{2}}
\if@compatibility
  \DeclareOption{twoside}{\@latexerr{No 'twoside' layout for letters}%
                                   \@eha}
\else
  \DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\fi
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{typhulp}{\@typhulptrue}
\DeclareOption{geentyphulp}{\@typhulpfalse}
\DeclareOption{streepjes}{\@streepjestrue}
\DeclareOption{geenstreepjes}{\@streepjesfalse}
\DeclareOption{adreslinks}{\@adresrechtsfalse}
\DeclareOption{adresrechts}{\@adresrechtstrue}
\DeclareOption{nederlands}{\AtEndOfClass{\dutchbrief}}
\DeclareOption{dutch}     {\AtEndOfClass{\dutchbrief}}
\DeclareOption{engels}    {\AtEndOfClass{\englishbrief}}
\DeclareOption{english}   {\AtEndOfClass{\englishbrief}}
\DeclareOption{USengels}  {\AtEndOfClass{\americanbrief}}
\DeclareOption{american}  {\AtEndOfClass{\americanbrief}}
\DeclareOption{duits}     {\AtEndOfClass{\germanbrief}}
\DeclareOption{german}    {\AtEndOfClass{\germanbrief}}
\DeclareOption{frans}     {\AtEndOfClass{\frenchbrief}}
\DeclareOption{french}    {\AtEndOfClass{\frenchbrief}}
\DeclareOption{francais}  {\AtEndOfClass{\frenchbrief}}
\ExecuteOptions{a4paper,11pt,oneside,onecolumn,final,%
                geentyphulp,geenstreepjes,adreslinks,%
                nederlands}
\ProcessOptions\relax
\ifcase\@ptsize
  \renewcommand*\normalsize{%
    \@setfontsize\normalsize\@xpt\@xiipt
    \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
    \abovedisplayshortskip \z@ \@plus3\p@
    \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
    \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}
\or
  \renewcommand*\normalsize{%
    \@setfontsize\normalsize\@xipt{13.6}%
    \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
    \abovedisplayshortskip \z@ \@plus3\p@
    \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
    \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}
\or
  \renewcommand*\normalsize{%
    \@setfontsize\normalsize\@xiipt{15}%
    \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
    \abovedisplayshortskip \z@ \@plus3\p@
    \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
    \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}
\fi
\let\@normalsize\normalsize
\normalsize
\ifx\MakeRobust\@undefined \else
    \MakeRobust\normalsize
\fi
\ifcase\@ptsize
  \DeclareRobustCommand\small{%
    \@setfontsize\small\@ixpt{11}%
    \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
    \abovedisplayshortskip \z@ \@plus2\p@
    \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
    \belowdisplayskip \abovedisplayskip}
\or
  \DeclareRobustCommand\small{%
    \@setfontsize\small\@xpt\@xiipt
    \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
    \abovedisplayshortskip \z@ \@plus3\p@
    \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
    \belowdisplayskip \abovedisplayskip}
\or
  \DeclareRobustCommand\small{%
    \@setfontsize\small\@xipt{13.6}%
    \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
    \abovedisplayshortskip \z@ \@plus3\p@
    \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
    \belowdisplayskip \abovedisplayskip}
\fi
\ifcase\@ptsize
  \DeclareRobustCommand\footnotesize{%
    \@setfontsize\footnotesize\@viiipt{9.5}%
    \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
    \abovedisplayshortskip \z@ \@plus\p@
    \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
    \belowdisplayskip \abovedisplayskip}
\or
  \DeclareRobustCommand\footnotesize{%
    \@setfontsize\footnotesize\@ixpt{11}%
    \abovedisplayskip 8\p@ \@plus2\p@ \@minus4\p@
    \abovedisplayshortskip \z@ \@plus\p@
    \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
    \belowdisplayskip \abovedisplayskip}
\or
  \DeclareRobustCommand\footnotesize{%
    \@setfontsize\footnotesize\@xpt\@xiipt
    \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
    \abovedisplayshortskip \z@ \@plus3\p@
    \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
    \belowdisplayskip \abovedisplayskip}
\fi
\ifcase\@ptsize
  \DeclareRobustCommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
  \DeclareRobustCommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
  \DeclareRobustCommand\large{\@setfontsize\large\@xiipt{14}}
  \DeclareRobustCommand\Large{\@setfontsize\Large\@xivpt{18}}
  \DeclareRobustCommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
  \DeclareRobustCommand\huge{\@setfontsize\huge\@xxpt{25}}
  \DeclareRobustCommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
\or
  \DeclareRobustCommand\scriptsize{\@setfontsize\scriptsize\@viiipt{9.5}}
  \DeclareRobustCommand\tiny{\@setfontsize\tiny\@vipt\@viipt}
  \DeclareRobustCommand\large{\@setfontsize\large\@xiipt{14}}
  \DeclareRobustCommand\Large{\@setfontsize\Large\@xivpt{18}}
  \DeclareRobustCommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
  \DeclareRobustCommand\huge{\@setfontsize\huge\@xxpt{25}}
  \DeclareRobustCommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
\or
  \DeclareRobustCommand\scriptsize{\@setfontsize\scriptsize\@viiipt{9.5}}
  \DeclareRobustCommand\tiny{\@setfontsize\tiny\@vipt\@viipt}
  \DeclareRobustCommand\large{\@setfontsize\large\@xivpt{18}}
  \DeclareRobustCommand\Large{\@setfontsize\Large\@xviipt{22}}
  \DeclareRobustCommand\LARGE{\@setfontsize\LARGE\@xxpt{25}}
  \DeclareRobustCommand\huge{\@setfontsize\huge\@xxvpt{30}}
  \let\Huge=\huge
\fi
\newfont\refkopfont{cmssq8}
\DeclareFixedFont\kleinvet{\encodingdefault}%
                          {\rmdefault}%
                          {\bfdefault}%
                          {\shapedefault}%
                          {7}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand*\baselinestretch{}
\setlength\parskip{0.7em \@plus .3em \@minus .2em}
\setlength\parindent{0\p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setlength\headheight{37mm}
\setlength\headsep   {0mm}
\setlength\footskip{25\p@}
\if@compatibility
  \setlength\maxdepth{4\p@}
\else
  \setlength\maxdepth{.5\topskip}
\fi
\setlength\@maxdepth\maxdepth
\setlength\textwidth{144mm}
\setlength\textheight{197mm}
\if@elfinch \addtolength\textheight{-17.6mm} \fi
\setlength\@rightskip{0cm \@plus 5cm}
\setlength\rightskip{\@rightskip}
\setlength\@tempdima{\paperwidth}
\addtolength\@tempdima{-2in}
\addtolength\@tempdima{-\textwidth}
\setlength\oddsidemargin   {7.6mm}
\setlength\evensidemargin  {\oddsidemargin}
\setlength\marginparwidth  {0\p@}
\setlength\marginparsep {0\p@}
\setlength\marginparpush{0\p@}
\setlength\topmargin{-12.4mm}
\newdimen\vensterskip
\setlength\vensterskip{50mm}
\newdimen\@vensterskip
\newdimen\@firstheadheight
\newdimen\@otherheadheight
\newdimen\@othertextheight
\newdimen\@otherheadsep
\newdimen\@vervolgsep
\setlength\@otherheadsep{2mm}
\def\@prepareerhoofden{%
  \setlength\@vensterskip{\vensterskip}%
  \addtolength\@vensterskip{-50mm}%
  \setlength\@firstheadheight{\headheight}%
  \setlength\@otherheadheight{\headheight}%
  \setlength\@othertextheight{\textheight}%
  }
\newdimen\footsep
\setlength\footsep{15mm}
\setlength\footnotesep{12\p@}
\setlength{\skip\footins}{10\p@ \@plus 2\p@ \@minus 4\p@}
\if@twoside
  \def\ps@headings{%
      \def\@oddfoot{\voetregel\hss}%
      \let\@evenfoot\@oddfoot
      \def\@oddhead{%
        \vbox to \@otherheadheight
          {\vervolghoofd\vfil
           \if@streepjes\streepjes{\@firstheadheight}\fi}\hss}
      \let\@evenhead\@oddhead}
\else
  \def\ps@headings{%
      \def\@oddfoot{\voetregel\hss}%
      \def\@oddhead{%
        \vbox to \@otherheadheight
          {\vervolghoofd\vfil
           \if@streepjes\streepjes{\@otherheadheight}\fi}\hss}}
\fi
\def\ps@firstpage{%
  \global\headheight=\@otherheadheight
  \global\textheight=\@othertextheight %?? werkt dit ??
  \global\headsep=\@otherheadsep
  \def\@oddhead{\vbox to \@firstheadheight
    {\briefhoofd\vfil
      \if@streepjes\streepjes{\@firstheadheight}\fi}%
    \hss}
  \def\@evenhead{}
  \def\@oddfoot{\voetregel\hss} \let\@evenfoot\@oddfoot}
\def\ps@empty{%
      \let\@oddfoot\@empty\let\@oddhead\@empty
      \let\@evenfoot\@empty\let\@evenhead\@empty}
\def\ps@plain{%
      \let\@oddhead\@empty
      \def\@oddfoot{\normalfont\hfil\thepage}%
      \def\@evenfoot{\normalfont\hfil\thepage}}
\newcommand*\name[1]{\def\fromname{#1}}
\def\fromname{}
\newcommand*\ondertekening[1]{\def\fromsig{#1}}
\def\fromsig{}
\let\signature\ondertekening
\newcommand*\address[1]{\maakbriefhoofd*{}{#1}}
\newcommand*\location[1]{\def\fromlocation{#1}}
\def\fromlocation{}
\newcommand*\telephone[1]{\def\telephonenum{#1}}
\def\telephonenum{}
\newcommand*\makelabels{%
  \AtBeginDocument{%
     \let\@startlabels\startlabels
     \let\@mlabel\mlabel
     \if@filesw
       \immediate\write\@mainaux{\string\@startlabels}\fi}%
  \AtEndDocument{%
     \if@filesw\immediate\write\@mainaux{\string\clearpage}\fi}}
\@onlypreamble\makelabels
\newenvironment{brief}[1]
  {\newpage
    \if@twoside \ifodd\c@page
                \else\thispagestyle{empty} \hbox{}\newpage\fi
    \fi
    \c@page\@ne
    \interlinepenalty=200 % smaller than the TeXbook value
    \@processto{\leavevmode\ignorespaces #1}%
    \@defrefveld{\@Ad}{\geadresseerdetekst}{\toname}
    \ifdim\wd\@Dt=0cm \@defrefveld{\@Dt}{\datumtekst}{\vandaag}\fi
    \@prepareerhoofden
    {\setbox\@tempboxa\vervolghoofd
      \@tempdima\ht\@tempboxa
      \advance\@tempdima by -\@otherheadheight
      \ifdim\@tempdima>0\p@
        \global\advance\@otherheadheight by \@tempdima
        \global\advance\@othertextheight by -\@tempdima
      \fi}
    {\setbox\@tempboxa=\vbox{\voetregel}
      \global\footskip=\ht\@tempboxa
      \global\advance\footskip by \footsep}%
    }
  {\stopletter\@@par\pagebreak\@@par
    \if@filesw
      \begingroup
        \let\\=\relax
        \let\protect\@unexpandable@protect
        \immediate\write\@auxout
          {\string\@mlabel{\returnaddress}{\toname\\\toaddress}}%
      \endgroup
    \fi}
\let\letter\brief
\let\endletter\endbrief
\long\def\@processto#1{\@xproc #1\\@@@\ifx\toaddress\@empty
    \else \@yproc #1@@@\fi}
\long\def\@xproc #1\\#2@@@{\def\toname{#1}\def\toaddress{#2}}
\long\def\@yproc #1\\#2@@@{\def\toaddress{#2}}
\newif\if@antwoordadres
\newcommand*\antwoordadres[1]{%
  \@antwoordadrestrue\renewcommand*\@antwoordadres{#1}}
\newcommand*\@antwoordadres{}
\let\replyaddress\antwoordadres
\newdimen\adresveldbreedte
\newcommand*\adresveld{%
  \hbox{}\kern-\topskip
  \kern\@vensterskip
  \begingroup
    \if@adresrechts
      \setlength\adresveldbreedte{4\refveldbreedte}%
      \addtolength\adresveldbreedte{-76mm}%
      \def\@tempa{\moveright 76mm}%
    \else
      \let\@tempa\relax
      \setlength\adresveldbreedte{83mm}%
    \fi
    \setbox\@tempboxa\vtop{%
      \hsize\adresveldbreedte
      \@normalsize
      \parindent\z@\parskip\z@
      \rightskip0\p@\@plus\adresveldbreedte
      \let\\\@nobreakcr \toname \\ \toaddress}
    {\baselineskip\z@\lineskip\z@
      \if@antwoordadres
        \@tempa\vbox to \z@{%
          \hb@xt@\adresveldbreedte{%
            \kleinvet
            \def\\{\unskip\enspace{\textbullet}\enspace\ignorespaces}%
            \@antwoordadres\hfil}
          \kern2\p@\hrule \vss}
      \fi
      \if@typhulp
        \@tempa\llap{\vbox to \z@{\vskip9mm\streepje\vss}}
      \fi
      \kern9mm \kern-\ht\@tempboxa \@tempdima=\dp\@tempboxa
      \@tempa\box\@tempboxa \kern-\@tempdima
      \vskip31mm}\endgroup}
\newdimen\refveldbreedte
\setlength\refveldbreedte{38mm}
\def\@defrefveld#1#2#3{\setbox#1\@refveld{#2}{#3}}
\def\@refveld#1#2{%
  \vtop{\hsize\refveldbreedte
    \parskip\z@\parindent\z@
    \everypar{}%
    \lineskiplimit\z@\baselineskip12\p@
    \lineskip\z@
    \rightskip0\p@ \@plus \refveldbreedte \@minus .5\refveldbreedte
    \vbox{\refkopfont\baselineskip10\p@#1\@@par}
    \kern2\p@
    \strut #2}}
\newbox\@UB \newbox\@UK \newbox\@OK \newbox\@Dt
\newcommand*\uwbriefvan[1]{\@defrefveld{\@UB}{\uwbrieftekst}{#1}}
\let\yourletterof\uwbriefvan
\newcommand*\uwkenmerk[1]{\@defrefveld{\@UK}{\uwkenmerktekst}{#1}}
\let\yourreference\uwkenmerk
\newcommand*\onskenmerk[1]{\@defrefveld{\@OK}{\onskenmerktekst}{#1}}
\newcommand*\datum[1]{\def\@tempa{}\def\@tempb{#1}%
  \ifx\@tempa\@tempb
    \setbox\@Dt\hbox{ }%
  \else
    \@defrefveld{\@Dt}{\datumtekst}{#1}%
  \fi}
\let\date\datum
\def\referentieregel{\hbox
             {\hb@xt@\refveldbreedte{\copy\@UB\hfil}%
              \hb@xt@\refveldbreedte{\copy\@UK\hfil}%
              \hb@xt@\refveldbreedte{\copy\@OK\hfil}%
              \hb@xt@\refveldbreedte{\copy\@Dt\hfil}\hss}}
\newbox\@Ad
\def\vervolgreferentieregel{%
  \hbox{%
    \hb@xt@\refveldbreedte{\copy\@Ad\hfil}%
    \hskip\refveldbreedte
    \hb@xt@\refveldbreedte{\copy\@Dt\hfil}%
    \@refveld{\bladnummertekst}{\thepage}\hss}}
\newcommand*\briefhoofd{}
\newcommand*\vervolghoofd{\vbox{}}
\newcommand*\maakbriefhoofd
   {\@ifstar {\@kortvervolgbriefhoofd}{\@langvervolgbriefhoofd}}
\let\makeheader\maakbriefhoofd
\newcommand*\@kortvervolgbriefhoofd[2]{%
  \@maakbriefhoofd{#1}{#2}
  \def\vervolghoofd{%
    \vbox{\hsize=4\refveldbreedte
      \hb@xt@\hsize{\Large \normalfont\sffamily #1\strut\hfil}
      \hrule \kern2mm \vervolgreferentieregel}}}
\newcommand*\@langvervolgbriefhoofd[2]{
  \@maakbriefhoofd{#1}{#2}
  \def\vervolghoofd{%
    \vbox{\briefhoofd\vskip2mm
      \vervolgreferentieregel
      \vbox{}}}}
\newcommand*\@maakbriefhoofd[2]{\def\briefhoofd{%
    \vbox{\hsize=4\refveldbreedte
      \hb@xt@\hsize{\Large \normalfont\sffamily #1\strut\hfil}
      \hrule
      \moveright 3\refveldbreedte\@refveld{\strut #2}{}
      \vbox{}}}}
\newbox\@voetruimte
\setbox\@voetruimte=\hbox{}
\newcount\@voetteller
\newcommand*\voetregel{\copy\@voetruimte}
\newcommand*\voetitem[2]{%
  \advance\@voetteller by 1
  \setbox\@voetruimte\hb@xt@4\refveldbreedte{%
    \unhbox\@voetruimte
    \ifcase\@voetteller \relax \or \relax \or \hfil \else \hfill
    \fi
    \@refveld{#1}{#2}\hskip0\p@ \@plus 3\refveldbreedte}}
\let\footitem\voetitem
\newcommand*\streepje{\hb@xt@2mm{\rule{2mm}{.1pt}}}
\newcommand*\streepjes[1]{%
  \vbox to \z@{%
    \kern-#1\relax
    \hb@xt@\textwidth{%
      \llap{\perfstreepje\kern24mm}\hfill
      \rlap{\kern24mm\vouwstreepjes}}
  \vss}}
\newcommand*\perfstreepje{\vtop{\kern\z@ \kern 135mm \streepje}}
\newcommand*\vouwstreepjes{%
  \vtop{\kern\z@
        \kern 95mm %% 108-13
        \streepje  %% denk maar dat dit geen dikte heeft
        \kern 45mm %% 155-150
        \streepje}}
\newcommand*\stopbreaks{\interlinepenalty \@M
   \def\par{\@@par\nobreak}\let\\=\@nobreakcr
   \let\vspace\@nobreakvspace}
\DeclareRobustCommand\@nobreakvspace
   {\@ifstar{\@nobreakvspacex}{\@nobreakvspacex}}
\def\@nobreakvspacex#1{%
  \ifvmode
    \nobreak\vskip #1\relax
  \else
    \@bsphack\vadjust{\nobreak\vskip #1}\@esphack
  \fi}
\def\@nobreakcr{%
  \let\reserved@e\relax
  \let\reserved@f\relax
  \vadjust{\nobreak}\@ifstar{\@xnewline}{\@xnewline}}
\def\startbreaks{\let\\=\@normalcr
   \interlinepenalty 200\def\par{\@@par\penalty 200\relax}}
\newcommand*\opening[1]{%
  \thispagestyle{firstpage}%
  \adresveld
  \prevdepth=-1000\p@ \vskip-2\p@ %% ????
  \referentieregel
  \@dosubject #1\par\nobreak}
\def\@dosubject{%
  \ifx\@empty\@subject
  \else
    \par\noindent
    \parbox[t]{\textwidth}
              {\@hangfrom{\refkopfont \betrefttekst \enspace}%
                \normalfont\rmfamily\ignorespaces \@subject\strut}%
    \par
  \fi}
\newcommand*\afsluiting[1]{\par\nobreak\vspace{\parskip}%
  \stopbreaks
  \ifx\@empty\fromsig
    \def\ondertekening##1{\def\fromsig{##1}\@afsluiting{#1}}%
  \else
    \@afsluiting{#1}%
  \fi}
\let\closing\afsluiting
\def\open@af{\vtop\bgroup\hsize.3\textwidth \raggedright}
\newcommand*\@afsluiting[1]{%
  \def\en{\strut\egroup\open@af}%
  \let\and\en
  \noindent
  \parbox{.5\textwidth}{%
    \raggedright \ignorespaces #1\\[6\medskipamount]%
    \leavevmode\open@af \fromsig \strut\egroup}}
\medskipamount=\parskip
\newcommand*\betreft[1]{\def\@subject{#1}}
\let\onderwerp\betreft
\let\subject\betreft
\def\@subject{}
\let\re\betreft
\newcommand*{\cc}[1]{\par\noindent
  \parbox[t]{\textwidth}{\@hangfrom{\normalfont\ccname: }%
                       \ignorespaces #1\strut}\par}
\newcommand*\bijlage[1]{%
  \par\noindent
  \parbox[t]{\textwidth}{\@hangfrom{\normalfont\bijlagetekst\ }%
    \ignorespaces #1\strut}\par}
\newcommand*\bijlagen[1]{%
  \par\noindent
  \parbox[t]{\textwidth}{\@hangfrom{\normalfont\bijlagentekst\ }%
    \ignorespaces #1\strut}\par}
\let\encl\bijlagen
\newcommand*\ps{\par\startbreaks}
\newcommand*\stopletter{}
\newcommand*\returnaddress{}
\newcount\labelcount
\newcommand*\startlabels{\labelcount\z@
  \pagestyle{empty}%
  \let\@texttop\relax
  \topmargin -50\p@
  \headsep \z@
  \oddsidemargin -35\p@
  \evensidemargin -35\p@
  \textheight 10in
  \@colht\textheight  \@colroom\textheight \vsize\textheight
  \textwidth 550\p@
  \columnsep 26\p@
  \ifcase \@ptsize\relax
    \normalsize
  \or
    \small
  \or
    \footnotesize
  \fi
  \baselineskip \z@
  \lineskip \z@
  \boxmaxdepth \z@
  \parindent \z@
    \twocolumn\relax}
\let\@startlabels=\relax
\newcommand*\mlabel[2]{%
  \parbox[b][2in][c]{262\p@}{\strut\ignorespaces #2}%
  }
\let\@mlabel=\@gobbletwo
\setlength\leftmargini  {2.5em}
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
\setlength\leftmargin    {\leftmargini}
\setlength  \labelsep  {5\p@}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\setlength\partopsep{0\p@}
\setlength\topsep{.4em}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\def\@listI{\leftmargin\leftmargini
            \labelsep.5em%
            \labelwidth\leftmargin
            \advance\labelwidth-\labelsep
            \topsep .5\parskip \@plus \p@
            \parsep \z@
            \itemsep\parsep}
\let\@listi\@listI
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelsep  .5em%
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep -.5\parskip \@plus \p@
              \parsep \z@
              \itemsep\parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelsep  .5em%
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep -.5\parskip \@plus \p@
              \parsep \z@
              \partopsep \z@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelsep  .5em%
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep
              \topsep -.5\parskip \@plus \p@}
\def\@listv  {\leftmargin\leftmarginv
              \labelsep  .5em%
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep
              \topsep -.5\parskip \@plus \p@}
\def\@listvi {\leftmargin\leftmarginvi
              \labelsep  .5em%
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep
              \topsep -.5\parskip \@plus \p@}
\renewcommand*\theenumi  {\@arabic\c@enumi}
\renewcommand*\theenumii {\@alph\c@enumii}
\renewcommand*\theenumiii{\@roman\c@enumiii}
\renewcommand*\theenumiv {\@Alph\c@enumiv}
\newcommand*\labelenumi  {\theenumi.}
\newcommand*\labelenumii {(\theenumii)}
\newcommand*\labelenumiii{\theenumiii.}
\newcommand*\labelenumiv {\theenumiv.}
\renewcommand*\p@enumii {\theenumi}
\renewcommand*\p@enumiii{\theenumi(\theenumii)}
\renewcommand*\p@enumiv {\p@enumiii\theenumiii}
\newcommand*\labelitemi  {\labelitemfont \textbullet}
\newcommand*\labelitemii {\labelitemfont \bfseries \textendash}
\newcommand*\labelitemiii{\labelitemfont \textasteriskcentered}
\newcommand*\labelitemiv {\labelitemfont \textperiodcentered}
\newcommand\labelitemfont{\normalfont}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\=\@centercr
                \list{}{\setlength\itemsep{\z@}%
                        \setlength\itemindent{-15\p@}%
                        \setlength\listparindent{\itemindent}%
                        \setlength\rightmargin{\leftmargin}%
                        \addtolength\leftmargin{15\p@}}%
                \item[]}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\setlength\listparindent{1.5em}%
                        \setlength\itemindent{\listparindent}%
                        \setlength\rightmargin{\leftmargin}}%
                \item[]}
               {\endlist}
\newenvironment{quote}
               {\list{}{\setlength\rightmargin{\leftmargin}}%
                \item[]}
               {\endlist}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand*\theequation{\@arabic\c@equation}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\relax}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\relax}
\DeclareRobustCommand*{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand*{\mit}{\@fontswitch{\relax}{\mathnormal}}
\renewcommand*\footnoterule{%
  \kern-\p@
  \hrule \@width .4\columnwidth
  \kern .6\p@}
\long\def\@makefntext#1{%
  \noindent\hb@xt@\leftmargini{\normalfont\@thefnmark.\hfil}#1}
\newcommand*\dutchbrief{%
  \def\uwbrieftekst{Uw brief van}
  \def\uwkenmerktekst{Uw kenmerk}
  \def\onskenmerktekst{Ons kenmerk}
  \def\datumtekst{Datum}
  \def\geadresseerdetekst{Geadresseerde}
  \def\bladnummertekst{Bladnummer}
  \def\vandaag{\number\day~\ifcase\month\or
    januari\or februari\or maart\or april\or mei\or juni\or juli\or
    augustus\or september\or oktober\or november\or december\fi
    \space \number\year}
  \def\betrefttekst{Onderwerp:}
  \def\ccname{cc}
  \def\bijlagetekst{Bijlage:}
  \def\bijlagentekst{Bijlagen:}
  \def\telefoontekst{telefoon}}
\newcommand*\englishbrief{%
  \def\uwbrieftekst{Your letter of}
  \def\uwkenmerktekst{Your reference}
  \def\onskenmerktekst{Our reference}
  \def\datumtekst{Date}
  \def\geadresseerdetekst{To}
  \def\bladnummertekst{Page}
  \def\vandaag{\ifcase\day\or
    1st\or 2nd\or 3rd\or 4th\or 5th\or
    6th\or 7th\or 8th\or 9th\or 10th\or
    11th\or 12th\or 13th\or 14th\or 15th\or
    16th\or 17th\or 18th\or 19th\or 20th\or
    21st\or 22nd\or 23rd\or 24th\or 25th\or
    26th\or 27th\or 28th\or 29th\or 30th\or
    31st\fi~\ifcase\month\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December\fi
    \space \number\year}
  \def\betrefttekst{Re:}
  \def\ccname{cc}
  \def\bijlagetekst{Enclosure:}
  \def\bijlagentekst{Enclosures:}
  \def\telefoontekst{telephone}}
\newcommand*\americanbrief{%
  \def\uwbrieftekst{Your letter of}
  \def\uwkenmerktekst{Your reference}
  \def\onskenmerktekst{Our reference}
  \def\datumtekst{Date}
  \def\geadresseerdetekst{To}
  \def\bladnummertekst{Page}
  \def\vandaag{\ifcase\month\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December\fi
    \space\number\day, \number\year}
  \def\betrefttekst{Re:}
  \def\ccname{cc}
  \def\bijlagetekst{Enclosure:}
  \def\bijlagentekst{Enclosures:}
  \def\telefoontekst{telephone}}
\newcommand*\germanbrief{%
   \def\uwbrieftekst{Ihr Brief vom}
   \def\uwkenmerktekst{Ihr Zeichen}
   \def\onskenmerktekst{Unser Zeichen}
   \def\datumtekst{Datum}
   \def\geadresseerdetekst{An}
   \def\bladnummertekst{Seite}
   \def\vandaag{\number\day.~\ifcase\month\or
     Januar\or Februar\or M\"arz\or April\or Mai\or Juni\or
     Juli\or August\or September\or Oktober\or November\or Dezember\fi
     \space\number\year}
   \def\betrefttekst{Betrifft:}
   \def\ccname{Kopien an}
   \def\bijlagetekst{Anlage:}
   \def\bijlagentekst{Anlagen:}
   \def\telefoontekst{Telefon}}
\newcommand*\frenchbrief{%
   \def\uwbrieftekst{Votre lettre du}
   \def\uwkenmerktekst{Vos r\'ef\'erences:}
   \def\onskenmerktekst{Nos r\'ef\'erences:}
   \def\datumtekst{Date:}
   \def\geadresseerdetekst{\`A l'attention de}
   \def\bladnummertekst{Page}
   \def\vandaag{\number\day\ifnum\day=1$^{er}$\fi
          ~\ifcase\month\or janvier\or
           f\'evrier\or mars\or avril\or mai\or juin\or
           juillet\or ao\^ut\or septembre\or octobre\or
           novembre\or d\'ecembre\fi \space \number\year}
   \def\betrefttekst{Objet:}
   \def\ccname{Copie \`a}
   \def\bijlagetekst{Pi\`ece jointe:}
   \def\bijlagentekst{Pi\`eces jointes:}
   \def\telefoontekst{T\'el\'ephone:}}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\raggedbottom
\let\@texttop\relax
\onecolumn
\endinput
%%
%% End of file `brief.cls'.
