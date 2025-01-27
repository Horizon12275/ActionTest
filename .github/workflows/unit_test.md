# name表示这个Workflow的名字是...
name: Unit Test for Helloworld

# on表示在某些事件发生的情况下触发该Workflow
# pull_request：向该分支发送PR的事件，其它常见的事件还有push(向远端推送代码)、schedule(定时执行)
# branches：指定能触发事件的代码分支
on:
  pull_request:
    branches:
      - 2_unit_test

# jobs表示具体要执行的一个或多个任务(Job)
# test：定义了一个Job，可以随便取
# name：test Job的名称
# runs-on：指定了Job运行的环境，Github提供了Ubuntu, Windows和MacOS运行器来运行Job
# steps：Job中的顺序执行的步骤
# - actions/checkout@v4：
# 1. actions: 表示这个Action是由Github Actions官方发布的
# 2. checkout: 在`$GITHUB_WORKSPACE`下Checkout到你的仓库，使得Workflow能够访问仓库
# 3. v4: 表示使用该Action的v4版本
# - actions/setup-java@v4：在运行器(ubuntu-22.04)上配置好Java环境
# - mvn install：安装maven的依赖库
# - mvn test：使用maven进行单元测试
jobs:
  test:
    name: Unit Test
    runs-on: ubuntu-22.04
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Setup Java
        uses: actions/setup-java@v4
        with:
          distribution: "temurin"
          java-version: "17"
      - name: Build with Maven
        run: mvn install
      - name: Run Test
        run: mvn test
