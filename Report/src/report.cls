% Load the Base Class
\LoadClassWithOptions{article}

%% Begin dependencies
%\usepackage{sectsty}
%% Make sections sansserif
%\allsectionsfont{\normalfont\sffamily\bfseries}
%
\usepackage{titlesec}
%\usepackage{graphicx}
%\usepackage{caption}
%
%\usepackage[round]{natbib}
%\bibliographystyle{apalike}
%
%\usepackage[hidelinks]{hyperref}
\usepackage{titling}
%
%\usepackage{acro}
%% \acsetup{first-style=long}
%
%% Allow acronyms to be a separate file
%\usepackage{verbatim}
%
\usepackage{geometry}
% Set the Paper Size and margins
\geometry{margin=1.0in}
%
%\usepackage{array}
%% Create table columns with specified length
%\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
%\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
%\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
%% Make table rows spaced apart
%\renewcommand{\arraystretch}{1.5}

%\usepackage{fancyhdr}
%% \setlength{\headheight}{15.2pt}
%\pagestyle{fancyplain}
%
%\usepackage{tikz}
%\usetikzlibrary{arrows,shapes} 
%\usetikzlibrary{positioning}
%\usetikzlibrary{arrows.meta}
%\usetikzlibrary{calc}

\usepackage{forarray}

%\setlength{\parskip}{10pt}

%\fancypagestyle{empty}{
% \fancyhf{}
% \fancyhead[L]{\therunningheader}
%}
%\renewcommand{\headrulewidth}{0pt}
%\lhead{\therunningheader}
%\rhead{}

% Prevent hyphenation
%\raggedright

% Prevent paragraphs from cutting off
%\widowpenalties 1 10000
%\raggedbottom

% Make captions centered
%\captionsetup{justification=centering,margin=2cm}

% Remove small abstract title
%\patchcmd{\abstract}{\small}{\Large}{}{}

% Begin new commands
%\newcommand{\runningheader}[1]{
%	\def\therunningheader{#1}
%}
\newcommand{\for}[1]{
	\def\thefor{#1}
}
\newcommand{\authorformat}{
	by \par
	\ForEachX{,}{
		\thislevelitem \par
	}{\theauthor}
}
\newcommand{\forformat}{
	for \par
	\ForEachX{,}{
		\thislevelitem \par
	}{\thefor}
}
\def\changemargin#1{\list{}{\rightmargin#1\leftmargin#1}\item[]}
\let\endchangemargin=\endlist 

\date{\today} % needed for \thedate to work
\renewcommand{\maketitle}{
	\begin{titlepage}
		% \centering
		\vspace*{0.5in}
		%\begin{changemargin}{1.5in}
			\centering

			{\huge\bfseries \thetitle \par }
			\vspace{1.2in}
			{\large\bfseries \forformat }
			\vspace{1.2in}
			{\large\bfseries \authorformat }

			\vfill

			% Bottom of the page
			{\large \thedate \par}
		%\end{changemargin}
	\end{titlepage}
}

%\renewenvironment{abstract}{
%	\begin{center}
%		{\Large\sffamily\bfseries Abstract \par}
%	\end{center}
%	\noindent
%	\normalfont
%	\begin{changemargin}{0.5in}
%
%}{\end{changemargin}}

% Allow footnotes without marker
%\newcommand\blfootnote[1]{%
%  \begingroup
%  \renewcommand\thefootnote{}\footnote{#1}%
%  \addtocounter{footnote}{-1}%
%  \endgroup
%}
