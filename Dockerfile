FROM maven:3.8.4-openjdk-17-slim

WORKDIR /app

COPY FoodieExpress/mvnw .
COPY FoodieExpress/.mvn .mvn
COPY FoodieExpress/pom.xml .
COPY FoodieExpress/src ./src

RUN mvn clean package -DskipTests
RUN ls -l target/

RUN chmod +x mvnw

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app/FoodieExpress/target/Online-Food-Delivery-0.0.1-SNAPSHOT.jar"]
