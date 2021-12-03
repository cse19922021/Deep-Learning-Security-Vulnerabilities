import json
import os
import re
import requests as r
import argparse
import sys
import random

potential_commits = []

def get_commits(githubUser, currentRepo, qm, page, amp, sh_string, last_com , page_number, start_date, branch_sha, token):

  token = os.getenv('GITHUB_TOKEN', token)
  page_number += 1
 
  if page_number == 1:
    first_100_commits = "https://api.github.com/repos/" + githubUser + "/"+currentRepo+"/commits"+ qm + page + amp + sh_string + branch_sha
  else:
    first_100_commits = "https://api.github.com/repos/" + githubUser + "/"+currentRepo+"/commits"+ qm + page + amp + sh_string + last_com

  response = r.get(first_100_commits, headers={'Authorization': 'token {}'.format(token)})
  first_100_commits = json.loads(response.text)

  if len(first_100_commits) == 1:
      return None
  for i, commit in enumerate(first_100_commits):
    print('Total number of fetched commits: {}, page:{}, branch: {}'.format(i, page_number, branch_sha))

    _rule = r"(denial of service|DOS|XXE|remote code execution|bopen redirect|OSVDB|bvuln|CVE|XSS|ReDoS|NVD|malicious|x−frame−options|attack|cross-site|exploit|directory traversal|RCE|XSRF|clickjack|session-fixation|hijack|advisory|insecure|security|cross-origin|unauthori[z|s]ed|infinite.loop|brute force|bypass|constant time|crack|credential|expos(e|ing|ure)|hack|harden|injection|lockout|overflow|password|PoC|proof of concept|priveale|(in)?secur(e|ity)|Heap buffer overflow|Integer division by zero|Undefined behavior|Heap OOB write|Division by zero|Crashes the Python interpreter|Heap overflow|Uninitialized memory accesses|Heap OOB access|Heap underflow|Heap OOB|Heap OOB read|Segmentation faults|Segmentation fault|seg fault|Buffer overflow|Null pointer dereference|FPE runtime|segfaults|segfault|attack|authenticate|authentication|checkclickjack|compromise|constant-time|corrupt|crack|craft|credential|cross Site Request Forgery|cross-Site Request Forgery|CVE-|Dan Rosenberg|deadlock|deep recursion|denial-of-service|directory traversal|disclosure|divide by 0|divide by zero|divide-by-zero|division by zero|division by 0|division-by-zero|division-by-0|double free|endless loop|exhaust|dos|fail|fixes CVE-|forgery|fuzz|general protection fault|GPF|grsecurity|guard|leak|initialize|insecure|invalid|KASAN|info leak|limit|lockout|long loop|loop|man in the middle|man-in-the-middle|mishandle|MITM|negative|null deref|null-deref|NULL dereference|null function pointer|null pointer dereference|null-ptr|null-ptr-deref|off-by-one|OOB|oops|open redirect|oss-security|out of array|out of bound|out-of-bound|overflow|overread|override|overrun|panic|password|poison|prevent|privesc|privilege|protect|race|race condition|RCE|remote code execution|replay|sanity check|sanity-check|security|security fix|security issue|security problem|session fixation|snprintf|spoof|syzkaller|trinity|unauthorized|undefined behavior|underflow|unexpected|uninitialize|unrealize|use after free|use-after-free|valid|verification|verifies|verify|violate|violation|vsecurity|vuln|vulnerab|XML External Entity)"
   
    _match = re.findall(_rule, commit['commit']['message'])
    _date = commit['commit']['committer']['date']
    sdate = _date.split('-')
    if _match:
      _date = commit['commit']['committer']['date']
      sdate = _date.split('-')
      print('I found a relevant commit from:  {}'.format(int(sdate[0])))
      if int(sdate[0]) >= 2016 and int(sdate[0]) < 2018:
          print(len(potential_commits))
          potential_commits.append(commit['html_url'])

    if i == len(first_100_commits)-1:
        last_com = commit['sha']
        get_commits(githubUser, currentRepo, qm, page, amp, sh_string, last_com , page_number, start_date, branch_sha, token)
        
def main(args):


  qm = '?'
  page = 'per_page='+str(args.pages)
  amp = '&'
  sh_string = "sha="

  branchLink = "https://api.github.com/repos/{0}/{1}/branches".format(args.user, args.repo)
  response = r.get(branchLink, headers={'Authorization': 'token {}'.format(args.gitToken)})
  branches = json.loads(response.text)


  if args.branch:
    for item in branches:
      if item['name'] == args.branch:
          branch_sha = item['commit']['sha']
  else:
    selected_branch = random.choice(branches)
    branch_sha = selected_branch['commit']['sha']
  
  page_number = 0

  first_100_commits = "https://api.github.com/repos/" + args.user + "/"+args.repo+"/commits"+ qm + page + amp + sh_string + branch_sha

  response = r.get(first_100_commits, headers={'Authorization': 'token {}'.format(args.gitToken)})
  first_100_commits = json.loads(response.text)

  last_com = first_100_commits[-1]['sha']

  try:
    get_commits(args.user, args.repo, qm, page, amp, sh_string, last_com , page_number, args.start_date, branch_sha, args.gitToken)
  except:
    raise Exception('You have passed wrong parameters to the program. Please double check your parameters') 
  with open(args.repo+'.txt', 'w') as f:
    for item in potential_commits:
        f.write("%s\n" % item)

if __name__ == "__main__":
  Epilog  = """An example usage: fetch_commits.py --user=tensorflow --repo=tensorflow --branch=master --pages=100 --start_date=2015 --gitToken=your_token"""
  parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,
        description='Extract commits from github repositories.', epilog=Epilog)

  parser.add_argument('--user' , type=str, help='Please enter the username.')
  parser.add_argument('--repo', type=str, help='Please enter the project name.')
  parser.add_argument('--branch', type=str, help='Which branch are you interested? Please note that default branch will be selected randomely if you do not specify.')
  parser.add_argument('--pages' ,default=100 , type=int, help='The number of pages per request.')
  parser.add_argument('--start_date', default=2015 , type=int, help='Please specify a start date for commit collection.')
  parser.add_argument('--gitToken', type=str, help="In order to use this library, you need to enter your Github token. Please refer to https://github.com/settings/tokens")

  args = parser.parse_args()

  if args.user == None or args.repo == None or args.gitToken == None:
    parser.print_help()
    sys.exit(-1)
  
  main(args)