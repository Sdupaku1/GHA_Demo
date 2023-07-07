FROM openjdk:8

COPY src/samplecode.java .

EXPOSE 8080

RUN javac -classpath src samplecode.java

CMD java -classpath src samplecode
