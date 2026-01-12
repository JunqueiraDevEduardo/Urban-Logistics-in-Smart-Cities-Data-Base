%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Beamer based class for DEE@ISEP presentations
% author: Vitor M. R. Cunha
% v1.0, Mar 2024
%
% License: Creative Commons CC BY 4.0
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{DEEclassP}[DEEclassP v1.0 DEE@ISEP]
\providecommand{\baseclass}{beamer}
\RequirePackage{etoolbox}
\RequirePackage{xparse}

\newbool{portuguese}
\newbool{MEEC}
\newbool{LETI}
\newbool{MEECAS}
\newbool{MEECSA}
\newbool{MEECPI}
\newbool{MEECTE}

\DeclareOption{portuguese}{\booltrue{portuguese}}
\DeclareOption{MEEC}{\booltrue{MEEC}}
\DeclareOption{LETI}{\booltrue{LETI}}
\DeclareOption{MEECAS}{\booltrue{MEECAS}}
\DeclareOption{MEECSA}{\booltrue{MEECSA}}
\DeclareOption{MEECPI}{\booltrue{MEECPI}}
\DeclareOption{MEECTE}{\booltrue{MEECTE}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\ProcessOptions\relax

\LoadClass[]{\baseclass}

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}

\ifbool{portuguese}{
  \RequirePackage[portuguese]{babel}
	}{
  \RequirePackage[english]{babel}
}
\RequirePackage{scrbase}
\RequirePackage{xcolor}
\RequirePackage{booktabs}
\RequirePackage{hyperref}
\RequirePackage{calc}
\definecolor{lightergray}{RGB}{230,230,230}
\RequirePackage{listings}
\lstset{ %
 basicstyle=\scriptsize\ttfamily,
 keywordstyle=\bfseries,
 numbers=left,
 numberstyle=\tiny\color{darkgray},
 stepnumber=1,
 numbersep=8pt,
 xleftmargin=2em,
 commentstyle=\color{darkgray},
 keywordstyle=\color{blue},
 showspaces=false,
 showstringspaces=false,
 showtabs=false,
}
\RequirePackage{textpos}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{multimedia}
\RequirePackage{xpatch}
\graphicspath{{./figures/}{./theme/}}

%----------------------------------------------------------------------------------------
%	DEFINE DEE COLORS
%----------------------------------------------------------------------------------------

\definecolor{DEEblue}{RGB}{18,79,135}
\definecolor{ENGbrown}{RGB}{0,0,0}

%----------------------------------------------------------------------------------------
%	CUSTOM LANGUAGE SETTINGS
%----------------------------------------------------------------------------------------

\addto{\captionsenglish}{\renewcommand{\bibname}{References}}
\addto{\captionsportuguese}{\renewcommand{\bibname}{Refer\^{e}ncias}}

%----------------------------------------------------------------------------------------
%	CUSTOM COMMANDS
%----------------------------------------------------------------------------------------

