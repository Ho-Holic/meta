%----------------------------------------------------------------------------------------
% CLASS OPTIONS AND REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{curricula-vitae}[2016/02/10 CV class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % subclass from article
\ProcessOptions

\LoadClass[titlepage]{article} % Load LaTeX's article class with the `titlepage' option so that \maketitle creates a title page, not just a title block

%----------------------------------------------------------------------------------------
% PAGE FORMATTING
%----------------------------------------------------------------------------------------

\usepackage[hmargin=1.25cm, vmargin=0.75cm]{geometry} % specify horizontal and vertical page margins

\setcounter{secnumdepth}{-1} % Remove the numbers from all the headings (\section, \subsection, etc.)

%----------------------------------------------------------------------------------------
% PACKAGES
%----------------------------------------------------------------------------------------

\usepackage{fontspec} % Required for specifying custom fonts in XeLaTeX
\usepackage{titlesec} % Required for customizing section/subsection/etc titles
%\usepackage{color} % Enable colors

%----------------------------------------------------------------------------------------
% COLORS
%----------------------------------------------------------------------------------------

%\definecolor{primary}{HTML}{2b2b2b} % The primary document color for content text
%\definecolor{headings}{HTML}{6A6A6A} % The color of the large sections
%\definecolor{subheadings}{HTML}{333333} % The color of subsections and places worked/studied
%\definecolor{date}{HTML}{666666} % The color used for the Last Updated text at the top right



%----------------------------------------------------------------------------------------
% GENERIC COMMANDS
%----------------------------------------------------------------------------------------

\newcommand{\insertspace}{\vspace{8pt}} % More common space

%----------------------------------------------------------------------------------------
% TITLE
%----------------------------------------------------------------------------------------

\newcommand{\namesection}[1]{ % title with name
\centering{ % Center the name
\fontsize{40pt}{60pt} % Font size
\fontspec[Path = ../fonts/ubuntu/]{Ubuntu-L}
\selectfont #1
}\\[10pt] 
\noindent\makebox[\linewidth]{\rule{\paperwidth}{0.6pt}} % Horizontal split line
}

%----------------------------------------------------------------------------------------
%   CONTENT TEXT 
%----------------------------------------------------------------------------------------
\setmainfont[Path = ../fonts/ubuntu/]{Ubuntu-L} % The primary font for content text; defines bold, italic and bold-italic as well

%----------------------------------------------------------------------------------------
%   SECTION 
%----------------------------------------------------------------------------------------

\titlespacing{\section}{0pt}{0pt}{0pt} % no spacing for section

\titleformat{\section}{ 
%\color{headings}
%\scshape
\fontspec[Path = ../fonts/ubuntu/]{Ubuntu-L}
\fontsize{16pt}{24pt}
\selectfont
%\raggedright
%\uppercase
}{}{0em}{}

%----------------------------------------------------------------------------------------
%   SUBSECTION 
%----------------------------------------------------------------------------------------

\titlespacing{\subsection}{0pt}{0pt}{0pt} % no spacing for subsection

\titleformat{\subsection}{
%\color{subheadings}
\fontspec[Path = ../fonts/ubuntu/]{Ubuntu-L}
\fontsize{12pt}{12pt}
\selectfont
%\bfseries
%\uppercase
}{}{0em}{}

%----------------------------------------------------------------------------------------
%   SUBSECTION 
%----------------------------------------------------------------------------------------

\newcommand{\mainsubsection}[1]{ % Used for creating subsections where a description is required on the same line
\color{subheadings}\fontspec[Path = ../fonts/ubuntu/]{Ubuntu-L}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont}

\newcommand{\addinfo}[1]{ % Used for describing the subsection either on the same line or underneath
\color{subheadings}\raggedright\scshape\fontspec[Path = ../fonts/ubuntu/]{Ubuntu-L}\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}