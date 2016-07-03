%----------------------------------------------------------------------------------------
% CLASS OPTIONS AND REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{curricula-vitae}[2016/02/10 CV class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % subclass from article
\ProcessOptions

\LoadClass[titlepage]{article} % Load LaTeX's article class with the `titlepage' option so that \maketitle creates a title page, not just a title block

%----------------------------------------------------------------------------------------
%  Packages
%----------------------------------------------------------------------------------------

\usepackage{geometry} % specify horizontal and vertical page margins
\usepackage{fontspec} % Required for specifying custom fonts in XeLaTeX
\usepackage{titlesec} % Required for customizing section/subsection/etc titles
\usepackage{color} % Enable colors
\usepackage{fancyhdr}

%---------------------------------------------------------------------------------------
%  Конфигурация страницы
%---------------------------------------------------------------------------------------

\setcounter{secnumdepth}{-1} % Remove the numbers from all the headings (\section, \subsection, etc.)
% Page Layout
% Configure page margins with geometry
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}

% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}

%----------------------------------------------------------------------------------------
%  Цвета
%----------------------------------------------------------------------------------------

\usepackage[usenames,dvipsnames]{xcolor} % Required for custom colors

\definecolor{workperiodcolor}{HTML}{6A6A6A} % The color of the large sections
\definecolor{sectioncolor}{HTML}{6A6A6A} % The color of the large sections
\definecolor{footercolor}{HTML}{666666} % Цвет футера
\definecolor{subsectioncolor}{HTML}{333333} % The color of subsections and places worked/studied
\definecolor{contentcolor}{HTML}{2b2b2b} % The primary document color for content text

\definecolor{namecolorleft}{HTML}{2b2b2b}
\definecolor{namecolorright}{HTML}{6A6A6A}

%----------------------------------------------------------------------------------------
%  Шрифты
%----------------------------------------------------------------------------------------

% Папку со шрифтами
\def\@fontdir{../fonts/ubuntu/}

\def\@namefontleft{Ubuntu-R}
\def\@namefontright{Ubuntu-L}

\def\@contentfont{Ubuntu-L}
\def\@sectionfont{Ubuntu-L}
\def\@subsectionfont{Ubuntu-L}
\def\@mainsubsectionfont{Ubuntu-L}
\def\@addinfofont{Ubuntu-L}
\def\@workperiodfont{Ubuntu-L}

\setmainfont[Color=contentcolor, Path = \@fontdir]{\@contentfont}

%----------------------------------------------------------------------------------------
%  Общие комманды
%----------------------------------------------------------------------------------------

% Добавить сюда немного отступа, детка
\newcommand{\insertspace}{\vspace{8pt}} 

%----------------------------------------------------------------------------------------
%  Заголовок и подвал
%----------------------------------------------------------------------------------------

% заголовок
\newcommand{\namesection}[3]{ 
\centering{
\fontsize{40pt}{60pt}
\fontspec[Path = \@fontdir]{\@namefontleft}
\selectfont
\color{namecolorleft}#1 
\fontspec[Path = \@fontdir]{\@namefontright}
\selectfont
\color{namecolorright}#2
}\\[10pt] 
\centering{
\fontsize{12pt}{12pt}
\fontspec[Path = \@fontdir]{\@subsectionfont}
\selectfont\color{footercolor}#3
}\\[10pt] 
%\noindent\makebox[\linewidth]{\rule{\paperwidth}{0.6pt}} % разделительная черта (пока не нравится как выглядит)
}

% подвал
\newcommand{\footersection}[3]{
\fancyfoot{}
\fancyfoot[L]{\color{footercolor}#1}
\fancyfoot[C]{\color{footercolor}#2}
\fancyfoot[R]{\color{footercolor}#3}   
}

%----------------------------------------------------------------------------------------
%  Section 
%----------------------------------------------------------------------------------------

\titlespacing{\section}{0pt}{0pt}{0pt} % no spacing for section

\titleformat{\section}{ 
\color{sectioncolor}
\fontspec[Path = \@fontdir]{\@sectionfont}
\fontsize{16pt}{24pt}
\selectfont
\raggedright
%\uppercase
}{}{0em}{}

%----------------------------------------------------------------------------------------
%  Subsection 
%----------------------------------------------------------------------------------------

\titlespacing{\subsection}{0pt}{0pt}{0pt} % no spacing for subsection

\titleformat{\subsection}{
\color{subsectioncolor}
\fontspec[Path = \@fontdir]{\@subsectionfont}
\fontsize{12pt}{12pt}
\selectfont
%\bfseries
%\uppercase
}{}{0em}{}

%----------------------------------------------------------------------------------------
%  Subsection in right column (refactor this) 
%----------------------------------------------------------------------------------------

% Used for creating subsections where a description is required on the same line
\newcommand{\mainsubsection}[1]{ 
\color{subsectioncolor}
\fontspec[Path = \@fontdir]{\@mainsubsectionfont}
\fontsize{12pt}{12pt}
\selectfont {#1} 
\normalfont
}

% Used for describing the subsection either on the same line or underneath
\newcommand{\addinfo}[1]{ 
\color{subsectioncolor}
\raggedright
\fontspec[Path = \@fontdir]{\@addinfofont}
\fontsize{11pt}{13pt}
\selectfont {\hfill#1 \\} 
\normalfont
}

% Used for specifying a duration and/or location under a subsection
\newcommand{\workperiod}[2]{ 
\color{workperiodcolor}
\raggedright
\fontspec[Path = \@fontdir]{\@workperiodfont}
\fontsize{10pt}{12pt}
\selectfont {#1\hfill#2\\} 
\normalfont
}

%----------------------------------------------------------------------------------------
%  Items 
%----------------------------------------------------------------------------------------

% Defines the tightitemize environment which modifies the itemize environment to be more compact
\newenvironment{tightitemize} 
{\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}
{\end{itemize}\vspace{-\topsep}}