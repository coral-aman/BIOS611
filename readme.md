"Hi, this is my 611 Data Science Project. More to come."

This project focuses on trends in NFL offensive statistics in 2022. 

First, build and run the Docker container by running the go.sh script in my GitHub repository
or run the script below: 

#!/bin/bash

docker build . --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) -t 611
docker run -v $(pwd):/home/rstudio/work -p 8992:8787 -it 611

When running the Makefile, made sure you cd into the work directory: 
cd ~/work 