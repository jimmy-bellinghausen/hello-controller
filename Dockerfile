FROM openjdk:11-jdk as build
VOLUME /tmp
COPY . .
RUN ./gradlew clean build

FROM openjdk:11-jdk
WORKDIR /app
COPY --from=build build/libs/*.jar app.jar
ARG JAR_FILE
ENTRYPOINT ["java", "-jar", "app.jar"]
EXPOSE 8081

#docker build -t hello-controller .
#docker run -d -p8081:8081 --rm hello-controller 