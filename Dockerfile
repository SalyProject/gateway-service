FROM maven:3.6.3-jdk-11 AS build

# copy the project files
COPY ./pom.xml ./pom.xml

# build all dependencies for offline use
RUN mvn dependency:go-offline -B

# copy your other files
COPY ./src ./src

# build for release
RUN mvn package

FROM amazoncorretto:11

# set deployment directory
WORKDIR /gateway-service

# copy over the built artifact from the maven image
COPY --from=build target/gateway-service-*.jar ./gateway-service.jar

# set the startup command to run your binary
CMD ["java", "-jar", "./gateway-service.jar"]






