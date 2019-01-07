# GitHub Action to run any command

It opens a command line and runs the command from the args.  You can use this command to do anything you would like.  For example, you can run a git clone, build, and push to a new repo.

## Configuration


### Project Environment Variables

As required.

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
