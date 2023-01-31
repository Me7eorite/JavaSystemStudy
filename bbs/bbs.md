#### bbs项目创建

## 0x01 环境问题

引用的jar文件要放在/WEB-INF/lib文件夹，否则会报ClassNotFound错误。

## 0x02 基础配置

### 2.1 spring

自动扫描controller注解在指定的包位置

```xml
<context:component-scan base-package="com.me7eorite.bbs.controller*.**" use-default-filters="false">
  <context:include-filter type="annotation" expression="org.springframework.stereotype.Controller"/>
</context:component-scan>
<!----开启注解--->
<mvc:annotation-driven/>
```

配置jsp文件的位置手动设置模板解析。当我们使用`return "admin/login"`的时候，与下面定义的prefix和suffix自动进行拼接==》/WEB-INF/jsp/admin/login.jsp

```xml
<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
  <property name="prefix" value="/WEB-INF/jsp/"/>
  <property name="suffix" value=".jsp"/>
</bean>
```

添加一个拦截器处理请求

```java
<bean id="annotationHandlerMapping" class="org.springframework.web.servlet.mvc.annotation.DefaultAnnotationHandlerMapping">
    <property name="order" value="0"/>
    <property name="interceptors">
        <list>
            <bean class="com.me7eorite.bbs.intercepter.ProtalSessionHandlerInterceptor"/>
        </list>
    </property>
</bean>
```

### 2.2 web.xml

创建一个监听器，定义和引入配置文件，设置上下文配置的加载文件为applicationContext(Mysql/jdbc/db...)。

```xml
<!-- Spring配置文件开始  -->
<listener>
  <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
</listener>
<context-param>
  <param-name>contextConfigLocation</param-name>
  <param-value>classpath:applicationContext.xml</param-value>
</context-param>
<!-- Spring配置文件结束 -->
```



配置分发servlet的操作

```xml

<servlet>
  <servlet-name>springServlet-protal</servlet-name>
  <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
  <init-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>/spring-mvc-protal.xml</param-value>
  </init-param>
  <load-on-startup>1</load-on-startup>
</servlet>
<servlet-mapping>
  <servlet-name>springServlet-protal</servlet-name>
  <url-pattern>*.html</url-pattern>
</servlet-mapping>
<servlet-mapping>
  <servlet-name>springServlet-protal</servlet-name>
  <url-pattern>*.json</url-pattern>
</servlet-mapping>
```

## 0x03 后台设计

### 3.0 功能分析

页面访问(登陆页面/首页/修改密码/其它)

登陆/修改密码/退出功能/找回功能/权限校验(未登陆不能访问首页/未授权)/验证码/注册功能/文件上传

**设计思路：应该把常用的代码放置于一个Base的控制器内还有的一些通用的变量应该设置为常量。例如：返回请求的信息格式、**

#### 1.注册功能

- **功能点分析**
  - 传递多个参数
  - 上传头像
  - 验证码(防止恶意注册)

- **代码流程**
  1. 判断验证码是否准确
  2. 判断输入是否合法(用户名空/账号空/注入....) (**前端限制和后端限制**)
  3. 判断数据库内是否有同名冲突字段。
  4. 配置SQL语句插入用户
  5. 返回执行结果

- **功能实现**
  - 传递参数
    - 利用`request`就能够实现或者是在参数位置增加形参来获取用户的输入
  - 上传头像
    - 利用新的控制器引入第三方的工具类，通过ajax实现异步上传。
  - 验证码
    - 利用第三方工具类来生成随机的字符串图片，注册页面通过ajax获取

#### 2.登陆功能

- **功能点分析**
  - 传递参数
- **代码流程**
  - 传递参数
  - 验证参数是否合法
  - 配置SQL语句查询用户
  - 判断是否设置`session`
  - 返回执行结果是否跳转
- **功能实现**
  - 传递参数
    - 传递参数利用`request`或者是方法中配置形参
  - 验证参数是否合法
    - 可以配置一个工具类，专门检验和防范安全漏洞
  - 配置SQL语句
    - 需要参考一下自己是利用SQL工具类还是Mybatis根据实际情况配置。
  - 判断是否设置session
    - 如果查询存在的话，需要在全局配置session保存登陆状态，同时设置过期时间。
  - 返回执行结果判断是否跳转
    - 登陆成功可以跳转的首页(redirect/请求转发)

#### 3.退出功能

- **功能分析**
  - 点击后删除当前的session
- 功**能实现**
  - 比较简单。如果是利用`request.getSession()`的直接调用`remove(...)`方法

#### 4.修改密码

- **功能分析**
  - 传参(新密码/旧密码/验证码)
  - 
- **功能实现**
  - 传参
    - 利用系统自带方法
  - 判断参数合法性
    - 自定义工具类
  - 判断是否存在用户(一般来说都是存在的，因为只有登陆状态才允许修改密码/但是也有特殊情况，例如找回密码的功能，里面也涉及到修改)
    - 区别开是登陆后的还是登陆前(可以设计一个方法获取当前用户)
  - 配置SQL语句修改用户密码
    - 根据自己的环境来配置
  - 返回执行结果。

#### 5.文件上传

- **功能分析**
  - 传参(文件)
  - 配置文件参数(保存位置/保存名字/保存后缀)

- **代码流程**
  - 获取传递的文件
  - 判断文件后缀是否合法
  - 设置文件保存的位置和名字、后缀
  - 保存文件
  - 返回执行结果
- **功能实现**
  - 获取传递文件
    - 工具类
    - 判断参数合法性(后缀名合法性)、文件大小
    - 保存文件返回执行结果

## 0x04 前端设计

### 4.1 功能分析

#### 1.公共功能

##### 1.1 首页

- **功能描述**
  - 展示所有的发布可现实的帖子
- **功能分析**
  - 在一个页面显示所有用户发布标记为可以显示的帖子，通过SQL注入查询所有帖子表，将结果写入到model中，通过jsp语法循环输入
- **功能实现**
  - 利用sql语句
  - 判断sql查找结果，如果有写入到model中
  - 通过jsp语法进行输出

##### 1.2 论坛中心

- **功能描述**
  - 显示所有的模块和帖子，能够根据搜索和点击不同的模块显示不同的内容
- **功能分析**
  - 通过不同的参数请求该方法的时候返回不同的结果，利用帖子名称搜索的时候返回
- **功能实现**
  - 利用sql语句
  - 判断sql查找结果，如果有写入到model中
  - 通过jsp语法进行输出

##### 1.3 帖子详细

- **功能描述**
  - 显示帖子的详细信息，包括显示详细的评论，页面中提供其它的功能
- **功能分析**
  - 通过sql语句查找指定的帖子(id)以及查找关于该帖子的详细评论和点赞数量，然后返回显示在页面中
- **功能实现**
  - 利用sql语句通过限制id进行查找
  - 判断sql查找结果，如果有写入到model中
  - 显示到页面指定位置，根据页面的排版实现不同的功能。

#### 2.个人功能

##### 2.1 注册

##### 2.2 登陆

##### 2.3 个人信息

##### 2.4 我的帖子

##### 2.5 发布和修改帖子





