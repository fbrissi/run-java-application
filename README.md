# run-java-application
Executar aplicações Java a partir de um nexus ou outro repositório.

**Exemplo:**
>
`docker run -d -e JAVA_OPTS="-Xms3g -Xmx3g" --name run-java-application -it fbrissi/run-java-application:centos-jdk-9
-ju=http://nexus.../applications.jar`

### Argumentos:
 - -ju ou --jar_url: link do jar a ser executado no container
 
**Para JVM**
 - -e JAVA_OPTS
