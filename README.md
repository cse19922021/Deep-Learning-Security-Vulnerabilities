## Characterizing and Understanding Software Security Vulnerabilities in Machine Learning libraries

The application of machine learning (ML) libraries has been tremendously increased in a wide range of domains including autonomous driving systems, medical, and critical industries. 
Vulnerabilities of such libraries result in irremediable consequences. Recently, some studies have been conducted to categorize bugs ML libraries both from end-user (API misuses) and developers (real bugs during implementation) contexts. However, characterizing software security vulnerabilities has been never studied. To bridge this gap, in this paper, we characterize vulnerabilities of five well-known ML libraries including Tensorflow, PyTorch, Sickit-learn, Pandas, and Numpy. To do so, we collected security vulnerabilities and their related commits, merged pull requests, and issues to address six major research questions: 1) vulnerability types, 2) root causes, 3) symptoms, 4) fixing patterns, 5) fixing scales, and 6) affected components of security vulnerabilities in ML libraries. The findings of this paper can assist practitioners and developers to have a better understanding of software security vulnerabilities across different ML libraries and gain a better insight into the weaknesses of the studied ML libraries.

## Empirical Study
In this project, we provide the first comprehensive empirical study on characteristics of software security vulnerabilities of DL and ML libraries including Tensorflow, PyTorch, Sicki-Learn, Pandas, and Numpy. In total, we collected 603 vulnerable related commits for our analysis, and based on our manual analysis, we provide multiple findings and guidelines to developers and contributors of these libraries to have a better understanding of software security vulnerabilities specific to this context and increase the reliability them. We address the following research questions:

* What is the frequency of vulnerability types?
* What is the frequency of root causes of vulnerabilities?
* What is the frequency of symptoms of vulnerabilities?
* What is the frequency of fixing patterns?
* What is the frequency of fixing scales?
* What components affected by vulnerabilities?

The benchmark data we used for our manual analysis is available [here](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/benchmarkData.csv)

In order to extract commits, please use this [script] (https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/blob/main/fetch_commits.py)

