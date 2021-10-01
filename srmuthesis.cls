%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This is a class for LaTeX2e that should format a report as per
% the SRM University Thesis guidelines.  The page layout is set using the
% geometry package.  The double/singlespacing is setup using
% setspace.  Figure captions are set using the hang option of
% caption2.  natbib is used to do the citation using an
% author-year format. I've made an iitm.bst file that formats 
% the references as per the SRM guidelines.
%
% To use this class do the following:
%  \documentclass[options]{srmuthesis} 
%
% Options:
%
%   PhD, MS, MTech or BTech -- generates the appropriate title page
%   and loads the report class.
%
%   synopsis -- Generates the title page for the synopsis.  This also
%   loads the article class instead of the report.
%  
% Example:
%
% \documentclass[PhD,synopsis]{srmuthesis}
% \documentclass[MS]{srmuthesis}
%
% IMPORTANT NOTICE:
% 
%   PLEASE DO NOT MESS WITH THE MARGINS AND GENERAL FORMATTING SETUP
%   IN THIS FILE UNLESS YOU ARE ABSOLUTELY SURE THAT THE FORMAT DOES NOT
%   MATCH WITH THE THESIS GUIDELINES.  FOR EXAMPLE, DO NOT CHANGE THE 
%   MARGINS AND SPACING JUST TO MAKE YOUR THESIS LARGER!
% 
% Notes:
%
%   * I am using as much of the Thesis guidelines for the spacing
%     and margins as I can.
%   * This class will assume a4paper with 12pt fonts.
%   * I am no TeXpert so feel free to clean up the mess.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{srmuthesis}[2014/12/01 Class for SRM Dissertations]

\newif\if@PhD
\newif\if@MS
\newif\if@MTech
\newif\if@BTech
\newif\if@Synopsis

\DeclareOption{PhD}{\@PhDtrue}
\DeclareOption{MS}{\@MStrue}
\DeclareOption{MTech}{\@MTechtrue}
\DeclareOption{BTech}{\@BTechtrue}
\DeclareOption{synopsis}{\@Synopsistrue}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Load the correct class.
\if@Synopsis
    \LoadClass[12pt,a4paper]{article}
\else
    \LoadClass[12pt,a4paper]{report}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Geometry and page layout
\RequirePackage[%compat2,
a4paper,left=1.5in,right=1in,top=1in,bottom=1in,
                nohead]{geometry}[2002/07/08]
\parskip 8pt

\renewcommand{\@pnumwidth}{2.5em}
%\renewcommand{\@tocrmarg}{2.5em}
\newcommand{\bigsize}{\fontsize{16pt}{20pt}\selectfont}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Using setspace to do the single/double spacing.  Setspace also
%% makes all tables and figures have single spacing automatically.
\RequirePackage{setspace} 
\RequirePackage{atbeginend} % used to redefine the list environs
\setstretch{1.5}

\BeforeBegin{itemize}{\vspace*{-5ex}\begin{singlespace}}
\AfterEnd{itemize}{\end{singlespace}}