\NewDocumentCommand{\studentnumber}{m}{\newcommand{\stdnumber}{#1}}
\NewDocumentCommand{\predate}{m}{\newcommand{\datename}{#1}}

\newcommand{\textbetweenrules}[2][.2pt]{%
  \par\vspace{\topsep}
  \noindent\makebox[0.8\textwidth]{%
    \sbox0{#2}%
    \dimen0=.5\dimexpr\ht0+#1\relax
    \dimen2=-.5\dimexpr\ht0-#1\relax
    \leaders\hrule height \dimen0 depth \dimen2\hfill
    \quad #2\quad
    \leaders\hrule height \dimen0 depth \dimen2\hfill
  }\par\nopagebreak\vspace{\topsep}
}

\newcommand{\university}{Polit\'{e}cnico do Porto}
\newcommand{\school}{Instituto Superior de Engenharia do Porto}
\newcommand{\department}{Departamento de Engenharia Eletrot\'{e}cnica}
\newcommand{\deedegree}{}
\newcommand{\deedegreelong}{}
\newcommand{\course}{}
\newcommand{\footerlabel}{}

\ifbool{MEEC}{
	\renewcommand{\deedegree}{MEEC}
	\renewcommand{\deedegreelong}{Mestrado em Engenharia Eletrot\'{e}cnica e de Computadores}
	\providecaptionname{english}{\deedegreelong}{Master Degree in Electrical and Computer Engineering}
	\providecaptionname{portuguese}{\deedegreelong}{Mestrado em Engenharia Eletrot\'{e}cnica e de Computadores}
	\institute[]{\deedegreelong}
	\renewcommand{\course}{LOGIS/2025/2026}
	\providecaptionname{english}{\course}{LOGIS/2025/2026}
	\providecaptionname{portuguese}{\course}{LOGIS/2025/2026}
	\renewcommand{\footerlabel}{LOGIS -- MEEC}
}{}

\ifbool{LETI}{
	\renewcommand{\deedegree}{LETI}
	\renewcommand{\deedegreelong}{Licenciatura em Engenharia de Telecomunica\c{c}\~{o}es e Inform\'{a}tica}
	\providecaptionname{english}{\deedegreelong}{Degree in Telecommunications and Informatics Engineering}
	\providecaptionname{portuguese}{\deedegreelong}{Licenciatura em Engenharia de Telecomunica\c{c}\~{o}es e Inform\'{a}tica}
	\institute[]{\deedegreelong}
	\renewcommand{\course}{Projeto/Est\'{a}gio}
	\providecaptionname{english}{\course}{Project/Internship}
	\providecaptionname{portuguese}{\course}{Projeto/Est\'{a}gio}
	\renewcommand{\footerlabel}{PESTA -- LETI}
}{}

\ifbool{MEECAS}{
	\renewcommand{\deedegree}{MEEC-AS}
	\renewcommand{\deedegreelong}{Mestrado em Engenharia Eletrot\'{e}cnica e de Computadores\\-- Automa\c{c}\~{a}o e Sistemas --}
	\providecaptionname{english}{\deedegreelong}{Master in Electrical and Computer Engineering\\-- Automation and Systems --}
	\providecaptionname{portuguese}{\deedegreelong}{Mestrado em Engenharia Electrot\'{e}cnica e de Computadores\\-- Automa\c{c}\~{a}o e Sistemas --}
	\institute[]{\deedegreelong}
	\renewcommand{\course}{Tese/Dissertação}
	\providecaptionname{english}{\course}{Thesis/Dissertation}
	\providecaptionname{portuguese}{\course}{Tese/Dissertação}
	\renewcommand{\footerlabel}{TEDI -- MEEC-AS}
}{}

\ifbool{MEECSA}{
	\renewcommand{\deedegree}{MEEC-SA}
	\renewcommand{\deedegreelong}{Mestrado em Engenharia Eletrot\'{e}cnica e de Computadores\\-- Sistemas Aut\'{o}nomos --}
	\providecaptionname{english}{\deedegreelong}{Master in Electrical and Computer Engineering\\-- Autonomous Systems --}
	\providecaptionname{portuguese}{\deedegreelong}{Mestrado em Engenharia Eletrot\'{e}cnica e de Computadores\\-- Sistemas Aut\'{o}nomos --}
	\institute[]{\deedegreelong}
	\renewcommand{\course}{Tese/Disserta\c{c}\~{a}o}
	\providecaptionname{english}{\course}{Thesis/Dissertation}
	\providecaptionname{portuguese}{\course}{Tese/Disserta\c{c}\~{a}o}
	\renewcommand{\footerlabel}{TEDI -- MEEC-SA}
}{}

\ifbool{MEECPI}{
	\renewcommand{\deedegree}{MEEC-PI}
	\renewcommand{\deedegreelong}{Mestrado em Engenharia Eletrot\'{e}cnica e de Computadores\\-- Sistemas e Planeamento Industrial --}
	\providecaptionname{english}{\deedegreelong}{Master in Electrical and Computer Engineering\\-- Systems And Industrial Planning --}
	\providecaptionname{portuguese}{\deedegreelong}{Mestrado em Engenharia Eletrot\'{e}cnica e de Computadores\\-- Sistemas e Planeamento Industrial --}
	\institute[]{\deedegreelong}
	\renewcommand{\course}{Tese/Disserta\c{c}\~{a}o}
	\providecaptionname{english}{\course}{Thesis/Dissertation}
	\providecaptionname{portuguese}{\course}{Tese/Disserta\c{c}\~{a}o}
	\renewcommand{\footerlabel}{TEDI -- MEEC-PI}
}{}

\newcommand{\makereferecesframe}[1]{
	%\nocite{*}
	\frametitle{\bibname}
	\bibliographystyle{ieeetr}
	\bibliography{#1}
}

%----------------------------------------------------------------------------------------
%	THEME SETTINGS
%----------------------------------------------------------------------------------------

\usetheme{Luebeck}
\usecolortheme[named=DEEblue]{structure}
\usefonttheme{serif}
\useoutertheme{infolines}
\setbeamertemplate{navigation symbols}{}
\setbeamercolor{section in toc}{fg=black}
\setbeamercolor{subsection in toc}{fg=darkgray}
\setbeamerfont{date}{size=\scriptsize}
\setbeamerfont{institute}{size=\scriptsize}
\setbeamertemplate{bibliography item}[text]
%\setbeamertemplate{bibliography item}{\insertbiblabel}
\setbeamercolor{bibliography entry author}{fg=black}
\setbeamercolor{bibliography entry title}{fg=black}
\setbeamercolor{bibliography entry location}{fg=black}
\setbeamercolor{bibliography entry note}{fg=black}
\setbeamerfont{bibliography entry author}{size=\footnotesize}
\setbeamerfont{bibliography entry title}{size=\footnotesize}
\setbeamerfont{bibliography entry location}{size=\footnotesize}
\setbeamerfont{bibliography entry note}{size=\footnotesize}
\addtobeamertemplate{frametitle}{}{%
\begin{textblock*}{18mm}(0.875\textwidth,-1.1cm)
	\centering
	\includegraphics[height=0.8cm,keepaspectratio]{dee_isep_marks_white.pdf}
\end{textblock*}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
\setbeamertemplate{title page}
{
  \ifdefined\datename \date{\datename} \else \date{\today} \fi

  \vbox{}
  \vfill
  \begingroup
    \centering
	{\scshape\scriptsize \course}\vskip1em
    \begin{beamercolorbox}[sep=8pt,center]{title}
      \usebeamerfont{title}\inserttitle\par%
      \ifx\insertsubtitle\@empty%
      \else%
        \vskip0.25em%
        {\usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\insertsubtitle\par}%
      \fi%
    \end{beamercolorbox}%
    \vskip1em\par
    \begin{beamercolorbox}[sep=5pt,center]{author}
      \usebeamerfont{author}\insertauthor\\
      {\tiny (estudante nº \stdnumber)}
    \end{beamercolorbox}%
    \begin{beamercolorbox}[sep=5pt,center]{institute}
    	\textbetweenrules[.2pt]{\scriptsize\deedegree}
    	\vspace{-8pt}
		\usebeamerfont{institute}\insertinstitute
    \end{beamercolorbox}\vskip1.1em
	\begin{tabularx}{0.8\textwidth}{ X >{\centering\arraybackslash}m{4cm} X >{\centering\arraybackslash}m{4cm} X}
	~ & \includegraphics[width=3.3cm,keepaspectratio]{dee_mark_blue.pdf} & ~~ & \includegraphics[width=3.5cm,keepaspectratio]{isep_wordmark_expanded_vintage.pdf} & ~\\
	\end{tabularx}\\
    \begin{beamercolorbox}[sep=8pt,center]{date}
      \usebeamerfont{date}\insertdate
    \end{beamercolorbox}
  \endgroup
  \vfill
}

\setbeamertemplate{footline}
{
  \ifdefined\datename \date{\datename} \else \date{\today} \fi

  \leavevmode%
  \hbox{%
  \begin{beamercolorbox}[wd=.4\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}%
    \usebeamerfont{author in head/foot}\insertshortauthor~~(\stdnumber)
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.25\paperwidth,ht=2.25ex,dp=1ex,center]{title in head/foot}%
    \usebeamerfont{title in head/foot}\hspace*{2ex}\footerlabel
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.25\paperwidth,ht=2.25ex,dp=1ex,center]{date in head/foot}%
    \usebeamerfont{date in head/foot}\hspace*{2ex}\insertdate
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.1\paperwidth,ht=2.25ex,dp=1ex,right]{date in head/foot}%
    \insertframenumber{} / \inserttotalframenumber\hspace*{2ex}
  \end{beamercolorbox}}%
  \vskip0pt%
}

\newcommand{\my@beamer@setlstep}{%
\ifnum\@itemdepth=1\relax
     \setlength\itemsep{\my@beamer@itemsepi}% separation for first level
   \else
     \ifnum\@itemdepth=2\relax
       \setlength\itemsep{\my@beamer@itemsepii}% separation for second level
     \else
       \ifnum\@itemdepth=3\relax
         \setlength\itemsep{\my@beamer@itemsepiii}% separation for third level
   \fi\fi\fi}
\newlength{\my@beamer@itemsepi}\setlength{\my@beamer@itemsepi}{3pt}
\newlength{\my@beamer@itemsepii}\setlength{\my@beamer@itemsepii}{0pt}
\newlength{\my@beamer@itemsepiii}\setlength{\my@beamer@itemsepiii}{0pt}

\newcommand\setlstep[3]{%
    \setlength{\my@beamer@itemsepi}{#1}%
    \setlength{\my@beamer@itemsepii}{#2}%
    \setlength{\my@beamer@itemsepiii}{#3}%
}
\xpatchcmd{\itemize}
  {\def\makelabel}
  {\my@beamer@setlstep\def\makelabel}
 {}
 {}
\xpatchcmd{\beamer@enum@}
  {\def\makelabel}
  {\my@beamer@setlstep\def\makelabel}
 {}
 {}
\makeatother
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%