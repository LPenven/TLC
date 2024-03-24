### build :
> sudo docker build -t trollminator -f sampleApp.dockerfile .

### run :
> sudo docker run -d --name trollminator -p 8080:8080 trollminator

### test-run :
>  sudo docker run -it --name trollminator -p 8080:8080 trollminator sh

### stop :
> sudo docker stop trollminator && sudo docker remove trollminator
