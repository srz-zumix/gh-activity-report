# gh-activity-report

lists pull requests and issues that can be specified by the date of the difference from the current.

## Installation

```sh
gh extension install srz-zumix/gh-activity-report
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
