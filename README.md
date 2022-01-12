## Characterizing and Understanding Software Security Vulnerabilities in Machine Learning libraries

The application of machine learning (ML) libraries has been tremendously increased in a wide range of domains including autonomous driving systems, medical, and critical industries. Vulnerabilities of such libraries result in irremediable consequences. However, the characteristics of software security vulnerabilities has not been well studied. To bridge this gap, in this paper, we take the first step towards characterizing and understanding security vulnerabilities of five well-known ML libraries including Tensorflow, PyTorch, Sickit-learn, Pandas, and Numpy. To do so, in total, we collected 599 security related commits to explore six major factors: 1) vulnerability types, 2) root causes, 3) symptoms, 4) fixing patterns, and 5) affected components of security vulnerabilities in ML libraries. The findings of this study can assist developers to have a better understanding of software security vulnerabilities across different ML libraries and gain a better insight into the weaknesses of the studied ML libraries. To make our finding actionable, we further developed {\tool}, an automated mutation testing tool for ML libraries as a proof-of-concept application of our findings. {\tool} is designed to asses the adequacy of existing test suits of ML libraries against security aware mutation operators extracted from the vulnerabilities studied in this work. We applied {\tool} on Tensorflow kernel module and found more than 1k alive mutants that are not covered by existing test suits. The results demonstrates the usefulness of our findings.

## Empirical Study
In this project, we provide the first comprehensive empirical study on characteristics of software security vulnerabilities of DL and ML libraries including Tensorflow, PyTorch, Sicki-Learn, Pandas, and Numpy. In total, we collected 603 vulnerable related commits for our analysis, and based on our manual analysis, we provide multiple findings and guidelines to developers and contributors of these libraries to have a better understanding of software security vulnerabilities specific to this context and increase the reliability them. We address the following research questions:

* What is the frequency of vulnerability types?
* What is the frequency of root causes of vulnerabilities?
* What is the frequency of symptoms of vulnerabilities?
* What is the frequency of fixing patterns?
* What components affected by vulnerabilities?

The benchmark data we used for our manual analysis is available [here](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/workflow.csv).

In order to extract commits, please use this [script](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/fetch_commits.py).

In order to generate Figure 8 which is the mapping of root causes to symptoms, we used a Python library called [plotly](https://plotly.com/). You can use this script [Link](https://cse19922021.github.io/Deep-Learning-Security-Vulnerabilities/rootcauseSymptom.html) to generate this figure as shown in the paper.

To generate distributions according to each research question in the paper, we use [this](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/generate_figs.R) written in R. You can simply run the script and all related figures will be generated automatically in PDF format. Prerequisite of running R scripts is to install [R](https://www.r-project.org/) base according to your platform. Also, it is highly recommended to use [R studio](https://www.rstudio.com/) to generate the figures. Please make sure:

* You place benchmark [data](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/benchmark.csv) under same directory where the [script](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/generate_figs.R) is resided.
* When using R studio, make sure you change the work space directory to the directory where the benchmark data and the script are resided. You may want to set the working directory under /sessions/Set Working Directory/Choose Directory In R studio. 
