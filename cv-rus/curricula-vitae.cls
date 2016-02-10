%----------------------------------------------------------------------------------------
% CLASS OPTIONS AND REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{curricula-vitae}[2016/02/10 CV class]


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Passes and class options to the underlying article class
\ProcessOptions


\LoadClass[titlepage]{article} % Load LaTeX's article class with the `titlepage' option so that \maketitle creates a title page, not just a title block

\setcounter{secnumdepth}{-1} % Remove the numbers from all the headings (\section, \subsection, etc.)

%----------------------------------------------------------------------------------------
% COLORS
%----------------------------------------------------------------------------------------

\definecolor{primary}{HTML}{2b2b2b} % The primary document color for content text
\definecolor{headings}{HTML}{6A6A6A} % The color of the large sections
\definecolor{subheadings}{HTML}{333333} % The color of subsections and places worked/studied
\definecolor{date}{HTML}{666666} % The color used for the Last Updated text at the top right

%----------------------------------------------------------------------------------------
% Title with name
%----------------------------------------------------------------------------------------

\newcommand{\namesection}[1]{ % title with name
\centering{ % Center the name
#1
}\\[5pt] 
}