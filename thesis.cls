\ProvidesClass{thesis}

\LoadClassWithOptions{article}

%基础宏包

\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{color}
\RequirePackage{setspace}
\RequirePackage{etoolbox}
\RequirePackage{fontspec}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{titletoc}
\RequirePackage[perpage]{footmisc}
\RequirePackage{url}
\RequirePackage{notoccite}
\RequirePackage{multirow}
\RequirePackage{zhnumber} %中文数字

% Windows 的中易字体。
\RequirePackage[UTF8,heading = true]{ctex}
\setCJKmainfont{SimSun}[
  AutoFakeBold = 3,
  ItalicFont   = KaiTi,
]%
\setCJKsansfont{SimHei}[AutoFakeBold = 3]%
\setmainfont{Times New Roman}[AutoFakeBold = 3]%
\setCJKfamilyfont{hwzs}{STZhongsong}[AutoFakeBold=2.0]%华文中宋
\newcommand{\hwzs}{\CJKfamily{hwzs}}
\setCJKfamilyfont{fs}{FangSong}[AutoFakeBold=2.0]%仿宋
\newcommand{\fs}{\CJKfamily{fs}}
\setCJKfamilyfont{heiti}{SimHei}[AutoFakeBold = 3]%
\renewcommand{\heiti}{\CJKfamily{heiti}}
\newcommand{\htbold}{\heiti\bfseries}%黑体加粗

%四周页边距20mm
\geometry{
  left=20mm,
  right=20mm,
  top=20mm,
  bottom=20mm,
  headheight=1.5cm,
  headsep=0.5cm,
  footskip=5mm,
}

%表格中使用\tabincell{c}{}自动换行
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}

%交叉引用相关
\RequirePackage{hyperref}					% Reference
\hypersetup{colorlinks,%				% Reference color setup	
  bookmarks,%生成书签
  bookmarksopen,%默认打开书签
  bookmarksopenlevel=\maxdimen,%展开层次 最大
  linkcolor=black,%内部链接颜色
  citecolor=black,%交叉引用颜色
  urlcolor=black %外部链接颜色
}

\RequirePackage{titlesec} %标题格式
\titleformat{\section}{\centering\heiti\fontsize{18pt}{0pt}}{第\,\chinese{section}\,章}{1em}{}
\titleformat{\subsection}{\xeCJKDeclareCharClass{CJK}{`0 -> `9}\heiti\fontsize{15pt}{0pt}\selectfont}{\thesubsection}{1em}{}%黑体小三
\titleformat{\subsubsection}{\xeCJKDeclareCharClass{CJK}{`0 -> `9}\heiti\fontsize{14pt}{0pt}\selectfont}{\thesubsubsection}{1em}{}%黑体四号
\newcommand{\sectionbreak}{\clearpage}%每节结束自动新一页

%公式以章节编号
\RequirePackage{amsmath}
\numberwithin{equation}{subsection}

%题注格式
\RequirePackage{caption}
\DeclareCaptionFont{songti5}{\fontsize{10.5pt}{0pt}\selectfont}
\captionsetup[table]{justification=centering,font=songti5}
%select attribute for figure caption
\captionsetup[figure]{font=songti5}

%定理环境
\newtheorem{definition}{定义}
\newtheorem{theorem}{定理}
\newtheorem{lemma}{引理}
\newtheorem{corollary}{推论}
\newtheorem{proposition}{{命题}}
\newtheorem{example}{{例}}

\newenvironment{solution}{\noindent\textbf{\emph{解}}\quad }{}


%学院,专业,班级,学号,姓名,中英文标题

