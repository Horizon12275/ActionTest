# 该镜像需要依赖的基础镜像，使用 OpenJDK 17 和 Alpine 基础镜像
FROM adoptopenjdk/openjdk17:alpine
# 调整时区 确保容器内的时间与主机系统或预期的时区一致，方便日志记录和调试
RUN rm -f /etc/localtime \
&& ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo "Asia/Shanghai" > /etc/timezone
# 设置工作目录
WORKDIR /app
# 将当前目录下的jar包复制到docker容器的/目录下
ADD target/helloworld-0.0.1-SNAPSHOT.jar /app/
# 指定docker容器启动时运行jar包
ENTRYPOINT ["java", "-jar","helloworld-0.0.1-SNAPSHOT.jar"]