\BeforeBegin{enumerate}{\vspace*{-5ex}\begin{singlespace}}
\AfterEnd{enumerate}{\end{singlespace}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% The figure captioning is done correctly via the hang option.
%%\RequirePackage[hang]{caption2}  -> TeX generates error
\RequirePackage[hang]{caption}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography
% 
% natbib allows easy switching of citation style and using it along
% with the iitm.bst makes things perfect.
\RequirePackage[authoryear,round]{natbib} 
%\RequirePackage[numbers,square]{natbib} 
\bibliographystyle{ascelike}

\newcommand{\bibstyle@ascelike}{\bibpunct{(}{)}{;}{a}{,}{,}%
     \gdef\NAT@biblabel##1{##1. }}
%
\setlength{\bibhang}{0pt}
\citestyle{ascelike}
%\citestyle{unsrt_newen}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Other useful macros.  Many of these are modifications from newdiss.cls

% \department{department name} -- user macro to declare name of department.
\def\guide#1{\gdef\@guide{#1}}
\def\hod#1{\gdef\@hod{#1}}
\def\designation#1{\gdef\@designation{#1}}
\def\department#1{\gdef\@department{#1}}
\def\guidedepartment#1{\gdef\@guidedepartment{#1}}
\def\firstauthor#1{\gdef\@firstauthor{#1}}
\def\firstauthorregno#1{\gdef\@firstauthorregno{#1}}
\def\secondauthor#1{\gdef\@secondauthor{#1}}
\def\secondauthorregno#1{\gdef\@secondauthorregno{#1}}
\def\thirdauthor#1{\gdef\@thirdauthor{#1}}
\def\thirdauthorregno#1{\gdef\@thirdauthorregno{#1}}
\def\fourthauthor#1{\gdef\@fourthauthor{#1}}
\def\fourthauthorregno#1{\gdef\@fourthauthorregno{#1}}
\def\fifthauthor#1{\gdef\@fifthauthor{#1}}
\def\fifthauthorregno#1{\gdef\@fifthauthorregno{#1}}
%\RequirePackage[dvips]{graphicx}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The title page

\def\maketitle{%
  \pagenumbering{roman}
  \thispagestyle{empty}
  \newpage
  \null
  \setcounter{page}{0}
  \parskip=0pt
  \begin{center}%
  \let \footnote \thanks
  \vglue 0in % this makes top margin 2in
  \vskip -5ex%
  \if@Synopsis
    {\large \em SYNOPSIS OF \par}
  \fi
    {\Large \bf \expandafter\MakeUppercase{\@title} \par}%
    \vskip 10ex%
    {\normalsize
      \if@PhD
         {\em A THESIS }\par
         \vskip 5ex%
         \if@Synopsis
            {\normalsize \em to be submitted by \par}
         \else
            {\normalsize \em submitted by \par}
         \fi
         \vskip 5ex%
         {\bf \large\MakeUppercase{\@firstauthor} {\@firstauthorregno}\par\par}
         \vskip 5ex%
         {\em for the award of the degree }\par
         \vskip 5ex%
         {\em of} \par
         \vskip 5ex%
         {\bf \large \MakeUppercase{Doctor of Philosophy}} \par
       \else
         \if@MS
            {\em A THESIS }\par
            \vskip 5ex%
            {\normalsize \em submitted by \par}
            \vskip 5ex%
            {\bf \MakeUppercase{\@firstauthor} {\@firstauthorregno} \par\par}
            \vskip 5ex%
            {\em for the award of the degree }\par
            \vskip 5ex%
            {\em of} \par
            \vskip 5ex%
            {\bf \large \MakeUppercase{Master Of Science}} \par
            (by Research) \par
         \else
{\large \bf \expandafter  A PROJECT REPORT }\par
           \vskip 5ex%
           {\large \bf \em Submitted by \par}
           \if@BTech
           \begin{singlespacing}
           {\bf \bigsize\MakeUppercase{\@firstauthor} {\@firstauthorregno}\par}
            {\bf \bigsize\MakeUppercase{\@secondauthor} {\@secondauthorregno}\par}
            {\bf \bigsize\MakeUppercase{\@thirdauthor} {\@thirdauthorregno}\par}
            {\bf \bigsize\MakeUppercase{\@fourthauthor} {\@fourthauthorregno}\par}
            {\bf \bigsize\MakeUppercase{\@fifthauthor} {\@fifthauthorregno}\par}
            \end{singlespacing}
            \else
            {\bf \bigsize\MakeUppercase{\@firstauthor} {\@firstauthorregno}\par\par}
            \fi
                       \vskip 5ex%
        \begin{singlespacing}
        {\normalsize \em Under the guidance of \par}        
              {\bf \bigsize{\@guide}\par\par}
               {\normalsize{(\@designation, Department of \@guidedepartment)}\par\par}
        \end{singlespacing}
           {\bf \large \em in partial fulfillment for the award of the degree \par
           of \par} \vskip 5ex%
                      \if@MTech
             {\bf \large MASTER OF TECHNOLOGY}
           \fi
           \if@BTech
              {\bf \large BACHELOR OF TECHNOLOGY}
           \fi
         \fi
      \fi
     {\par in \par}
     {\bf \bigsize\MakeUppercase{\@department}\par\par}
     {\par of \par}
     {\bf \large FACULTY OF ENGINEERING AND TECHNOLOGY \par\par}}
  \end{center}%

  \vspace*{0.25in}
  %\centerline{\psfig{figure=emblem.ps}}
%  \centerline{\includegraphics{iitm.eps}}
  \centerline{\includegraphics[scale=0.15]{SRM}}
  \vspace*{-0.15in}
  \begin{center}
    {\large S.R.M. Nagar, Kattankulathur, Kancheepuram District \par}
        \vglue 0.50em
    {\bf \large \@date}\par
  \end{center}
  \parskip 8pt
}

\def\titlepage{\newpage\thispagestyle{empty}\c@page\z@}
\def\endtitlepage{\newpage}

\if@Synopsis
   \renewcommand\refname{REFERENCES}
\else
   % QUOTATIONS
   %
   \def\quotations{\chapter*{\centerline{QUOTATIONS}}
   %\addcontentsline{toc}{chapter}{QUOTATIONS}
   }

   % DEDICATION
   %
   \def\dedication{\chapter*{\centerline{DEDICATION}}
   %\addcontentsline{toc}{chapter}{DEDICATION}
   }

   % CERTIFICATE
   %
   %   - this produces a certificate page as per IITM Regulations
   %     comment the following lines out to get it working.
   %
   \def\certificate{%% A preliminary chapter
     \clearpage
     \centerline{\LARGE \bf SRM UNIVERSITY}
     \centerline{(Under Section 3 of UGC Act, 1956)}
      \vskip 25pt
     \centerline{\bigsize \bf BONAFIDE CERTIFICATE}
     \vskip 15pt
     \thispagestyle{empty}
     %\typeout{Certificate}
       \if@BTech
     \begin{doublespacing}
     {\large Certified that this project report titled ``{\bf\MakeUppercase{\@title}}'' is the bonafide work of ``{\bf\MakeUppercase{\@firstauthor} {\@firstauthorregno}, \bf\MakeUppercase{\@secondauthor} {\@secondauthorregno}, \bf\MakeUppercase{\@thirdauthor} {\@thirdauthorregno}, \bf\MakeUppercase{\@fourthauthor} {\@fourthauthorregno}, \bf\MakeUppercase{\@fifthauthor} {\@fifthauthorregno}}'', who carried out the project work under my supervision. Certified further, that to the best of my knowledge the work reported herein does not form any other project report or dissertation on the basis of which a degree or award was conferred on an earlier occasion on this or any other candidate.}
     \end{doublespacing}
     \else
     \begin{doublespacing}
          {\large Certified that this project report titled ``{\bf\MakeUppercase{\@title}}'' is the bonafide work of ``{\bf\MakeUppercase{\@firstauthor} {\@firstauthorregno}}'', who carried out the project work under my supervision. Certified further, that to the best of my knowledge the work reported herein does not form any other project report or dissertation on the basis of which a degree or award was conferred on an earlier occasion on this or any other candidate.}
          \end{doublespacing}
          \fi
     \vspace*{1in}
     
     \begin{singlespacing}
     \hspace*{-0.25in}
     \parbox{2.5in}{
     {\bf SIGNATURE}\\
     \vskip 5ex%
     \noindent {\@guide} \\
     \noindent {\bf GUIDE} \\
     \noindent \@designation \\ 
     \noindent Dept. of {\@guidedepartment}\\
    \vskip 8ex%
     \noindent Signature of the Internal Examiner\\
     } 
     \hspace*{1 in} 
     \parbox{2.5in}{
     {\bf SIGNATURE}\\
     \vskip 5ex%
     \noindent {\@hod} \\
     \noindent {\bf HEAD OF THE DEPARTMENT} \\
     \noindent Dept. of {\@department}\\
         \vskip 10ex%
     \noindent Signature of the External Examiner\\
     }  
     \end{singlespacing}
     \setcounter{page}{2}
   }
   % ACKNOWLEDGEMENTS
   %
   \def\acknowledgements{\chapter*{\centerline{ACKNOWLEDGEMENTS}}
     \addcontentsline{toc}{chapter}{ACKNOWLEDGEMENTS}
   }

   % ABSTRACT
   %   - this produces pages suitable for an IITM Abstract
   \def\abstract{\chapter*{\centerline{ABSTRACT}}
   \addcontentsline{toc}{chapter}{ABSTRACT}
    \thispagestyle{empty} }

   % GLOSSARY
   %
   \def\glossary{\chapter*{\centerline{GLOSSARY}}
   \addcontentsline{toc}{chapter}{GLOSSARY}
   }

   % ABBREVIATIONS
   %
   \def\abbreviations{\chapter*{\centerline{ABBREVIATIONS}}
   \addcontentsline{toc}{chapter}{ABBREVIATIONS}
   }

   % Use the nomencl package for the NOTATION section.

   % Makes the chapter heading
   \def\@makechapterhead#1{%
     {\parindent \z@ \raggedright \normalfont
       \ifnum \c@secnumdepth >\m@ne
       \begin{center}
         \Large\bfseries  \@chapapp\space \thechapter
       \end{center}
       \par\nobreak
       \vskip 20\p@
       \fi
       \interlinepenalty\@M
       \bigsize\bf
       \begin{center}
         \MakeUppercase{#1}\par\nobreak      
       \end{center}
       \vskip 20\p@
       \thispagestyle{empty}
     }}

   % Makes the chapter heading for \chapter* commands
   \def\@makeschapterhead#1{%
     \vspace*{25\p@}%
     {\parindent \z@ \raggedright
       \normalfont
       \interlinepenalty\@M
       \Large \bfseries #1\par\nobreak
       \vskip 20\p@
     }}

   %LIST OF PAPERS
   \if@PhD
   \def\listofpapers{
           \normalbaselines
           \chapter*{\centerline{LIST OF PAPERS BASED ON THESIS}}
           \markboth{LIST OF PAPERS BASED ON THESIS}{LIST OF PAPERS BASED ON THESIS}
           %\addcontentsline{toc}{chapter}{LIST OF PAPERS BASED ON THESIS}
   }
      \fi
   % CV
   \def\CV{\chapter*{\centerline{CURRICULUM VITAE}}}

   % Comittee
   \if@PhD
       \def\committee{\chapter*{\centerline{DOCTORAL COMMITTEE}}}
   \else
       \if@MS
          \def\committee{\chapter*{\centerline{GENERAL TEST COMITTEE}}}}
        \fi
   \fi


   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   % Renewed commands to set the titles of various pages correctly.
   \renewcommand\contentsname{\centering TABLE OF CONTENTS}
   \renewcommand\listfigurename{\centering LIST OF FIGURES}
   \renewcommand\listtablename{\centering LIST OF TABLES}
   \renewcommand{\chaptername}{CHAPTER}
   \renewcommand\bibname{\centering REFERENCES}
   \renewcommand\appendixname{APPENDIX}
\fi


