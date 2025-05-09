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

## Requirement

* gh
* Bash >= 4.4

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
  -f, --format       string             Output format: [comment|gh|json|lens|lens-with-body|link|list|markdown] (default "gh")
  -h, --help                            Show help
      --version                         Show version
  -n, --dryrun                          Dryrun, Prints the command to be executed
  -l, --limit        number             Maximum number of results to fetch
      --owner        string             Filter on repository owner
      --prs                             Search for pull requests
  -R, --repo         [HOST/]OWNER/REPO  Specify search target
      --sort         string             Sort fetched results: {comments|created|interactions|reactions|reactions-+1|reactions--1|reactions-heart|reactions-smile|reactions-tada|reactions-thinking_face|updated} (default "updated")
      --state        string             Filter based on state: {open|closed}
      --visibility   string             Filter based on repository visibility: {public|private|internal}
  -w, --web                             Open the search query in the web browser

account filter: Default --auther @me, if not specified bellow
                Account filters can be specified multiple times.
                In that case, it becomes an OR condition
  --assignee         [name]             Filter by assignee
  --author           [name]             Filter by author
  --commenter        [name]             Filter based on comments by user
  --involves         [name]             Filter based on involvement of user
  --mentions         [name]             Filter based on user mentions
  --review-requested [name]             Filter based on comments by user
  --reviewed-by      [name]             Filter on user who reviewed

   (defaults to \"@me\" if not specified [name])

date range:
  -d, --days-ago     since[..until]     Specify the span to filter n days ago
  -m, --months-ago   since[..until]     Specify the span to filter n months ago (since is the first day, until is the end of the month)
      --since        yyyy-mm-dd         Start date to filter by date
      --until        yyyy-mm-dd         End date to filter by date
      --date         since[..until]     Specify the span to filter by a custom date range (format: yyyy-mm-dd)

date filter:
  --created-at                          Filter based on created at date
  --closed-at                           Filter on closed at date
  --merged-at                           Filter on merged at date
  --updated-at                          Filter on last updated at date (default)

pull_request filter:
  --draft                               Filter based on draft state
  --merged                              Filter based on merged state
  --review          string              Filter based on review status: {none|required|approved|changes_requested}
  --sha             string              Filter based on containing SHA. The SHA syntax must be at least seven characters.
  --unmerged                            Filter based on unmerged state

exclude filter:
  --no-owner        string              Exclude repository owner
  --no-repo         [HOST/]OWNER/REPO   Exclude specify repository
```

## Output format

| name           | description |
|:---------------|:------------|
| comment        | plain text for GitHub issue\|pr comment |
| gh             | gh search issues\|prs format |
| json           | Outputs all key-value pairs in JSON format |
| lens           | PR summary in plain text |
| lens-with-body | PR summary and description in plain text |
| link           | link only |
| list           | markdown list |
| markdown       | markdown table |
