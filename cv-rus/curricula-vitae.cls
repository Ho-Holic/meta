%---------------------------------------------------------------------------------------------------
% CLASS OPTIONS AND REQUIRED PACKAGES
%---------------------------------------------------------------------------------------------------

%---------------------------------------------------------------------------------------------------
% Notes:
%
% \fontsize{size}{baselineskip} A rule of thumb is that the baselineskip should be 1.2 
%                               times the font size.
%---------------------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{curricula-vitae}[2016/02/10 CV class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % subclass from article
\ProcessOptions

\LoadClass[titlepage]{article} % Load LaTeX's article class with the `titlepage' option so that \maketitle creates a title page, not just a title block

%---------------------------------------------------------------------------------------------------
%  Packages
%---------------------------------------------------------------------------------------------------

\usepackage{geometry} % specify horizontal and vertical page margins
\usepackage{fontspec} % Required for specifying custom fonts in XeLaTeX
\usepackage{titlesec} % Required for customizing section/subsection/etc titles
\usepackage{color} % Добавляем цвета
\usepackage{fancyhdr} % заголовок и подвал
\usepackage[hidelinks]{hyperref} % Гиперссылки, hidelinks - убирает глупую синюю обводку
\usepackage[usenames,dvipsnames]{xcolor} % Required for custom colors
\usepackage{qrcode} % генерация QR кода

%---------------------------------------------------------------------------------------------------
%  Конфигурация страницы
%---------------------------------------------------------------------------------------------------

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

%---------------------------------------------------------------------------------------------------
%  Цвета
%---------------------------------------------------------------------------------------------------

\definecolor{workperiodcolor}{HTML}{6A6A6A} % The color of the large sections
\definecolor{sectioncolor}{HTML}{6A6A6A} % The color of the large sections
\definecolor{footercolor}{HTML}{666666} % Цвет футера
\definecolor{subsectioncolor}{HTML}{333333} % The color of subsections and places worked/studied
\definecolor{contentcolor}{HTML}{2b2b2b} % The primary document color for content text

\definecolor{namecolorleft}{HTML}{2b2b2b}
\definecolor{namecolorright}{HTML}{2b2b2b}
\definecolor{namecolorlogo}{HTML}{EEEEEE}


%---------------------------------------------------------------------------------------------------
%  Шрифты
%---------------------------------------------------------------------------------------------------

% Папку со шрифтами
\def\@fontdir{../fonts/ubuntu/}
\def\@fontdirsection{../fonts/poiretone/}
\def\@fontdirsubsection{../fonts/ubuntu/}
\def\@fontdirmainsubsection{../fonts/ubuntu/}

\def\@fontdirnameleft{../fonts/exo2/}
\def\@fontdirnameright{../fonts/exo2/}
\def\@fontdirnameunder{../fonts/exo2/}
\def\@fontdirnamelogo{../fonts/ubuntu/}

\def\@fontdirworkperiod{../fonts/ubuntu/}
\def\@fontdirfooter{../fonts/exo2/}


\def\@namefontleft{Exo2-Bold}
\def\@namefontright{Exo2-ExtraLight}
\def\@namefontunder{Exo2-Regular}
\def\@namefontlogo{Ubuntu-R}

\def\@contentfont{Ubuntu-L}
\def\@footerfont{Exo2-Thin}

\def\@sectionfont{PoiretOne-Regular}
\def\@subsectionfont{Ubuntu-B}
\def\@mainsubsectionfont{Ubuntu-B}
\def\@workperiodfont{Ubuntu-LI}

\setmainfont[Color=contentcolor, Path = \@fontdir]{\@contentfont}

%---------------------------------------------------------------------------------------------------
%  Общие комманды
%---------------------------------------------------------------------------------------------------

% Добавить сюда немного отступа, детка
\newcommand{\insertspace}{\vspace{8pt}} 

%---------------------------------------------------------------------------------------------------
%  Заголовок и подвал
%---------------------------------------------------------------------------------------------------

% заголовок
\newcommand{\namesection}[4]{ 
\centering{
\fontsize{40pt}{60pt}
\fontspec[Path = \@fontdirnamelogo]{\@namefontlogo}
\selectfont
\color{namecolorlogo}#1
\fontspec[Path = \@fontdirnameleft]{\@namefontleft}
\selectfont
\color{namecolorleft}\hfill#2 
\fontspec[Path = \@fontdirnameright]{\@namefontright}
\selectfont
\color{namecolorright}#3
}\\%[10pt] 
%\noindent\makebox[\linewidth]{\rule{\paperwidth}{0.6pt}} % разделительная черта на всю страницу
\color{footercolor}\hrulefill \\
\centering{
\fontsize{12pt}{12pt}
\fontspec[Path = \@fontdirnameunder]{\@namefontunder}
\selectfont\color{footercolor}\hfill#4
}\\[10pt] 
}

% подвал

% разделительная черта в подвале
%\renewcommand{\footrulewidth}{0.5pt}
%\def\footrule{{
%  \vskip-\footruleskip\vskip-\footrulewidth
%  \color{footercolor}
%  \hrule\@width\headwidth\@height
%  \footrulewidth\vskip\footruleskip
%}}

\newcommand{\footeritem}[1]{
  \color{footercolor}
  \fontspec[Path = \@fontdirfooter]{\@footerfont}
  \fontsize{8pt}{8pt}
  \selectfont{#1}
}

\newcommand{\footersection}[3]{
  \fancyfoot{}
  \fancyfoot[L]{\footeritem{#1}}
  \fancyfoot[C]{\footeritem{#2}}
  \fancyfoot[R]{\footeritem{#3}}
}

% QR code
\newcommand{\qrcodesection}[1]{
\color{namecolorleft}\qrcode[height=1in]{#1}  
}


%---------------------------------------------------------------------------------------------------
%  Section 
%---------------------------------------------------------------------------------------------------

\titlespacing{\section}{0pt}{0pt}{0pt} % no spacing for section

\titleformat{\section}{ 
\color{sectioncolor}
\fontspec[Path = \@fontdirsection]{\@sectionfont}
\fontsize{20pt}{24pt}
\selectfont
\raggedright
%\uppercase
}{}{0em}{}

%---------------------------------------------------------------------------------------------------
%  Subsection 
%---------------------------------------------------------------------------------------------------

\titlespacing{\subsection}{0pt}{0pt}{0pt} % no spacing for subsection

\titleformat{\subsection}{
\color{subsectioncolor}
\fontspec[Path = \@fontdirsubsection]{\@subsectionfont}
\fontsize{12pt}{14pt}
\selectfont
%\bfseries
%\uppercase
}{}{0em}{}

%---------------------------------------------------------------------------------------------------
%  Subsection in right column (refactor this) 
%---------------------------------------------------------------------------------------------------

% Used for creating subsections where a description is required on the same line
\newcommand{\mainsubsection}[1]{ 
\color{subsectioncolor}
\fontspec[Path = \@fontdirmainsubsection]{\@mainsubsectionfont}
\fontsize{12pt}{12pt}
\selectfont{#1} 
\normalfont
}

% Дата работы/учёбы
\newcommand{\workperiod}[2]{ 
\color{workperiodcolor}
\raggedright
\fontspec[Path = \@fontdirworkperiod]{\@workperiodfont}
\fontsize{10pt}{12pt}
\selectfont {#1\hfill#2} 
\normalfont
}

\newcommand{\workplace}[3]{  
  \mainsubsection{#1}   

  \workperiod{#2}{#3}

}

%---------------------------------------------------------------------------------------------------
%  Items 
%---------------------------------------------------------------------------------------------------

% Defines the tightitemize environment which modifies the itemize environment to be more compact
\newenvironment{tightitemize} 
{\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}
{\end{itemize}\vspace{-\topsep}}