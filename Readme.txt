1. Basic Steps:
# The SRM_Thesis_Format package contains a Latex template and Latex class file. Latex is a type setting software which which will format your thesis/report as per SRM University requirement.

This requires Latex2e package in your computer to be installed. Latex2e packageis a freeware and the .exe file can be downloaded from http://ctan.imsc.res.in/systems/windows/protext/. 

# Save the .exe file when prompted in any convenient location and Unzip the downloaded file.
# Run setup and install MiKTeX first and then install TeXstudio.

The Latex2e installation is now completed.

2. Now open format_thesis.tex available in SRM_Thesis_format folder.

Enable document class which is related to you. For example if you are a B.Tech student you have to enable \documentclass[BTech]{srmuthesis}.
The % symbol comments the syntax.

The enabling of BTech document class will provide you with a template that conforms to SRM B.Tech project specification.

3. TITLE PAGE Formating:

(a) You need to enter your  title of thesis in the appropriate space as illustrated below : 
 
\title{Enter The Project Title}     (Its not Case-sensitive)

(b) Name of the project students: (In the ascending order of Register Number)
\firstauthor{ Enter your name here}
\secondauthor{ Enter your name here}
\thirdauthor{ Enter your name here}
\fourthauthor{ Enter your name here}

For M.Tech students, Enter your name in the line  \firstauthor{ Enter your name here} and ignore second, third and fourth author options.

(c) Other fields:
Other fields like guide's name, Guide's designation, HOD name, department, Branch of study/specialisation, Month & Year of submission must be entered in the respective fields. All these data will be automatically formated and written in the respective places with appropriate font size. 


4. BONAFIDE PAGE:
The student need not do anything as all information required for Bonafide page will be automatically generated based on the input given in the previous section.


5. ABSTRACT:
The student has to either type or copy & paste the contents of the abstract just below the section \abstract.


6. ACKNOWLEDGEMENT:
The student has to either type or copy & paste the contents of the abstract just below the section \acknowledgement.


7. TABLE OF CONTENTS, LIST OF TABLES, LIST OF FIGURES:

The student need not do anything as all information required for the above tables will be automatically generated as the student adds the chapter-wise content.


8. LIST OF ABBREVIATIONS:
The student has to input all abbreviations under the section \abbreviations as per the below format:

\acro {acronym} {expanded form}

e.g., \acro {GA} {Genetic Algorithm}
      \acro {WHO} { World Health Organisation}



9. LIST OF AND SYMBOLS AND NOMENCLATURE:
The student has to input all symbols and nomenclature in alphabetical order under the section \chapter* {list of symbols} as per the below format:

\textbf {$\symbol$}   \>what the symbol represents, name of the unit

e.g.,\textbf {$\theta$}   \>Angle of twist, rad
     \textbf {$\Sigma$}   \>Stress, N/sq.m


10. CHAPTERS:
The student has to type (if already has it in word format the student may copy & paste) the contents of the chapter just below the section \chapter.
(a) To start a new section, use the syntax \section {section title}
     < Type your contents coming under this section>
(b) To start a sub-section and a sub-sub-section, you can use the syntax
  \subsection {subsection title}
  \ subsubsection {subsubsection title}


11. TO INSERT A FIGURE, TABLE, FLOWHCART OR GRAPH, PLEASE REFER BACK TO THE .TEX FILE.


12. BIBLIOGRAPHY (OR) REFERENCE

The student has to download any of the reference management system softwares such as JabRef. It is a freeware which can be downloaded and installed.
Then create a database of all the references like journal articles,
confernce proceedings, Technical reports, Book, Book chapter, Web page etc in JabRef management system and have this file in the folder where your .tex file is placed.

At the end of the .tex template, there is a field \bibliography{Enter your reference management file (.bib)}. For cross reference the same in your text, call them by 
their key word, in this way \cite{key word}. 

Then the references which you cross referenced alone are formatted in your report as per SRM University specified.


