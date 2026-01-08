%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% DEE@ISEP class for MEEC dissertations
% original file adapted and further developed by Vitor M. R. Cunha
% % v1.4, Mar 2024
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% original file:
% Masters/Doctoral Thesis 
% Class File
% Version 1.6 (27/8/17)
%
% This class was downloaded from:
% http://www.LaTeXTemplates.com
%
% Authors:
% Vel (vel@latextemplates.com)
% Johannes Böttcher
%
% Notes:
% 1) This class file defines the structure and layout of the template file (main.tex).
% 2) It has been written in such a way that under most circumstances you should not need
% to edit it; updating it to a newer version will be harder. If you do make changes, please change the name of
% the file and add comments to make your changes more visible.
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS DEFINITION AND PARAMETERS
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\newcommand{\classname}{DEEclass}
\ProvidesClass{\classname}[DEEclass v1.0 DEE@ISEP]
\providecommand{\baseclass}{book}
\RequirePackage{etoolbox}
\RequirePackage{xparse}

\newbool{nolistspace}
\booltrue{nolistspace}	%keeps tables single spaced
\newbool{listtoc}
\booltrue{listtoc}		%add lists to the toc
\newbool{headsepline}
\booltrue{headsepline}	%add header underline
\newbool{portuguese}	%to set the babel language 
\newbool{MEECAS}		%to set the DEE course for front pages
\newbool{MEECSA}
\newbool{MEECPI}
\newbool{MEECTE}

\DeclareOption{portuguese}{\booltrue{portuguese}}
\DeclareOption{MEECAS}{\booltrue{MEECAS}}
\DeclareOption{MEECSA}{\booltrue{MEECSA}}
\DeclareOption{MEECPI}{\booltrue{MEECPI}}
\DeclareOption{MEECTE}{\booltrue{MEECTE}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\ProcessOptions\relax

\LoadClass[11pt,a4paper]{\baseclass}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Simple interface for the user  to customize the chapter titles 
\ProvideDocumentCommand{\abovechapterskip}{}{\vspace*{20pt}}
\ProvideDocumentCommand{\chapterbelowskip}{}{\vspace*{40pt}}
\ProvideDocumentCommand{\chapterinbetweenskip}{}{\vspace*{20pt}}
\ProvideDocumentCommand{\autodot}{}{}
\ProvideDocumentCommand{\mdtChapapp}{}{}
\ProvideDocumentCommand{\chapteralign}{}{\raggedright}
\ProvideDocumentCommand{\chapterfont}{}{\Huge\bfseries}
\ProvideDocumentCommand{\chapterprefixfont}{}{\LARGE\bfseries}

\DeclareDocumentCommand{\@makechapterhead}{ m }{%
	\abovechapterskip
	{\parindent \z@ \chapteralign \normalfont
		\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter{
				\vspace*{100pt}
				\chapterprefixfont \@chapapp\space \thechapter
				\par\nobreak
				\chapterinbetweenskip } 			
		\else {
				\chapterprefixfont \@chapapp\space \thechapter
				\par\nobreak
				\chapterinbetweenskip  	}		
		\fi
		\fi
		\interlinepenalty\@M%
		\chapterfont #1\par\nobreak
		\chapterbelowskip
		\if@mainmatter{		
			\vspace*{40pt}}		
		\fi
	}
	\thispagestyle{\chapter@p@gestyle}
}

\def\@makeschapterhead#1{%
	\abovechapterskip
	{\parindent \z@ \chapteralign
		\normalfont
		\interlinepenalty\@M
		\chapterfont  #1\par\nobreak
		\chapterbelowskip
	}
	\thispagestyle{\chapter@p@gestyle}
}

