# gh-activity-report

lists pull requests and issues that can be specified by the date of the difference from the current.

## Installation

```sh
gh extension install srz-zumix/gh-activity-report
```

recommend

```sh
gh alias set ar activity-report
```

## Usage

### List of pull requests and issues created in the last 7 days

```sh
gh activity-report -d 7
```

### A list of pull requests and issues related to you from 7 days ago to 3 days ago

```sh
gh activity-report --involves "@me" -d 7..3
```

### Output in a format for pasting into GitHub

```sh
gh activity-report -d 7..5 --format comment
```

```text
Showing 5 of 5 issues and pull requests

TITLE                         KIND  STATE   UPDATE                LINK
fix release-drafter workflow  pr    merged  2023-04-22T14:23:00Z  srz-zumix/gh-activity-report#4
use issues --include-prs      pr    merged  2023-04-22T14:07:19Z  srz-zumix/gh-activity-report#3
add -w,--web option           pr    merged  2023-04-22T14:02:16Z  srz-zumix/gh-activity-report#2
first commit                  pr    merged  2023-04-22T10:40:14Z  srz-zumix/gh-activity-report#1
update README                 pr    merged  2023-04-21T05:23:27Z  srz-zumix/gh-act#80
```

## Options

```text
  -f, --format       string             Output format: [comment|gh|link|markdown] (default "gh")
  -h, --help                            Show help
      --version                         Show version
  -l, --limit        number             Maximum number of results to fetch
      --owner        string             Filter on repository owner
  -R, --repo         [HOST/]OWNER/REPO  Specify search target
      --sort         string             Sort fetched results: {comments|created|interactions|reactions|reactions-+1|reactions--1|reactions-heart|reactions-smile|reactions-tada|reactions-thinking_face|updated} (default "updated")
      --state        string             Filter based on state: {open|closed}
  -w, --web                             Open the search query in the web browser

account filter: default --auther @me, if not specified bellow
  --assignee         string             Filter by assignee
  --author           string             Filter by author
  --involves         string             Filter based on involvement of user
  --mentions         string             Filter based on user mentions
  --commenter        string             Filter based on comments by user
  --review-requested string             Filter based on comments by user
  --reviewed-by      string             Filter on user who reviewed

date range:
  -d, --days-ago     since(..until)     Specify the period to filter n days ago
      --since        yyyy-mm-dd         Start date to filter by date
      --until        yyyy-mm-dd         End date to filter by date

date filter:
  --created                             Filter based on created at date
  --closed                              Filter on closed at date
  --merged                              Filter on merged at date
  --updated                             Filter on last updated at date

pull_request filter:
  --draft                               Filter based on draft state
```

## Output format

| name     | description |
|:---------|:------------|
| comment  | plain text for GitHub issue|pr comment |
| gh       | gh search (issues\|prs) format |
| link     | link only |
| markdown | markdown |
