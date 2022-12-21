---
title: ocotokit.js
sidebar_position: 3
---

# Introduction

[ocotokit.js](https://github.com/octokit/rest.js/) is a javascript library that can help you interact with the [GitHub API](https://docs.github.com/en/rest) in a easy manner.  Some javascript knowledge is helpful, but not required for many simple tasks.  

You can use the octokit.js client along with the [github-script](https://github.com/actions/github-script) action to quickly interface with the GitHub API to do useful things in Actions (like commenting on an issue.)

It is helpful to install [node.js](https://nodejs.org/en/download/) when developing scripts that interface with the GitHub API so you can test them locally.

# Example Octokit Scripts

## Example 1: Create A Comment On A PR

Let's say you want to programatically make a comment on a pull request with a url that includes the branch name, but you are only given the pull request number.  We first lookup the branch name associated with the pull request and pass that to the method call that makes an issue comment:

```js
//Instantiate octokit client
const { Octokit } = require("@octokit/rest");
const octokit = new Octokit({
    auth: "<YOUR_PERSONAL_ACCESS_TOKEN>",
  });

  //Take an action (create a comment) triggered by an issue comment

  // Get information about the pr
  octokit.pulls.get({
    owner: 'hamelsmu',
    repo: 'test_html',
    pull_number: 1
  }).then( (pr) => {
    // use the branch name from the pr to make a pr comment
    var BRANCH_NAME = pr.data.head.ref
    octokit.issues.createComment({
        issue_number: 1,
        owner: 'hamelsmu',
        repo: 'test_html',
        body: `[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/hamelsmu/test_html/${BRANCH_NAME}) :point_left: Launch a binder notebook on this branch`
      })
  })
```

## Example 2: Issue Comment

This is a simple example of how you can create an issue comment.

```js
  //Instantiate octokit client
  const { Octokit } = require("@octokit/rest");
  const octokit = new Octokit({
    auth: "<YOUR_PERSONAL_ACCESS_TOKEN>",
    });

  // Create an issue commment
  var BRANCH_NAME = 'hamelsmu-patch-1'
  octokit.issues.createComment({
      issue_number: 1,
      owner: 'hamelsmu',
      repo: 'test_html',
      body: `[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/hamelsmu/test_html/${BRANCH_NAME}) :point_left: Launch a binder notebook on this branch`
    })
```

# MyBinder.org

The examples above were adapted to [write these docs](https://mybinder.readthedocs.io/en/latest/howto/gh-actions-badges.html) for [mybinder.org](https://mybinder.org/).

