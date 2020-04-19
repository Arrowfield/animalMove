<pre>
一、项目基本介绍：
  （1）开发语言：JAVA
  （2）技术栈：<em>jsp+ajax+js+sql+html+css</em>
  （3）在项目的根目录下面有一个.settings文件，找到org.eclipse.wst.common.component文件，打开后将<propertyname="context-root" value="/MNGCC"/>这一行value后面的项  目名称改成新的项目名称即可。
  （4）学习MVC与学习struts2框架
  （5）项目名称：衣佳服装电商网站设计
  （6）通过映射的关系进行tomcat服务器的深度拷贝
</pre>


#### 启动项目

+ 启动tomcat服务器
+ 项目运行在eclipse里面 安装开发web项目的插件 普通的eclipse无法开发jsp项目 只能用myEclipse 否者就装plugin 配置tomcat
+ 将项目的入口文件放到服务器的webapp目录下即可


+ 包的大小：11.7kb


#### 项目总结
+ service.bat install
+ 开发环境的配置<https://blog.csdn.net/qq_36318234/article/details/80502957>
+ java + jdk1.8 + maven3 + tomcat1.9 + mysql5.7 + code source + IntelliJ IDEA
+ [maven3](https://www.yiibai.com/maven/)
+ maven3<http://maven.apache.org/download.cgi>（创建项目） + springMVC（依赖）+ ide（开发工具）+ tomcat + servlet3.1
+ %M2_HOME%\bin
+ MAVEN_HOME D:\apache-maven-3.6.1
+ java + Maven + SpringBoot 构建webapp项目<https://baijiahao.baidu.com/s?id=1632687280256687825&wfr=spider&for=pc>
+ pom => 项目对象模型

```
  //自己输入后生成的
  <groupId>com.baidu</groupId>
  <artifactId>springdemo</artifactId>
```

#### 知识点

+ 开发工具自动集成maven
+ 热部署<https://blog.csdn.net/testcs_dn/article/details/79929886>
+ 端口占用<https://www.cnblogs.com/iflytek/p/8916175.html>
+ 打包部署方便
+ 文件大小目前不超过1M（除去就的文件）
+ 快速创建web项目<https://blog.csdn.net/u012710313/article/details/73332085>

```
netstat -aon|findstr 8080
taskkill /f /t /im 8080
```
+ 运行jar包的命令

```java
//java -jar springdemo-1.0-SNAPSHOT.jar

```
```java
//git取消跟踪不删除文件 git rm -r --cached . 
```


