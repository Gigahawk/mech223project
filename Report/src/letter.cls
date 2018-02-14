% Load the Base Class
\LoadClassWithOptions{article}

% Begin dependencies
\usepackage{sectsty}
% Make sections sansserif
\allsectionsfont{\normalfont\sffamily\bfseries}

\usepackage{tikz}

\usepackage{titlesec}

\usepackage[hidelinks]{hyperref}
\usepackage{titling}

\usepackage{geometry}
% Set the Paper Size and margins
\geometry{margin=1.0in}

\usepackage{forarray}

\setlength{\parskip}{10pt}

\usepackage{tabularx}
\usepackage{graphicx}

\pagenumbering{gobble}

% Prevent hyphenation
\raggedright

% Prevent paragraphs from cutting off
\widowpenalties 1 10000
\raggedbottom

\renewcommand{\to}[2][\theto]{
	\def\theto{#2}
	\def\shortto{#1}
}
\newcommand{\position}[1]{
	\def\theposition{#1}
}
%\newcommand{\authorformat}{
%	\ForEachX{|}{
%		\thislevelitem \hspace{1.5cm}
%	}{\theauthor}
%}
\newcommand{\positionformat}{
	\ForEachX{|}{
		\thislevelitem \\
	}{\theposition}
}
\newcommand{\address}[1]{
	\def\theaddress{#1}
}
\newcommand{\addressformat}{
	\ForEachX{|}{
		\thislevelitem \newline
	}{\theaddress}
}
\newcommand{\authorformat}{
	\begin{tabularx}{\textwidth}{X X X X X}
		\ForEachX{|}{
			
%			\thislevelitem \newline
		}{\theaddress}
	\end{tabularx}
}
\def\changemargin#1{\list{}{\rightmargin#1\leftmargin#1}\item[]}
\let\endchangemargin=\endlist 

\date{\today} % needed for \thedate to work
\renewcommand{\maketitle}{
	\addressformat \par
	\thedate \par
	\vspace{10pt}

	\theto, \\
	\positionformat \par
	\vspace{12pt}

	Dear \shortto: \par
}
\newcommand{\makeend}{
	Sincerely, \par
	\authorformat
}
