# GitHub Action to run any command

This GitHub Action utilizes the internal-only [weir-ci-node](https://developers.weir/docs/guides/node/weir-ci-node-guide.html) tool.  It opens a command line and runs the command from the args.  You can use this command to do anything you would like.  For example, you can run a git clone, build, and push to a new repo.

## Configuration


### Project Environment Variables

Since the Weir CI Node tool launches your project internally, the GitHub Action also requires that you provide any other project dependant environment variables used to run your application.

### Workflow

```javascript
workflow "New Commit" {
  on = "push"
  resolves = ["Run any command"]
}

action "Run any command" {
  uses = "weirgroup/devops-actions/weir-cmd@master"
  args = "echo $(pwd)"
}
```
