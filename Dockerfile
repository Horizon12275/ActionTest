# 该镜像需要依赖的基础镜像
FROM fabric8/java-alpine-openjdk1.8-jre
# 调整时区
RUN rm -f /etc/localtime \
&& ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo "Asia/Shanghai" > /etc/timezone
# 将当前目录下的jar包复制到docker容器的/目录下
ADD target/helloworld-0.0.1-SNAPSHOT.jar /helloworld-0.0.1-SNAPSHOT/helloworld-0.0.1-SNAPSHOT.jar
# 指定docker容器启动时运行jar包
ENTRYPOINT ["java", "-jar","helloworld-0.0.1-SNAPSHOT/helloworld-0.0.1-SNAPSHOT.jar"]