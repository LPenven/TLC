FROM ubuntu:16.04 AS ubuntu

#install depdencies
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y maven && \
    apt-get install -f libpng16-16
    
RUN apt-get install -f libjasper1
RUN apt-get install -y -f libdc1394-22

# Copy file from disc 
COPY TPDockerSampleApp TPDockerSampleApp

# Install opencv
RUN cd TPDockerSampleApp && \
    mvn install:install-file -Dfile=./lib/opencv-3410.jar \
    -DgroupId=org.opencv  -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar

# Compile application
RUN mvn package -f TPDockerSampleApp

#expose port
EXPOSE 8080

# Run app when container starts
CMD java -Djava.library.path=TPDockerSampleApp/lib -jar TPDockerSampleApp/target/fatjar-0.0.1-SNAPSHOT.jar