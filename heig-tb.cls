\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{heig-tb}[2020/06/23 HEIG-VD Bachelor Thesis]

\LoadClass[11pt,a4paper,twoside,final]{book}

\def\builddir{build}
\def\graphicsExt{pdf}
\def\assetsdir{\builddir/assets/figures}
\def\assetsdirnotbuilded{./assets/figures}

\RequirePackage{fontspec}
\RequirePackage[main=french,english]{babel}
\babelprovide[import=fr]{french}
\babelprovide[import=en]{english}
\babelprovide[import=la]{latin}

%% Confidentiel
\DeclareOption{confidential}{
  \def\@confidential{Confidentiel}
}

%% Liste des instituts de recherche appliquée et développement de la HEIG-VD
%% https://heig-vd.ch/recherche/instituts/

\DeclareOption{iide}{
  \def\instituteacronym{IIDE}
  \def\institutename{Institut Interdisciplinaire du Développement de l'Entreprise}
}

\DeclareOption{reds}{
  \def\instituteacronym{REDS}
  \def\institutename{Reconfigurable \& Embedded Digital Systems}
}

\DeclareOption{iai}{
  \def\instituteacronym{IAI}
  \def\institutename{Institut d'Automatisation Industrielle}
}

\DeclareOption{mei}{
  \def\instituteacronym{MEI}
  \def\institutename{Media Engineering Institute}
}

\DeclareOption{iict}{
  \def\instituteacronym{IICT}
  \def\institutename{Institut des Technologies de l'information et de la Communication}
}

\DeclareOption{insit}{
  \def\instituteacronym{INSIT}
  \def\institutename{Institut d'ingénierie du territoire}
}

\DeclareOption{ie}{
  \def\instituteacronym{IE}
  \def\institutename{Institut des Énergies}
}

\DeclareOption{comatec}{
  \def\instituteacronym{COMATEC}
  \def\institutename{Institut de conception mécanique et technologie des matériaux}
}

%% Orientations
\DeclareOption{eai}{
  \def\@orientation{Électronique et Automatisation industrielle}
  \def\@department{TIN}
  \def\@faculty{Génie Électrique}
  \def\@field{Ingénierie}
}

\DeclareOption{eem}{
  \def\@orientation{Électronique embarquée et Mécatronique}
  \def\@department{TIN}
  \def\@faculty{Génie Électrique}
  \def\@field{Ingénierie}
}

\DeclareOption{en}{
  \def\@orientation{Systèmes énergétiques}
  \def\@department{TIN}
  \def\@faculty{Génie Électrique}
  \def\@field{Ingénierie}
}

\DeclareOption{eba}{
  \def\@orientation{Energétique du bâtiment}
  \def\@department{TIN}
  \def\@faculty{Energie et techniques environnementales}
  \def\@field{Ingénierie}
}

\DeclareOption{thi}{
  \def\@orientation{Thermique industrielle}
  \def\@department{TIN}
  \def\@faculty{Energie et techniques environnementales}
  \def\@field{Ingénierie}
}

\DeclareOption{tho}{
  \def\@orientation{Thermotronique}
  \def\@department{TIN}
  \def\@faculty{Energie et techniques environnementales}
  \def\@field{Ingénierie}
}

\DeclareOption{mi}{
  \def\@orientation{Mécatronique}
  \def\@department{TIN}
  \def\@faculty{Microtechniques}
  \def\@field{Ingénierie}
}

\DeclareOption{gen}{
  \def\@orientation{Génie de l'environnement}
  \def\@department{EC+G}
  \def\@faculty{Géomatique}
  \def\@field{Ingénierie}
}

\DeclareOption{ggt}{
  \def\@orientation{Géomatique et gestion du territoire}
  \def\@department{EC+G}
  \def\@faculty{Géomatique}
  \def\@field{Ingénierie}
}

\DeclareOption{gci}{
  \def\@orientation{Construction et infrastructures}
  \def\@department{EC+G}
  \def\@faculty{Géomatique}
  \def\@field{Ingénierie}
}

\DeclareOption{ie}{
  \def\@orientation{Systèmes informatiques embarqués}
  \def\@department{TIC}
  \def\@faculty{Informatique et systèmes de communication}
  \def\@field{Ingénierie}
}

\DeclareOption{il}{
  \def\@orientation{Informatique logicielle}
  \def\@department{TIC}
  \def\@faculty{Informatique et systèmes de communication}
  \def\@field{Ingénierie}
}

\DeclareOption{tr}{
  \def\@orientation{Réseaux et systèmes}
  \def\@department{TIC}
  \def\@faculty{Informatique et systèmes de communication}
  \def\@field{Ingénierie}
}

\DeclareOption{id}{
  \def\@orientation{Ingénierie des données}
  \def\@department{TIC}
  \def\@faculty{Informatique et systèmes de communication}
  \def\@field{Ingénierie}
}

\DeclareOption{ts}{
  \def\@orientation{Sécurité informatique}
  \def\@department{TIC}
  \def\@faculty{Informatique et systèmes de communication}
  \def\@field{Ingénierie}
}

\DeclareOption{ee}{
  \def\@orientation{}
  \def\@department{HEG}
  \def\@faculty{Économie d'entreprise}
  \def\@field{Économie d'entreprise}
}

\DeclareOption{igi}{
  \def\@orientation{Qualité et performance industrrielles}
  \def\@department{TIN}
  \def\@faculty{Ingénierie et gestion industrielles}
  \def\@field{Ingénierie}
}

\ProcessOptions

% Améliore le mode mathématique, aligne les équations à gauche
\RequirePackage[fleqn]{amsmath}
\RequirePackage{nccmath}

% Symboles mathématiques étendus
\RequirePackage{amssymb}

% Meilleure gestion de l'unicode et des mathématiques
\RequirePackage{unicode-math}

% Insertion de figures \includegraphics
% LuaLaTeX support les formats PDF, PNG, JPEG et EPS
\RequirePackage{graphicx}

% Configuration des légendes (figures/tables):
% mot clé en gras et texte en italique
\RequirePackage[small,bf,textfont=it]{caption}
\RequirePackage{subcaption}

% Autorise des figures et tables plus flexibles avec
% l'environnement [H] de la classe float
\RequirePackage{float}

% Meilleure gestion des annexes
\RequirePackage{appendix}

\RequirePackage{xcolor}

% Configuration des en-têtes et pieds de page
\RequirePackage{fancyhdr}

% Meilleure gestion des tableaux
% Ajoute les commandes \toprule, \midrule et \bottomrule
\RequirePackage{booktabs}

% Permet d'écrire un nombre en lettre (ex: 1 -> un)
\RequirePackage{fmtcount}

% Outils bas niveau pour LaTeX tel que
% \ifstrequal ou \ifdefstring
\RequirePackage{etoolbox}

% Encadre des blocs de textes avec des bordures
% Utilisé pour le code source
\RequirePackage{framed}

% Gestion des glossaires et acronymes
\RequirePackage{glossaries}

% Utile pour obtenir le numéro de la dernière page du document
% \fancyfoot[C]{Page \thepage{} sur \pageref{LastPage}}
% (non utilisé ici)
%\RequirePackage{lastpage}

% Alternative à minted pour afficher du code source
% Plus traditionnel et plus rapide à compiler
% Ne nécessite pas --shell-escape
\RequirePackage{listings}

% Meilleure gestion des espacements entre les mots et
% les lettres (microtypographie), meilleure gestion des
% césures. Très utile quand la font n'est pas CM.
\RequirePackage{microtype}

% Pour gérer l'index. Nécessite une compilation avec makeindex
% Automatiquement géré par latexmkrc
\RequirePackage{makeidx}

% Permet des encadrés personnalisés, par exemple pour du code
\RequirePackage{mdframed}

% Autorise plus de environ 18 flottents en attente de placement,
% évite l'erreur ! LaTeX Error: Too many unprocessed floats.
\RequirePackage{morefloats}

% Permet de gérer plusieurs colonnes avec l'environnement multicols
\RequirePackage{multicol}

% Permet de faire des tests conditionnels
\RequirePackage{ifthen}

% Gestion de la nomenclature
\RequirePackage{nomencl}

% Évite le retrait de la première ligne d'un paragraphe
% et ajoute un espace vertical entre les paragraphes
\RequirePackage{parskip}

% Rotation of floats (figures, tables)
\RequirePackage{rotating}

% Tableaux justifiés sur la largeur de la page
\RequirePackage{tabularx}

% Mode dessin vectoriel
\RequirePackage{tikz}

\RequirePackage{makecell}

\RequirePackage{bold-extra}

\RequirePackage[many]{tcolorbox}

\RequirePackage{cellspace}

% Gestion des macros key=value
\RequirePackage{expkv-cs}

% Gestion des émoticônes et symboles
\RequirePackage{fontawesome5}

% Meilleur control des itemize enumerate et description
\RequirePackage{enumitem}

% Gestion des unités SI
\RequirePackage{siunitx}

% Coloration syntaxique du code source avec Python
% Nécessite la compilation avec --shell-escape
\RequirePackage[outputdir=build,chapter]{minted}

% Gestion des citations \enquote{Ceci est une citation}
\RequirePackage{csquotes}

% Permet d'executer du Lua
\RequirePackage{luacode}

\RequirePackage[
  backref=true,
  backend=biber,
  style=numeric,
  sorting=none
]{biblatex}

\RequirePackage[
  a4paper,
  top=2.5cm,
  bottom=2.5cm,
  left=3cm,
  right=4cm,
  headheight=6mm,
  headsep=5mm,
  marginparwidth=3cm,
  marginparsep=4mm,
  heightrounded,
  includehead]{geometry}

\definecolor{linkcolor}{RGB}{0, 102, 204}
\RequirePackage[
  colorlinks=true,
  plainpages=false,
  linkcolor=black,
  citecolor=black,
  unicode=true,
  urlcolor=linkcolor,
  pdfpagelabels=false, % Évite les warnings liés à \c@page
  bookmarksdepth=section % Profondeur des signets dans le PDF
]{hyperref}

%% Configuration de la police de caractères
\setmathfont{Latin Modern Math}
\setmonofont{Source Code Pro}

\usetikzlibrary{
  babel,
  shadows,
  patterns,
  arrows,
  calc,
  decorations.pathmorphing
}

\usemintedstyle{colorful}
\setminted{
  %frame=single,
  style=friendly,
  fontsize=\footnotesize
}

\newcommand{\clearemptydoublepage}{%
  \newpage{\thispagestyle{empty}\cleardoublepage}}

\def\cleardoublepage{\clearpage\ifodd\c@page\else
    \null\thispagestyle{empty}\newpage\fi}

\setlength{\parindent}{0pt}
\setlength{\fboxsep}{10pt}
\setlength\parskip{\medskipamount}

%% Configuration de listings (minted est néanmoins préféré)
\lstset{%
  language=C, % Vous pouvez choisir le langage de votre choix
  breaklines=true,
  breakatwhitespace=false,
  caption={},
  basicstyle=\footnotesize\sffamily}

%% Gestion des accords du genre

% Définition des genres
\newcommand{\setmale}{\def\genre{male}}
\newcommand{\setfemale}{\def\genre{female}}

% Commande pour gérer les accords en fonction du genre
\newcommand{\accord}[2]{\ifthenelse{\equal{\genre}{female}}{#2}{#1}}

%% Settings
\def\subtitle#1{\def\@subtitle{#1}}
\def\teacher#1{\def\@teacher{#1}}
\def\field#1{\def\@field{#1}}

\def\signature#1{\def\@signature{#1}}

\def\printsignature{\includegraphics[width=4cm]{
    \assetsdir/\@signature.\graphicsExt}
}

\newcommand{\thedate}{\@date}
\newcommand{\thefield}{\@field}
\newcommand{\theauthor}{\@author}
\newcommand{\thesignature}{\@signature}

\def\thesis#1{\def\@thesis{#1}}
\def\endyear#1{\def\@endyear{#1}}

%% Première page de couverture
\renewcommand\maketitle{%
  \pagenumbering{empty}
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=north west,yshift=-1.5cm,xshift=1.5cm]%
    at (current page.north west)
    {\includegraphics[height=2cm]{assets/logos/heig-vd-baseline.pdf}};
    \node[anchor=south east,yshift=1.5cm,xshift=-1.5cm]%
    at (current page.south east)
    {\includegraphics[height=1cm]{assets/logos/hes-so.pdf}};
  \end{tikzpicture}
  \vspace{4cm}
  \begin{center}%
    \reset@font
    \sffamily
    {\usefont{T1}{lmss}{bx}{n}\huge\selectfont\@title\\\vspace{0.5em}
      \large{\@subtitle}\par}%
    \ifdefined\@confidential
      \vskip 5em%
      \textbf{\MakeUppercase{\@confidential}}
      \vskip 5em%
    \else
      \vskip 10em%
    \fi
    Département \@department\par
    Filière \@faculty\par
    Orientation \@orientation
    {\large
      \vskip 5em%
      \begin{tabular}[t]{c}%
        \@author%
      \end{tabular}\par}%
    \vskip 1em%
      {\large \@date}%
    \vskip 4cm%
    Supervisé par :\\
    \@teacher\\
  \end{center}%
  \par%
  \vskip 1.5em%
}

% Abstract
\newcommand{\abstractname}{Version Abrégée}
\newenvironment{abstract}{
  \chapter*{\abstractname}
  \addcontentsline{toc}{chapter}{\abstractname}
}

% Annexes
\renewcommand\appendixpagename{Annexes}

\renewcommand\listoflistingscaption{Liste des codes sources}
\renewcommand{\nomname}{Liste des symboles}

\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \ifdefined\@confidential
    \fancyfoot[LE]{\MakeUppercase{\@confidential}}
    \fancyfoot[RO]{\MakeUppercase{\@confidential}}
  \fi
}

\fancypagestyle{headings}{
  \fancyhf{}
  \fancyhead[LO]{\textsl{\rightmark}}
  \fancyhead[RE]{\textsl{\leftmark}}
  \ifdefined\@confidential
    \fancyfoot[LE]{\MakeUppercase{\@confidential}}
    \fancyfoot[RO]{\MakeUppercase{\@confidential}}
  \fi
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}}

\pagestyle{headings}


\renewcommand\section{\@startsection {section}{1}{\z@}%
  {-2.5ex \@plus -1ex \@minus -.2ex}%
  {2.0ex \@plus.2ex}%
  {\normalfont\Large\bfseries\itshape}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-2.5ex\@plus -1ex \@minus -.2ex}%
  {1.0ex \@plus .2ex}%
  {\normalfont\large\bfseries\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-2.25ex\@plus -1ex \@minus -.2ex}%
  {1.0ex \@plus .2ex}%
  {\normalfont\normalsize\bfseries\itshape}}

%% Marginal Note
\newcommand\maraja[1]{%
  \mbox{}%
  \marginpar{\raggedright \tiny#1}%
  \ignorespaces
}

%% Figure macros
\newcommand\fig[2][]{\fig@kv{short={#2},#1}{#2}}
\ekvcSplitAndForward\fig@kv\fig@out
{
  % defaults here
  short = {}% will get set for each call to match the caption argument
  ,internal-label = {} % empty, not for direct use (easier that way)
  ,place = tbp
  ,...
}
\ekvcSecondaryKeys\fig@kv
{
  nmeta H = place=H % shortcut
  ,meta label = internal-label=\label{#1} % wraps \label around the value
  % add more keys you want to be handled special here
}
\newcommand\fig@out[6]
{%
  \begin{figure}[#3]
    \centering
    \includegraphics[#4]{\assetsdir/#6}%
    \caption[{#1}]{#5#2}%
    \label{#6}
  \end{figure}%
}

%% Asterism
\newcommand{\asterism}{\vspace{1em}
  \hfill\smash{%
    \raisebox{-.5ex}{%
      \setlength{\tabcolsep}{-.5pt}%
      \begin{tabular}{@{}cc@{}}%
        \multicolumn2c* \\[-2ex]*&*%
      \end{tabular}}}\hfill\vspace{1em}}

%% Locutions
\def\pex{p.~ex.~}
\def\cad{c.-à-d.~}
\def\cf{cf.~}

%% Keystroke command
\newcommand*\keystroke[1]{%
  \tikz[baseline=(key.base)]
  \node[%
    draw,
    fill=white,
    drop shadow={shadow xshift=0.2ex,shadow yshift=-0.2ex,fill=black,opacity=0.55},
    rectangle,
    rounded corners=2pt,
    inner sep=2pt,
    line width=0.5pt,
    font=\scriptsize\sffamily
  ](key) {#1\strut}
  ;
}

%% Admonitions / Callout

\definecolor{calloutNoteBg}{HTML}{ECF3FF}
\definecolor{calloutNoteFrame}{HTML}{448AFF}

\definecolor{calloutAbstractBg}{HTML}{E5F7FF}
\definecolor{calloutAbstractFrame}{HTML}{00B0FF}

\definecolor{calloutInfoBg}{HTML}{E5F8FB}
\definecolor{calloutInfoFrame}{HTML}{00B8D4}

\definecolor{calloutTipBg}{HTML}{E5F8F6}
\definecolor{calloutTipFrame}{HTML}{00BFA5}

\definecolor{calloutSuccessBg}{HTML}{E5F9ED}
\definecolor{calloutSuccessFrame}{HTML}{00C853}

\definecolor{calloutQuestionBg}{HTML}{EFFCE7}
\definecolor{calloutQuestionFrame}{HTML}{64DD17}

\definecolor{calloutWarningBg}{HTML}{FFF4E5}
\definecolor{calloutWarningFrame}{HTML}{FF9E1D}

\definecolor{calloutFailureBg}{HTML}{FFEDED}
\definecolor{calloutFailureFrame}{HTML}{FF5252}

\definecolor{calloutDangerBg}{HTML}{FFE7EC}
\definecolor{calloutDangerFrame}{HTML}{FF1744}

\definecolor{calloutBugBg}{HTML}{FEE5EE}
\definecolor{calloutBugFrame}{HTML}{F50057}

\definecolor{calloutExampleBg}{HTML}{F2EDFF}
\definecolor{calloutExampleFrame}{HTML}{7C4DFF}

\tcbset{
  callout note/.style={
      colbacktitle=calloutNoteBg,
      colframe=calloutNoteFrame,
      coltitle=calloutNoteFrame!80!black,
      borderline west={0.3mm}{0mm}{calloutNoteFrame},
      title={\makebox[1.3em][c]{\faBookmark}~\textbf{Note}},
    },
  callout info/.style={
      colbacktitle=calloutInfoBg,
      colframe=calloutInfoFrame,
      coltitle=calloutInfoFrame!80!black,
      borderline west={0.3mm}{0mm}{calloutInfoFrame},
      title={\makebox[1.3em][c]{\faComment}~\textbf{Information}},
    },
  callout tip/.style={
      colbacktitle=calloutTipBg,
      colframe=calloutTipFrame,
      coltitle=calloutTipFrame!80!black,
      borderline west={0.3mm}{0mm}{calloutTipFrame},
      title={\makebox[1.3em][c]{\faLightbulb}~\textbf{Astuce}},
    },
  callout success/.style={
      colbacktitle=calloutSuccessBg,
      colframe=calloutSuccessFrame,
      coltitle=calloutSuccessFrame!80!black,
      borderline west={0.3mm}{0mm}{calloutSuccessFrame},
      title={\makebox[1.3em][c]{\faCheck}~\textbf{Succès}},
    },
  callout warning/.style={
      colbacktitle=calloutWarningBg,
      colframe=calloutWarningFrame,
      coltitle=calloutWarningFrame!80!black,
      borderline west={0.3mm}{0mm}{calloutWarningFrame},
      title={\makebox[1.3em][c]{\faBolt}~\textbf{Avertissement}},
    },
  callout important/.style={
      colbacktitle=calloutDangerBg,
      colframe=calloutDangerFrame,
      coltitle=calloutDangerFrame!80!black,
      borderline west={0.3mm}{0mm}{calloutDangerFrame},
      title={\makebox[1.3em][c]{\faExclamationTriangle}~\textbf{Danger}},
    },
  callout hint/.style={
      colbacktitle=calloutTipBg,
      colframe=calloutTipFrame,
      coltitle=calloutTipFrame!80!black,
      borderline west={0.3mm}{0mm}{calloutTipFrame},
      title={\makebox[1.3em][c]{\faLightbulb}~\textbf{Indice}},
    },
  callout bug/.style={
      colbacktitle=calloutBugBg,
      colframe=calloutBugFrame,
      coltitle=calloutBugFrame!80!black,
      borderline west={0.3mm}{0mm}{calloutBugFrame},
      title={\makebox[1.3em][c]{\faBomb}~\textbf{Bogue}},
    },
  callout example/.style={
      colbacktitle=calloutExampleBg,
      colframe=calloutExampleFrame,
      coltitle=calloutExampleFrame!80!black,
      borderline west={0.3mm}{0mm}{calloutExampleFrame},
      title={\makebox[1.3em][c]{\faFlask}~\textbf{Exemple}},
    },
  callout default/.style={
      colbacktitle=gray!40!white,

      title={\textcolor{black}{\makebox[1.3em][l]{\faComment}}},
    }
}

\newtcolorbox{callout}[1][]{%
  breakable,
  enhanced,
  arc=0mm,
  boxrule=0mm,
  titlerule=0mm,
  lefttitle=1mm,
  leftupper=1mm,
  colback=white,
  parbox=false, % Allow paragraph breaks inside the box
  frame hidden,
  borderline west={0.3mm}{0mm}{black!70},
  #1
}

% Inclusion dynamique de fichiers
\begin{luacode}
  -- Fonction pour trier les fichiers par ordre naturel (natural sort)
  local function natural_sort(a, b)
  local function padnum(d) return string.format("%03d", tonumber(d)) end
  local function tokenize(str)
  local tokens = {}
  for c in str:gmatch("(%d+)|(%D+)") do
  if tonumber(c) then
  table.insert(tokens, padnum(c))
  else
  table.insert(tokens, c)
  end
  end
  return table.concat(tokens)
  end
  return tokenize(a) < tokenize(b)
  end

  function include_dir(order, dir)
  local files = {}
  for file in io.popen('ls ' .. dir .. '/*.tex'):lines() do
  table.insert(files, file)
  end

  -- Appliquer le tri si demandé
  if order == "natural" then
  table.sort(files, natural_sort)
  else
  table.sort(files) -- Tri alphabétique standard par défaut
  end

  -- Inclure les fichiers
  for _, file in ipairs(files) do
  tex.sprint("\\input{" .. file .. "}")
  end
  end
\end{luacode}

% Commande personnalisée en LaTeX
\newcommand{\inputdir}[2][]{%
  \directlua{include_dir([[#1]], [[#2]])}%
}