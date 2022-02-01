## Characterizing and Understanding Software Security Vulnerabilities in Machine Learning libraries

The application of machine learning (ML) libraries has been tremendously increased in many domains, including autonomous driving systems, medical, and critical industries. Vulnerabilities of such libraries result in irreparable consequences. However, the characteristics of software security vulnerabilities have not been well studied. In this paper, to bridge this gap, we take the first step towards characterizing and understanding the security vulnerabilities of five well-known ML libraries, including Tensorflow, PyTorch, Sickit-learn, Pandas, and Numpy. To do so, in total, we collected 596 security-related commits to exploring five major factors: 1) vulnerability types, 2) root causes, 3) symptoms, 4) fixing patterns, and 5) fixing scales of security vulnerabilities in ML libraries. The findings of this study can assist developers in having a better understanding of software security vulnerabilities across different ML libraries and gain a better insight into their weaknesses of them. To make our finding actionable, we further developed DeepMut, an automated mutation testing tool, as a proof-of-concept application of our findings. DeepMut is designed to assess the adequacy of existing test suites of ML libraries against security-aware mutation operators extracted from the vulnerabilities studied in this work. We applied DeepMut on the Tensorflow kernel module and found more than 1k alive mutants not considered by the existing test suit. The results demonstrate the usefulness of our findings.

## Empirical Study
In this project, we provide the first comprehensive empirical study on characteristics of software security vulnerabilities of DL and ML libraries, including Tensorflow, PyTorch, Sicki-Learn, Pandas, and Numpy. In total, we collected 596 vulnerable related commits for our analysis, and based on our manual analysis; we provide multiple findings and guidelines to developers and contributors of these libraries to have a better understanding of software security vulnerabilities specific to this context and increase the reliability them. We address the following research questions:

* What types of vulnerabilities exist in ML libraries?
* What are the root causes for vulnerabilities in ML libraries?
* What are the symptoms of vulnerabilities in ML libraries?
* What are the fixing patterns for vulnerabilities in ML libraries?
* What are the efforts required for fixing vulnerabilities in ML libraries?


The benchmark data we used for our manual analysis is available [here](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/benchmark.csv).

In order to extract commits, please use this [script](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/fetch_commits.py).

The steps to reproduce the commits for each ML library is as follows:
* Put `fetch_commits.py` under any directory in your os, and the commits will be generated at the same directory. Please note that you need Python3.x to be able to run the script. 
* Once you run the script, you will see multiple parameters. The main parameters are the target ML library username and repository name, as well as a personal access token.

In order to generate Figure 7 and Figure 9, we used a Python library called [plotly](https://plotly.com/). You can use [Figure7](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/figure7.py) and [Figure9](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/figure9.py) to generate Figure 7 and Figure 9, respectively. To generate them, you just need to put the scripts anywhere in your local disk and run them using Python3.x. Please note that you can not run scripts using Python2.x. Then the figures will be generated as web pages in your localhost address. 

In order to run our developed automated mutation testing tool (DeepMute), please refer to [Link](https://github.com/cse19922021/DeepMute/tree/main).

<!-- To generate distributions according to each research question in the paper, we use [this](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/generate_figs.R) written in R. You can simply run the script and all related figures will be generated automatically in PDF format. Prerequisite of running R scripts is to install [R](https://www.r-project.org/) base according to your platform. Also, it is highly recommended to use [R studio](https://www.rstudio.com/) to generate the figures. Please make sure:
 -->
<!-- * You place benchmark [data](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/benchmark.csv) under same directory where the [script](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/generate_figs.R) is resided.
* When using R studio, make sure you change the work space directory to the directory where the benchmark data and the script are resided. You may want to set the working directory under /sessions/Set Working Directory/Choose Directory In R studio.  -->
