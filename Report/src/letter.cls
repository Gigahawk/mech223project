% Load the Base Class
\LoadClassWithOptions{article}

% Begin dependencies
\usepackage{sectsty}
% Make sections sansserif
\allsectionsfont{\normalfont\sffamily\bfseries}

\usepackage{titlesec}

\usepackage[hidelinks]{hyperref}
\usepackage{titling}

\usepackage{geometry}
% Set the Paper Size and margins
\geometry{margin=1.0in}

\usepackage{forarray}

\setlength{\parskip}{10pt}

\pagenumbering{gobble}

% Prevent hyphenation
\raggedright

% Prevent paragraphs from cutting off
\widowpenalties 1 10000
\raggedbottom

\renewcommand{\to}[1]{
	\def\theto{#1}
}
\newcommand{\position}[1]{
	\def\theposition{#1}
}
\newcommand{\authorformat}{
	\ForEachX{|}{
		\thislevelitem \hspace{1.5cm}
	}{\theauthor}
}
\newcommand{\positionformat}{
	\ForEachX{|}{
		\thislevelitem \par
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
\def\changemargin#1{\list{}{\rightmargin#1\leftmargin#1}\item[]}
\let\endchangemargin=\endlist 

\date{\today} % needed for \thedate to work
\renewcommand{\maketitle}{
	\addressformat \par
	\thedate \par
	\vspace{10pt}

	\theto, \par
	\positionformat \par
	\vspace{10pt}

	Dear \theto: \par
}
\newcommand{\makeend}{
	Sincerely, \par
	\authorformat
}
