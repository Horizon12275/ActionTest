# name表示这个Workflow的名字是...
name: Welcome to Github Actions

# on表示在某些事件发生的情况下触发该Workflow
# pull_request：向该分支发送PR的事件，其它常见的事件还有push(向远端推送代码)、schedule(定时执行)
# pull_request_target：和pull_request类似，区别是它执行时具有目标分支（即仓库主分支）的上下文权限，而不是源分支的上下文权限。
# 这个事件触发器的主要用途是处理来自fork仓库的Pull Request，因为它可以使用目标仓库的secrets。
# branches：指定能触发事件的代码分支
on:
  #  pull_request:
  pull_request_target:
    branches:
      - 1_github_actions_welcome

# permissions声明了该Workflow需要用到的权限
# pull-requests: write 表示我们为该Workflow赋予了写权限
# Workflow默认使用的ITHUB_TOKEN没有写权限，需要在"Settings-Actions-General"中打开Workflow的write权限
permissions:
  pull-requests: write

# jobs表示具体要执行的一个或多个任务(Job)
# welcome：定义了一个Job，可以随便取
# name：welcome Job的名称
# runs-on：指定了Job运行的环境，Github提供了Ubuntu, Windows和MacOS运行器来运行Job
# steps：Job中的顺序执行的步骤，下方表示一个名叫"Comment"的step要执行`gh pr comment`命令
# env：指定在Job中用到的环境变量，例如下方的PR_URL，其值为该PR的链接
# 在使用Github CLI的时候需要在环境变量中传入GITHUB_TOKEN
jobs:
  welcome:
    name: Welcome to Github Actions
    runs-on: ubuntu-22.04
    steps:
      - name: Comment
        run: gh pr comment $PR_URL --body "Welcome to the repository!"
    env:
      GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      PR_URL: ${{ github.event.pull_request.html_url }}
