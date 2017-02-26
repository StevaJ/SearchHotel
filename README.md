==> Steps to run the application:
-----------------------------------
Note: The application it is not running I were not able to run it because of some errors
	  and it requires time to fix it, so I focused on the concept of the application.
	  
	example of runtime error: 'Error: Could not find or load main class org.apache.catalina.startup.Bootstrap'


This application was builded using maven with dynamic web application, as shown in the steps bellow:
1 . Download spring STS tool.
https://spring.io/tools

2. Build a maven application following the steps:
package Explorer -> New -> New Project -> (keep the ddefualt option) maven-archetype-quickstart
-> Next -> enter a Group id and Artifact id -> Finish

3. Then add controller and java classes to the created project.

4. Add the required dependencies inside pom.xml file as shown below.

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>com.example</groupId>
  <artifactId>jsontest</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <packaging>war</packaging>

  <name>jsontest</name>
  <url>http://maven.apache.org</url>

  <properties>
		<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
		<project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
		<java.version>1.8</java.version>

		<!-- Web -->
		<jsp.version>2.2</jsp.version>
		<jstl.version>1.2</jstl.version>
		<servlet.version>3.1.0</servlet.version>
		
		<!-- Logging -->
		<logback.version>1.0.13</logback.version>
		<slf4j.version>1.7.5</slf4j.version>
	</properties>

	<dependencies>
		<!-- https://mvnrepository.com/artifact/org.springframework/spring-context -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-webmvc</artifactId>
			<version>4.3.6.RELEASE</version>
		</dependency>

		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>jstl</artifactId>
			<version>${jstl.version}</version>
		</dependency>
		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>javax.servlet-api</artifactId>
			<version>${servlet.version}</version>
			<scope>provided</scope>
		</dependency>
		<dependency>
			<groupId>javax.servlet.jsp</groupId>
			<artifactId>jsp-api</artifactId>
			<version>${jsp.version}</version>
			<scope>provided</scope>
		</dependency>
		
		<!-- Logging with SLF4J & LogBack -->
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>slf4j-api</artifactId>
			<version>${slf4j.version}</version>
			<scope>compile</scope>
		</dependency>
		<dependency>
			<groupId>ch.qos.logback</groupId>
			<artifactId>logback-classic</artifactId>
			<version>${logback.version}</version>
			<scope>runtime</scope>
		</dependency>

	</dependencies>
	
	<build>
		<finalName>demo</finalName>
		<plugins>
			<plugin>
				<artifactId>maven-war-plugin</artifactId>
				<version>2.1.1</version>
				<configuration>
					<outputDirectory>webapps</outputDirectory>
					<warName>demo</warName>
					<failOnMissingWebXml>false</failOnMissingWebXml>
				</configuration>
			</plugin>
		</plugins>
	</build>
	
</project>

5. 'WebAppInitializer' class was created to provide us with the web 
application features it workes like 'web.xml' file.

6. 'DemoApplication' contains a configuration details, it also conatins a bean 
to make sure that will add the pacakege "/WEB-INF/views/" to beganning of jsp
and "(".jsp")" ath the end of jsp name as shown in the code below.

@Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

7. 'WebAppInitializer' class is used to register and map the dispatcher servlet as shown 
in the code bellow.

		ServletRegistration.Dynamic dispatcher = container.addServlet("dispatcher", new DispatcherServlet(dispatcherServlet));
        dispatcher.setInitParameter("throwExceptionIfNoHandlerFound", "true");
        dispatcher.setLoadOnStartup(1);
        dispatcher.addMapping("/");
		
8. 'MainController' class contains the process(methods).
	- first method is (GET) is used to display or redirect
	  'hello.jsp' page.
	- second method is "findHotels" with type "POST" is 
	  used to call a json API.
	- open a connection by creating request and responce methods.
	'callWebService' request method.
	'callWebServiceCities' response method.
	
	
9. 'hello.jsp' its a dynamic web page wich contains a seaching hotel form
	and using a jquery to parse the json data.


	  