%%中英文标题
\newcommand{\cn@thetitlehead}{\quad}
\newcommand{\cn@thetitletail}{\quad}
\newcommand{\en@thetitle}{\quad}
\renewcommand{\title}[3]{
  \renewcommand{\cn@thetitlehead}{#1}
  \renewcommand{\cn@thetitletail}{#2}
  \renewcommand{\en@thetitle}{#3}
}

%%学院
\newcommand{\thecollege}{\quad}
\newcommand{\college}[1]{
  \renewcommand{\thecollege}{#1}
}

%%专业
\newcommand{\themajor}{\quad}
\newcommand{\major}[1]{
  \renewcommand{\themajor}{#1}
}

%%班级
\newcommand{\theclass}{\quad}
\newcommand{\class}[1]{
  \renewcommand{\theclass}{#1}
}

%%学号
\newcommand{\thestudentnumber}{\quad}
\newcommand{\studentnumber}[1]{
  \renewcommand{\thestudentnumber}{#1}
}

%%姓名
\newcommand{\theauthor}{\quad}
\renewcommand{\author}[1]{
  \renewcommand{\theauthor}{#1}
}

%%指导老师
\newcommand{\theadvisor}{\quad}
\newcommand{\advisor}[1]{
  \renewcommand{\theadvisor}{#1}
}

%%职称
\newcommand{\theadvisortitle}{\quad}
\newcommand{\advisortitle}[1]{
  \renewcommand{\theadvisortitle}{#1}
}

%日期

\RequirePackage{datetime} %日期
\renewcommand{\today}{{\number\year} 年 {\number\month} 月 {\number\day} 日}

%封面
\newcommand{\makecover}{
  \pagestyle{empty}
  \setcounter{page}{0}
  \begin{center}
    \includegraphics[scale=0.4244]{logo/logo.jpg}
    \par
    \includegraphics[scale=0.11]{logo/name.png}
    \vspace{22.5pt}
    \par {\hwzs\zihao{-0}\selectfont 本科生毕业论文（设计）}
    \vspace{64pt}
    \begin{table}[htbp]
      \fs\fontsize{15pt}{0pt}\selectfont
      \centering
      \begin{tabular}{p{2cm}<{\raggedright} p{3.37cm}<{\centering} p{1.4cm}<{\raggedright} p{3.37cm}<{\centering}}

        \multicolumn{1}{l}{\heiti\fontsize{16pt}{0pt}\textsf{题\hspace{2em}目:}} & \multicolumn{3}{c}{\underline{\makebox[8.89cm]{\cn@thetitlehead}}}                                                                                                                    \\[0.8cm]
                                                                               & \multicolumn{3}{c}{\underline{\makebox[8.89cm]{\cn@thetitletail}}}                                                                                                                    \\[0.8cm]
        \multicolumn{1}{l}{\heiti\fontsize{16pt}{0pt}\textsf{姓\hspace{2em}名:}} & \multicolumn{3}{c}{\underline{\makebox[8.89cm]{\theauthor}}}                                                                                                                          \\[0.8cm]
        \multicolumn{1}{l}{\heiti\fontsize{16pt}{0pt}\textsf{学\hspace{2em}号:}} & \multicolumn{3}{c}{\underline{\makebox[8.89cm]{\thestudentnumber}}}                                                                                                                   \\[0.8cm]
        \multicolumn{1}{l}{\heiti\fontsize{16pt}{0pt}\textsf{学\hspace{2em}院:}} & \multicolumn{3}{c}{\underline{\makebox[8.89cm]{\thecollege}}}                                                                                                                         \\[0.8cm]
        \multicolumn{1}{l}{\heiti\fontsize{16pt}{0pt}\textsf{专\hspace{2em}业:}} & \multicolumn{3}{c}{\underline{\makebox[8.89cm]{\themajor}}}                                                                                                                           \\[0.8cm]
        %\multicolumn{1}{l}{\heiti\fontsize{16pt}{0pt}\textbf{班\hspace{1.5em}级:}} & \multicolumn{3}{c}{\underline{\makebox[8.89cm]{\theclass}} }                                                                                                                          \\[0.8cm]
        \multicolumn{1}{l}{\heiti\fontsize{16pt}{0pt}\textsf{指导老师:}}           & \underline{\makebox[3.37cm]{\theadvisor}}                           & \multicolumn{1}{l}{{\heiti\fontsize{16pt}{0pt}\textsf{职称:}}} & {\underline{\makebox[3.37cm]{\theadvisortitle}}} \\
      \end{tabular}%
    \end{table}%
    \vspace{64pt}

    {\fontsize{16pt}{0pt}\selectfont\today}
  \end{center}

  \newpage
}

%原创性和授权使用声明
\newcommand{\copyrightpage}{
  \setcounter{page}{0}
  \null
  \vskip 18pt%
    {\centering\sffamily\fontsize{18pt}{32bp}\selectfont
      南京农业大学本科生毕业论文（设计）原创性声明\par}%
  \vskip 14pt%
  \fontsize{12pt}{0pt}本人郑重声明：所呈交的毕业论文（设计），是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。
  \vskip 24pt%
  \fontsize{12pt}{0pt}论文作者签名：\hspace{14em}日期：\hspace{4em}年\hspace{2em}月\hspace{2em}日
  \vskip 7.5em%
    {\centering\sffamily\fontsize{18pt}{32bp}\selectfont
      南京农业大学本科生毕业论文（设计）使用授权声明\par}%
  \vskip 14pt%
  \fontsize{12pt}{0pt}本学位论文作者完全了解学校有关保留、使用毕业论文（设计）的规定，同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权南京农业大学教务处可以将本毕业论文（设计）的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编毕业论文（设计）。
  \vskip 24pt%
  \fontsize{12pt}{0pt}论文作者签名：\hspace{5.25cm}导师签名：
  \par 日期：\hspace{4em}年\hspace{2em}月\hspace{2em}日\hspace{2.7cm}日期：\hspace{4em}年\hspace{2em}月\hspace{2em}日
  \newpage
}
%中英文摘要
\newcommand{\enabstractname}{ABSTRACT}
\newcommand{\cnabstractname}{摘\hspace{1.4em}要}

%%英文摘要
\newenvironment{enabstract}{%
  \addcontentsline{toc}{section}{ABSTRACT}%依据要求目录中需要包含引言
  \begin{center}
    \setstretch{1.6}
    {\fontsize{16pt}{0pt}\selectfont \en@thetitle}
  \end{center}
  \par\vskip 2.5ex\fontsize{12pt}{0pt}\selectfont
  \noindent\mbox{}\hfill{\bfseries\fontsize{16pt}{0pt}\selectfont \enabstractname}\hfill\mbox{}\par
  \vskip 2.5ex \setstretch{1.6}}{\par\vskip 1ex \newpage}
%%中文摘要
\newenvironment{cnabstract}{%
  \addcontentsline{toc}{section}{摘要}%依据要求目录中需要包含引言
  \begin{center}
    \setstretch{1.6}
    {\sffamily\fontsize{18pt}{0bp}\selectfont \cn@thetitlehead  \cn@thetitletail}
  \end{center}
  \par\vskip 2.5ex
  \noindent\mbox{}\hfill{\sffamily\fontsize{16pt}{0pt}\selectfont \cnabstractname}\hfill\mbox{}\par
  \vskip 2.5ex  \setstretch{1.6}}{\par \newpage}%摘要行间距20pt
%%英文关键词
\newenvironment{enkeywords}{\vspace{1em}\par\noindent{\bfseries KEY WORDS: }}{}
%%中文关键词
\newenvironment{cnkeywords}{\vspace{1em}\par\noindent{\htbold 关键词: }}{}
\pagenumbering{arabic}
%目录
\RequirePackage{titletoc}
\renewcommand{\contentsname}{\centering\heiti\fontsize{18pt}{0pt}\selectfont 目\quad 录}
\vspace {24pt}
\ctexset{
  section = {
    name = {第,章},
    number = \chinese{section}
   }
}

\titlecontents{section}
[4em] %左边距
{\fontsize{14pt}{0pt}\selectfont \vspace{11pt}}
{\contentslabel{3.5em}} %标题前标签格式
{\hspace{-3.5em}} %标题内容
{~\titlerule*[0.6pc]{$.$}~\contentspage} %虚线和页码
[] %额外代码

\titlecontents{subsection}[3em]{\fontsize{14pt}{0pt}\selectfont \vspace{11pt}}{\contentslabel{1.5em}}{\hspace*{-2em}}{~\titlerule*[0.6pc]{$.$}~\contentspage}
\titlecontents{subsubsection}[6em]{\fontsize{14pt}{0pt}\selectfont \vspace{11pt}}{\contentslabel{2.5em}}{\hspace*{-2em}}{~\titlerule*[0.6pc]{$.$}~\contentspage}

%页眉页脚
\RequirePackage{fancyhdr}
\fancypagestyle{fancy}{
  \fancyhead[L]{}
  \fancyhead[C]{\fontsize{10.5pt}{0pt}\selectfont 南京农业大学本科生毕业论文（设计）\vspace{1mm}}
  \fancyhead[R]{}
  \fancyfoot{}
  \fancyfoot[L]{}
  \fancyfoot[C]{\fontsize{9pt}{0pt}\selectfont -\thepage -}
  \fancyfoot[R]{}
}

%正文
\newcommand{\mainpart}{\clearpage\pagestyle{fancy}\setstretch{1.6}\setcounter{page}{1}}

%致谢
\newcommand{\acknowledgement}{
  \newpage
  \section*{致\quad 谢}
  \addcontentsline{toc}{section}{致谢}
}

%参考文献
%GBT7714-2015
\RequirePackage[backend = bibtex,style = gb7714-2015,sorting = none,gbcitelocal = chinese]{biblatex}
%MLA
%\RequirePackage[backend = bibtex,style = mla]{biblatex}
\addbibresource[location=local]{references.bib}

\newcommand{\thesisreferences}{
  \titleformat{\section}{\xeCJKDeclareCharClass{CJK}{`0 -> `9}\centering\heiti\fontsize{16pt}{0pt}\selectfont}{\arabic{section}\quad\quad}{0em}{}[]
  \renewcommand{\bibsetup}{\setstretch{1.6}}
  \renewcommand{\bibfont}{\fontsize{10.5pt}{13.65pt}\selectfont}
  \printbibliography[heading=bibintoc,title={参考文献}]
}