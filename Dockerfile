FROM java:8
ADD ruoyi-admin.jar app.jar
EXPOSE 9000
ENTRYPOINT ["java", "-jar", "app.jar"]
