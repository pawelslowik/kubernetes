FROM openjdk:11
COPY @project.build.finalName@.@project.packaging@ /notes-service/
WORKDIR /notes-service/
CMD ["java", "-jar", "@project.build.finalName@.@project.packaging@" ]