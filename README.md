## Characterizing and Understanding Software Security Vulnerabilities in Machine Learning libraries

The application of machine learning (ML) libraries has been tremendously increased in a wide range of domains including autonomous driving systems, medical, and critical industries. 
Vulnerabilities of such libraries result in irremediable consequences. Recently, some studies have been conducted to categorize bugs of DL and ML libraries both from end-user (API misuses) and developers (real bugs during implementation) contexts. However, characterizing software security vulnerabilities has been never studied. To bridge this gap, in this paper, we characterize vulnerabilities of five well-known DL and ML libraries including Tensorflow, PyTorch, Sickit-learn, Pandas, and Numpy. To do so, we extracted the vulnerable related commits from repositories of these libraries. Hence, we implemented a rule-based system in which it employs a set of predefined rules to match most related commits for analysis. We collected commits, merged pull requests, and issues linked to original commits addressing five major research questions; 1) vulnerability types, 2) root cause, 3) symptoms, 4) fixing patterns, and 5) fixing scales, and 6) affected components. The findings of this paper assist practitioners and developers to have a better understanding of software security vulnerabilities across different libraries and help their team to gain better insight into the weaknesses of such libraries.

You can use the [editor on GitHub](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/edit/main/README.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [Basic writing and formatting syntax](https://docs.github.com/en/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/cse19922021/Deep-Learning-Security-Vulnerabilities/settings/pages). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://support.github.com/contact) and we’ll help you sort it out.