% Addchap provides unnumbered chapters with an entry in the table of contents as well as an updated header
\ProvideDocumentCommand{\addchap}{ s o m }{%
	\chapter*{#3}%
	\markboth{}{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addchaptertocentry{#3}%
			\markboth{\MakeMarkcase{#3}}{\MakeMarkcase{#3}}%
		}{%
			\addchaptertocentry{#2}%
			\markboth{\MakeMarkcase{#2}}{\MakeMarkcase{#2}}%
		}%
	}%
}%

\ProvideDocumentCommand{\addsec}{ s o m }{%
	\section*{#3}%
	\markright{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addcontentsline{toc}{section}{#3}%
			\markright{\MakeMarkcase{#3}}%%
		}{%
			\addcontentsline{toc}{section}{#2}%
			\markright{\MakeMarkcase{#2}}%
		}%
	}%
}%

%----------------------------------------------------------------------------------------
%	CLASS OPTIONS
%----------------------------------------------------------------------------------------

\ifbool{listtoc}{	% With the liststotoc option the lists are added to the table of contents
	\patchcmd{\listoftables}{\@starttoc{lot}}{%
		\addchaptertocentry{\listtablename}\@starttoc{lot}%
	}{}{}%
	\patchcmd{\listoffigures}{\@starttoc{lof}}{%
		\addchaptertocentry{\listfigurename}\@starttoc{lof}%
	}{}{}%
}

\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------
 				
\RequirePackage[utf8]{inputenc} 	% Required for inputting international characters
\RequirePackage[T1]{fontenc} 		% Output font encoding for international characters
\RequirePackage{lmodern} 			% THE font

\ifbool{portuguese}{% Required for automatically changing names of document elements to languages besides english
  \RequirePackage[portuguese]{babel}
	}{
  \RequirePackage[english]{babel}
}

\RequirePackage{scrbase} % Required for handling language-dependent names of sections/document elements

\RequirePackage{scrhack} % Loads fixes for various packages

\RequirePackage{longtable} % Required for tables that span multiple pages 

\RequirePackage{xcolor} % Required for specifying custom colours
\definecolor{lightgray}{rgb}{.9,.9,.9}

\RequirePackage{graphicx} % Required to include images

\graphicspath{{figures/}{front/}} 	% Specifies where to look for included images

\RequirePackage{booktabs} % Required for better table rules

\RequirePackage{caption} % Required for customising the captions
\captionsetup{justification=centerlast,font=small,margin=50pt}

\RequirePackage[autostyle=true]{csquotes} 	% For language-dependent quotes

\RequirePackage[hidelinks]{hyperref}		%To pro­duce hy­per­text links in the doc­u­ment
\hypersetup{hidelinks,
bookmarksopen=true,
bookmarksopenlevel=0,
breaklinks=true,
}
\PassOptionsToPackage{hyphens}{url}\usepackage{hyperref} % To break long urls

\RequirePackage{calc}			% to perform arithmetic on the arguments of the LATEX commands

\RequirePackage{listings} % Required for code listings
\lstset{ %
 %language=C,                        % choose the language of the code
 basicstyle=\footnotesize\ttfamily,
 keywordstyle=\bfseries,
 numbers=left,                      % where to put the line-numbers   
 numberstyle=\tiny\color{gray},		% the size of the fonts that are used for the line-numbers
 stepnumber=1,                      % the step between two line-numbers. If it's 1 each line will be numbered
 numbersep=8pt,                     % how far the line-numbers are from the code
 xleftmargin=2em,					% keep line numbers inside the margins		
 frame=tb,							% frame: top and bottom lines
 framexleftmargin=1.5em,			% frame: adjusts left margin because the xleftmargin numbers setting
 float=!htb,						% if float defined, let Latex manage it
 aboveskip=8mm,
 belowskip=4mm,
 backgroundcolor=\color{white},
 commentstyle=\color{darkgray},    	% comment style
 %keywordstyle=\color{blue},       	% keyword style
 showspaces=false,                  % show spaces adding particular underscores
 showstringspaces=false,            % underline spaces within strings
 showtabs=false,                    % show tabs within strings adding particular underscores
 tabsize=2,	                    	% sets default tabsize to 2 spaces
 captionpos=b,                      % sets the caption-position to bottom
 breaklines=true,                   % sets automatic line breaking
 breakatwhitespace=false,           % sets if automatic breaks should only happen at whitespace
 escapeinside={\%*}{*)},            % if you want to add a comment within your code
 morekeywords={*,var,template,new}  % if you want to add more keywords to the set
}

\RequirePackage[calc,portuguese]{datetime2}	% For date format
\DTMnewdatestyle{mydateformat}{%
  \renewcommand{\DTMdisplaydate}[4]{%
%    \DTMshortweekdayname{##4},\space% 
    \DTMmonthname{##2},\nobreakspace%  
%    \number##3,\space%                
    \number##1%                       
  }%
  \renewcommand{\DTMDisplaydate}{\DTMdisplaydate}%
}

\RequirePackage{siunitx} 		% required for \SI commands
\RequirePackage[acronym,toc,shortcuts,nopostdot,nogroupskip,automake]{glossaries} %for lists of terms, acronyms and symbols
\RequirePackage{enumitem} 		% for acronyms list spacing

\RequirePackage{notoccite}		% prevents cite command count in frontmatter

\RequirePackage[titletoc,title]{appendix} %for easy appendix management

\RequirePackage{algpseudocode}	
\RequirePackage[plain,chapter]{algorithm}	% way for inserting good looking pseudocode in a float
\algrenewcommand{\alglinenumber}[1]{\tiny\color{gray}#1~}

%----------------------------------------------------------------------------------------
%	DEFINE CUSTOM THESIS INFORMATION COMMANDS
%----------------------------------------------------------------------------------------

\NewDocumentCommand{\thesistitle} { o m }{%
 \IfValueTF{#1}{\def\shorttitle{#1}}{\def\shorttitle{#2}}%
 \def\@title{#2}%
 \def\ttitle{#2}%
}
\DeclareDocumentCommand{\author}{m}{\newcommand{\authorname}{#1}\renewcommand{\@author}{#1}}
\NewDocumentCommand{\studentnumber}{m}{\newcommand{\stdnumber}{#1}}
\NewDocumentCommand{\studentemail}{m}{\newcommand{\stdemail}{#1}}
\NewDocumentCommand{\advisor}{m m}{\newcommand{\advname}{#1, \url{#2}}}
\NewDocumentCommand{\coadvisor}{m m}{\newcommand{\coadvname}{#1, \url{#2}}}
\NewDocumentCommand{\company}{m}{\newcommand{\companyname}{#1}}
\NewDocumentCommand{\supervisor}{m m}{\newcommand{\supname}{#1, \url{#2}}}
\NewDocumentCommand{\subdate}{m}{\newcommand{\datename}{#1}}
\NewDocumentCommand{\researchgroup}{m}{\newcommand{\groupname}{#1}}

% New command to move content to the next page which prints to the next odd page if twosided mode is active
\newcommand{\checktoopen}{  
	\if@openright\cleardoublepage\else\clearpage\fi
	\ifdef{\phantomsection}{\phantomsection}{}% The \phantomsection command is necessary for hyperref to jump to the correct page
}

\NewDocumentCommand{\bhrule}{}{\typeout{--------------------}}
\NewDocumentCommand{\tttypeout}{m}{\bhrule\typeout{\space #1}\bhrule}

\newcommand{\HRule}{\rule{.9\linewidth}{.6pt}} % New command to make the lines in the title page
\newcommand{\decoRule}{\rule{.8\textwidth}{.4pt}} % New command for a rule to be used under figures

\setcounter{tocdepth}{3} % The depth to which the document sections are printed to the table of contents

\ProvideDocumentCommand{\addchaptertocentry}{ m }{%
	\addcontentsline{toc}{chapter}{#1}%
}

%----------------------------------------------------------------------------------------
%	CUSTOM LANGUAGE SETTINGS
%----------------------------------------------------------------------------------------
\addto{\captionsportuguese}{\renewcommand*\contentsname{\'{I}ndice}}

\addto{\captionsportuguese}{\renewcommand{\appendixname}{Anexo}}

\addto{\captionsenglish}{\renewcommand{\bibname}{References}}
\addto{\captionsportuguese}{\renewcommand{\bibname}{Refer\^{e}ncias}}

\newcommand{\reftocname}{References}
\providecaptionname{english}{\reftocname}{References}
\providecaptionname{portuguese}{\reftocname}{Refer\^{e}ncias}

\addto{\captionsenglish}{\renewcommand{\lstlistlistingname}{Listings}}
\addto{\captionsportuguese}{\renewcommand{\lstlistlistingname}{Listagens}}

\newcommand{\secondLang}{portuguese}
\iflanguage{portuguese}{
	\renewcommand{\lstlistingname}{Listagem}
 	\renewcommand{\ALG@name}{Algoritmo}
	\renewcommand{\secondLang}{english}
	\newtheorem{theorem}{Teorema}
	\newtheorem{corollary}{Corolário}
	\newtheorem{lemma}{Lema}	
}{
	\newtheorem{theorem}{Theorem}
	\newtheorem{corollary}{Corollary}
	\newtheorem{lemma}{Lemma}
}

\RequirePackage[hyperpageref]{backref}
\renewcommand*{\backref}[1]{}
\iflanguage{portuguese}{
    \renewcommand*{\backrefalt}[4]{%
      \ifcase #1 %
      \or
      {\footnotesize [Citado na p\'{a}gina #2]}%
      \else
      {\footnotesize [Citado nas p\'{a}ginas #2]}%
      \fi
    }
    \renewcommand*{\backreftwosep}{ e~}
    \renewcommand*{\backreflastsep}{ e~}
}{
    \renewcommand*{\backrefalt}[4]{%
      \ifcase #1 %
      \or
      {\footnotesize [Cited on page #2]}%
      \else
      {\footnotesize [Cited on pages #2]}%
      \fi
    }
}

%----------------------------------------------------------------------------------------
%	MARGINS and SPACING
%----------------------------------------------------------------------------------------

\RequirePackage{setspace} % Required for changing line spacing
\onehalfspacing	%from the setspace package

\RequirePackage{geometry}
\geometry{
	headheight=4ex,
%	includehead,
%	includefoot,
	paper=a4paper, 
	inner=2cm, % Inner margin
	outer=2.5cm, % Outer margin
	bindingoffset=.2cm, % Binding offset
	top=1.5cm, % Top margin
	bottom=2cm, % Bottom margin
	%showframe, % Uncomment to show how the type block is set on the page	
}

\raggedbottom

% If the option `nolistspacing' is given, the spacing in the different lists is reduced to single spacing. This option is only useful, if the spacing of the document has been changed to onehalfspacing or doublespacing.
\ifbool{nolistspace}{
	\patchcmd{\listoffigures}{%
		\@starttoc{lof}
	}{%
		\begingroup%
		\singlespace\@starttoc{lof}\endgroup%
	}{}{}%
	\patchcmd{\listoftables}{%
		\@starttoc{lot}
	}{%
		\begingroup%
		\singlespace\@starttoc{lot}\endgroup%
	}{}{}%
	\patchcmd{\tableofcontents}{%
		\@starttoc{toc}
	}{%
		\begingroup%
		\singlespace\@starttoc{toc}\endgroup%
	}{}{}%
}{}
%----------------------------------------------------------------------------------------
%	PENALTIES
%----------------------------------------------------------------------------------------

\doublehyphendemerits=10000 % No consecutive line hyphens
\brokenpenalty=10000 % No broken words across columns/pages
\widowpenalty=9999 % Almost no widows at bottom of page
\clubpenalty=9999 % Almost no orphans at top of page
\interfootnotelinepenalty=9999 % Almost never break footnotes

%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS STYLE
%----------------------------------------------------------------------------------------

\RequirePackage[markcase=used]{scrlayer-scrpage}
\providepairofpagestyles{thesisSimple}{%
	\clearpairofpagestyles%
	\automark[chapter]{chapter}
	\ihead{\headmark}% Inner header
	\ohead{\pagemark}% Outer header
	\cfoot[\pagemark]{} %new
}
\ifoot{}% Inner footer
\ofoot{}% Outer footer
\pagestyle{thesisSimple}
\providepairofpagestyles[thesisSimple]{thesis}{%
	\automark*[section]{}%
}
\providepairofpagestyles[thesisSimple]{review}{%
	\ofoot[\shorttitle/\authorname]{\shorttitle/\authorname}
	\ifoot[\today]{\today}
}
\pagestyle{thesis}
\ifbool{headsepline}{\KOMAoption{headsepline}{true}}{}
\PreventPackageFromLoading[\ClassError{\classname}{Package `fancyhdr' is
incompatible\MessageBreak with this class}{The pagesyles are defined 
	using package `scrlayer-scrpage', please consult the\MessageBreak 
KOMA-script documentation for details.}]{fancyhdr}

\newcommand{\blank@p@gestyle}{empty}
\newcommand{\chapter@p@gestyle}{plain}
\NewDocumentCommand{\blankpagestyle}{ m }{%
	\ClassWarning{\classname}{\string\blankpagestyle\space is
	obsolete,\MessageBreak use \string\setblankpagestyle \space  instead}\renewcommand{\blank@p@gestyle}{}{#1}
}
\NewDocumentCommand{\setblankpagestyle}{ m }{\renewcommand{\blank@p@gestyle}{#1}}
\NewDocumentCommand{\setchapterpagestyle}{ m }{\renewcommand{\chapter@p@gestyle}{#1}}

\DeclareDocumentCommand\cleardoublepage{}{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}
	\thispagestyle{\blank@p@gestyle}
	\if@twocolumn\hbox{}\fi\fi\fi%
}

%----------------------------------------------------------------------------------------
%	TITLE PAGES DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\university}{Polit\'{e}cnico do Porto}
\newcommand{\school}{Instituto Superior de Engenharia do Porto}
\newcommand{\department}{Departamento de Engenharia Eletrot\'{e}cnica}
\newcommand{\degree}{}
\newcommand{\darea}{}

\renewcommand{\degree}{Mestrado em Engenharia Electrot\'{e}cnica e de Computadores}
\providecaptionname{english}{\degree}{Master in Electrical and Computer Engineering}
\providecaptionname{portuguese}{\degree}{Mestrado em Engenharia Electrot\'{e}cnica e de Computadores}
	
\ifbool{MEECAS}{
	\renewcommand{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Automa\c{c}\~{a}o e Sistemas}
	\providecaptionname{english}{\darea}{Specialization Area of Automation and Systems}
	\providecaptionname{portuguese}{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Automa\c{c}\~{a}o e Sistemas}	
}{}

\ifbool{MEECSA}{
	\renewcommand{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Sistemas Aut\'{o}nomos}
	\providecaptionname{english}{\darea}{Specialization Area of Autonomous Systems}
	\providecaptionname{portuguese}{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Sistemas Aut\'{o}nomos}		
}{}

\ifbool{MEECPI}{
	\renewcommand{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Sistemas e Planeamento Industrial}
	\providecaptionname{english}{\darea}{Specialization Area of Systems And Industrial Planning}
	\providecaptionname{portuguese}{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Sistemas e Planeamento Industrial}		
}{}

\ifbool{MEECTE}{
	\renewcommand{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Telecomunica\c{c}\~{o}es}
	\providecaptionname{english}{\darea}{Specialization Area of Telecommunications}
	\providecaptionname{portuguese}{\darea}{\'{A}rea de Especializa\c{c}\~{a}o em Telecomunica\c{c}\~{o}es}		
}{}

\newcommand{\frontcourselabel}{{\large \degree}\\{\large \darea}\\}

\newcommand{\disclamer}{This dissertation partially satisfies the requirements defined for the Thesis/Dissertation course of the program }
\providecaptionname{english}{\disclamer}{This dissertation partially satisfies the requirements of the Thesis/Dissertation course of the program }
\providecaptionname{portuguese}{\disclamer}{Este documento satisfaz, parcialmente, os requisitos que constam da Ficha de Unidade Curricular de Logistica do 1º ano, do }

\newcommand{\aftercourselabel}{\large \textit{\disclamer \degree, \darea.}\\}

%%

\newcommand{\studentlabel}{Candidate}
\providecaptionname{english}{\studentlabel}{Candidate}
\providecaptionname{portuguese}{\studentlabel}{Candidato}

\newcommand{\nblabel}{nb.}
\providecaptionname{english}{\nblabel}{{No. }}
\providecaptionname{portuguese}{\nblabel}{{Nº }}

\newcommand{\advisorlabel}{Scientific Guidance}
\providecaptionname{english}{\advisorlabel}{Scientific Guidance}
\providecaptionname{portuguese}{\advisorlabel}{Orienta\c{c}\~{a}o Cient\'{i}fica}

\newcommand{\coadvisorlabel}{Scientific Co-Guidance}
\providecaptionname{english}{\coadvisorlabel}{Scientific Co-Guidance}
\providecaptionname{portuguese}{\coadvisorlabel}{Coorienta\c{c}\~{a}o Cient\'{i}fica}

\newcommand{\supervisorlabel}{Advisor}
\providecaptionname{english}{\supervisorlabel}{Advisor}
\providecaptionname{portuguese}{\supervisorlabel}{Orientador}

\newcommand{\companylabel}{Company}
\providecaptionname{english}{\companylabel}{Company}
\providecaptionname{portuguese}{\companylabel}{Empresa}

\newcommand{\printcoverpage}{
	\begin{titlepage}
	\pdfbookmark[0]{Front}{cover}
	\begin{center}
	{\scshape\normalsize \university}\\[3mm]
	{\scshape\LARGE \school}\\
	\vfill	
	\HRule \\ % Horizontal line
	\vspace{15pt}	
	{\huge \bfseries \ttitle\par}\vspace{0.4cm} % Thesis title
	%\ifdefined\tsubtitle {\huge \bfseries \tsubtitle} \\ \fi % Thesis sub title, if exists
	\vspace{3pt}
	\HRule \\[1.5cm] % Horizontal line
	{\Large\bf \authorname}\par	
	\vfill	
	\frontcourselabel
	\vfill	
	\includegraphics[width=6cm]{isep_wordmark_expanded_vintage.pdf}\\[1cm]	
	{\scshape\large \department}\\
	{\large \school}\\[1cm]
	\DTMsetdatestyle{mydateformat}
	\ifdefined\datename {\normalsize \datename}\\[5mm] \else {\normalsize \today}\\[5mm] \fi
	\end{center}
	\end{titlepage}
}

\newcommand{\printaftercoverpage}{
	\checktoopen
	\thispagestyle{empty}
	\begin{center}
	\vspace*{.2\textheight}	
	\aftercourselabel	
	\vfill
	{{\small\bf\studentlabel:} \large \authorname, \nblabel \stdnumber, \url{\stdemail}}\\[4pt]
	{{\small\bf\advisorlabel:} \large \advname }\\[4pt]
	\ifdefined\coadvname {{\small\bf\coadvisorlabel:} \coadvname}\\[4pt] \fi
	\ifdefined\companyname {{\small\bf\companylabel:} \companyname\\{\small\bf\supervisorlabel:} \supname}\\ \fi
	\vfill
	\includegraphics[width=6cm]{isep_wordmark_expanded_vintage.pdf}\\[1cm]		
	{\scshape\large \department}\\
	{\large \school}\\
	{\normalsize Rua Dr. Ant\'{o}nio Bernardino de Almeida, 431, 4200--072 Porto}\\[1cm]
	\DTMsetdatestyle{mydateformat}	
	\ifdefined\datename {\normalsize \datename}\\[5mm] \else {\normalsize \today}\\[5mm] \fi
	\end{center}
}

%----------------------------------------------------------------------------------------
%	DEDICATION PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand\dedicatory[1]{
	\checktoopen
	\tttypeout{Dedicatory}
	\null\vfil
	\thispagestyle{empty}
	\begin{flushright}{\slshape #1}\end{flushright}
	\vfil\null
}

%----------------------------------------------------------------------------------------
%	ACKNOWLEDGEMENTS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\acknowledgementname}{Acknowledgements}
\providecaptionname{english}{\acknowledgementname}{Acknowledgements} % Acknowledgement text for English countries
\providecaptionname{portuguese}{\acknowledgementname}{Agradecimentos} 

\DeclareDocumentEnvironment{acknowledgements}{}{%
	\checktoopen
	\tttypeout{\acknowledgementname}
	\chapter*{\acknowledgementname}
	\thispagestyle{empty}
	\pdfbookmark[0]{\acknowledgementname}{acknowl}
	}
	{
	\vfil\vfil\null
	\cleardoublepage
	}
	
%----------------------------------------------------------------------------------------
%	ABSTRACT PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\abstraclabel}{Abstract}
\providecaptionname{english}{\abstraclabel}{Abstract}
\providecaptionname{portuguese}{\abstraclabel}{Resumo} % Portuguese 

\newcommand{\keywordslabel}{Keywords}
\providecaptionname{english}{\keywordslabel}{Keywords}
\providecaptionname{portuguese}{\keywordslabel}{Palavras-Chave} % Portuguese 

\newenvironment{abstract}{
	\setcounter{page}{1}
	\checktoopen	
	\tttypeout{\abstraclabel}
	\thispagestyle{plain}
	\chapter*{\abstraclabel}
	\pdfbookmark[0]{\abstraclabel}{abstract1}	
	}
	{
  	\vfill\null
	}

\newenvironment{secondlangabstract}{
	\checktoopen
	\begin{otherlanguage}{\secondLang}
	\tttypeout{\abstraclabel}
	\thispagestyle{plain}
	\chapter*{\abstraclabel}
	\pdfbookmark[0]{\abstraclabel}{abstract2}
	}
	{
	\end{otherlanguage}
  	\vfill\null
	}
%----------------------------------------------------------------------------------------
%	LISTINGS PAGE DESIGN
%----------------------------------------------------------------------------------------
\newcommand{\printlistoflistings}{
	\lstlistoflistings  % Prints the list of listings (programming language source code segments)
	\addchaptertocentry{\lstlistlistingname} %Adds the list of listings to the table of contents
}

%----------------------------------------------------------------------------------------
%	ALGORITHMS PAGE DESIGN
%----------------------------------------------------------------------------------------
\providecaptionname{english,british,american}{\listalgorithmname}{List of Algorithms}
\providecaptionname{portuguese}{\listalgorithmname}{Lista de Algoritmos}
	
\newcommand{\printlistofalgorithms}{
	\listofalgorithms
	\addchaptertocentry{\listalgorithmname}
}

%----------------------------------------------------------------------------------------
%	GLOSSARY PAGE DESIGN
%----------------------------------------------------------------------------------------
\newcommand{\glossname}{Glossary}
\providecaptionname{english,british,american}{\glossname}{Glossary}
\providecaptionname{portuguese}{\glossname}{Gloss\'{a}rio}

\newcommand{\printlistofterms}{
	\printglossary[nonumberlist,style=altlist,title=\glossname]
}

%----------------------------------------------------------------------------------------
%	ACRONYMS PAGE DESIGN
%----------------------------------------------------------------------------------------
\newcommand{\acronymsname}{List of Acronyms}
\providecaptionname{english,british,american}{\acronymsname}{List of Acronyms}
\providecaptionname{portuguese}{\acronymsname}{Lista de Acr\'{o}nimos}

\newglossarystyle{leftlong}{%
  \setglossarystyle{long}%
  \renewcommand{\glossentry}[2]{%
    \glsentryitem{##1}\glstarget{##1}{\bfseries \glossentryname{##1}} &
    \glossentrydesc{##1}\glspostdescription\space ##2\tabularnewline
  }%
}

\newcommand{\printlistofacronyms}[1]{
	\setlist[description]{leftmargin=!, labelwidth=\widthof{#1}} % Change for glossaries
	\printglossary[title=\acronymsname,type=\acronymtype,nonumberlist]	% Prints the list  
	\setlist[description]{style=standard} % reset settings back to default
}

%\setlength\LTleft{0pt}
%\setlength\glsdescwidth{0.75\hsize}

%----------------------------------------------------------------------------------------
%	SYMBOLS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\symbolsname}{List of Symbols}
\providecaptionname{english,british,american}{\symbolsname}{List of Symbols}
\providecaptionname{portuguese}{\symbolsname}{Lista de S\'{i}mbolos}

\newcommand{\symbolsSymbol}{Symbol}
\providecaptionname{english,british,american}{\symbolsSymbol}{Symbol}
\providecaptionname{portuguese}{\symbolsSymbol}{S\'{i}mbolo}
\newcommand{\symbolsDescription}{Description}
\providecaptionname{english,british,american}{\symbolsDescription}{Description}
\providecaptionname{portuguese}{\symbolsDescription}{Descri\c{c}\~{a}o}
\newcommand{\symbolsUnits}{Units}
\providecaptionname{english,british,american}{\symbolsUnits}{Units}
\providecaptionname{portuguese}{\symbolsUnits}{Unidades}

\newglossary[slg]{symbolslist}{syi}{syg}{List of Symbols} % create add. symbolslist
\glsaddkey{unit}{\glsentrytext{\glslabel}}{\glsentryunit}{\GLsentryunit}{\glsunit}{\Glsunit}{\GLSunit}
\glssetnoexpandfield{unit}

\newglossarystyle{symbunitlong}{%
\setglossarystyle{long3col}% base this style on the list style
\renewenvironment{theglossary}{% Change the table type --> 3 columns
  \begin{longtable}{cp{0.6\glsdescwidth}>{\centering\arraybackslash}p{2cm}}}%
  {\end{longtable}}%
%
\renewcommand*{\glossaryheader}{%  Change the table header
  \tabhead{\symbolsSymbol} & \tabhead{\symbolsDescription} & \tabhead{\symbolsUnits}\\
  %\bfseries \symbolsSymbol & \bfseries \symbolsDescription & \bfseries \symbolsUnits\\
  \midrule%\hline
  \endhead}
\renewcommand*{\glossentry}[2]{%  Change the displayed items
\glstarget{##1}{\glossentryname{##1}} %
& \glossentrydesc{##1}% Description
& \glsunit{##1}  \tabularnewline
}
}

\newcommand{\printlistofsymbols}{
	\glsaddall[types={symbolslist}]
	\printglossary[title=\symbolsname,type=symbolslist,style=symbunitlong,nonumberlist]
	}

%----------------------------------------------------------------------------------------
%	CUSTOM DISSERTATION COMMANDS
%----------------------------------------------------------------------------------------
% new command for inline graphics (set to line height)
\newlength\myheight				
\newlength\mydepth
\settototalheight\myheight{Xygp}
\settodepth\mydepth{Xygp}
\setlength\fboxsep{0pt}
\newcommand*\inlinegraphics[1]{%
  \settototalheight\myheight{Xygp}%
  \settodepth\mydepth{Xygp}%
  \raisebox{-\mydepth}{\includegraphics[height=\myheight]{#1}}%
}

% Print the bibliographic references using the IEEEtrans format
\newcommand{\printrefereces}[1]{
\phantomsection
\addcontentsline{toc}{chapter}{\reftocname}
%\nocite{*}
\bibliographystyle{ieeetr}
\bibliography{#1}
}

% Define some commands to keep the formatting separated from the content 
\newcommand{\tabhead}[1]{\textbf{#1}}
\newcommand{\code}[1]{\texttt{#1}}
%\newcommand{\file}[1]{\texttt{\bfseries#1}}
\newcommand{\file}[1]{\texttt{#1}}
\newcommand{\option}[1]{\texttt{\itshape#1}}

%----------------------------------------------------------------------------------------
% --- Comandos para controlar numeração e modo ---
\providecommand{\frontmatter}{%
  \cleardoublepage
  \@mainmatterfalse
  \setcounter{secnumdepth}{-1} % sem numeração de capítulos
  \pagenumbering{roman}        % algarismos romanos minúsculos
}

\providecommand{\mainmatter}{%
  \cleardoublepage
  \@mainmattertrue
  \setcounter{secnumdepth}{3}  % ativa numeração normal
  \pagenumbering{arabic}       % algarismos arábicos
}
\endinput

