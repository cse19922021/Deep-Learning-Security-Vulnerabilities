## Characterizing and Understanding Software Security Vulnerabilities in Machine Learning libraries

The application of machine learning (ML) libraries has been tremendously increased in a wide range of domains including autonomous driving systems, medical, and critical industries. Vulnerabilities of such libraries result in irremediable consequences. However, the characteristics of software security vulnerabilities has not been well studied. To bridge this gap, in this paper, we take the first step towards characterizing and understanding security vulnerabilities of five well-known ML libraries including Tensorflow, PyTorch, Sickit-learn, Pandas, and Numpy. To do so, in total, we collected 596 security related commits to explore five major factors: 1) vulnerability types, 2) root causes, 3) symptoms, 4) fixing patterns, and 5) fixing scales of security vulnerabilities in ML libraries. The findings of this study can assist developers to have a better understanding of software security vulnerabilities across different ML libraries and gain a better insight into the weaknesses of them. To make our finding actionable, we further developed DeepMut, an automated mutation testing tool as a proof-of-concept application of our findings. DeepMut is designed to asses the adequacy of existing test suits of ML libraries against security aware mutation operators extracted from the vulnerabilities studied in this work. We applied DeepMut on Tensorflow kernel module and found more than 1k alive mutants that are not covered by existing test suits. The results demonstrates the usefulness of our findings.

## Empirical Study
In this project, we provide the first comprehensive empirical study on characteristics of software security vulnerabilities of DL and ML libraries including Tensorflow, PyTorch, Sicki-Learn, Pandas, and Numpy. In total, we collected 596 vulnerable related commits for our analysis, and based on our manual analysis, we provide multiple findings and guidelines to developers and contributors of these libraries to have a better understanding of software security vulnerabilities specific to this context and increase the reliability them. We address the following research questions:

* What types of vulnerabilities exist in ML libraries?
* What are the root causes for vulnerabilities in ML libraries?
* What are the symptoms of vulnerabilities in ML libraries?
* What are the fixing patterns for vulnerabilities in ML libraries?
* What are the efforts required for fixing vulnerabilities in ML libraries?


The benchmark data we used for our manual analysis is available [here](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/benchmark.csv).

In order to extract commits, please use this [script](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/fetch_commits.py).

In order to generate Figure 7 and Figure 9, we used a Python library called [plotly](https://plotly.com/). You can use this script [Link](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/figure7.py) and [Link](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/figure9.py) to generate the Figure 7 and Figure 9 respectively.

<!-- To generate distributions according to each research question in the paper, we use [this](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/generate_figs.R) written in R. You can simply run the script and all related figures will be generated automatically in PDF format. Prerequisite of running R scripts is to install [R](https://www.r-project.org/) base according to your platform. Also, it is highly recommended to use [R studio](https://www.rstudio.com/) to generate the figures. Please make sure:
 -->
<!-- * You place benchmark [data](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/benchmark.csv) under same directory where the [script](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/generate_figs.R) is resided.
* When using R studio, make sure you change the work space directory to the directory where the benchmark data and the script are resided. You may want to set the working directory under /sessions/Set Working Directory/Choose Directory In R studio.  -->
