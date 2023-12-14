#Hi, this is my 611 Data Science Project#

Note: I am using a M1 Mac, so it might be necesary to fiddle with the docker container.

##Background on Docker## 
Docker is a containerization engine. It is essentially a light weight virtual machine that allows for reproducible deployment. Link to Docker documentation: [link]{https://docs.docker.com/)

##Project Overview##

This project uses a dataset from kaggle.com that includes NFL offensive statistics. The dataset is organized such that each row is comprised of a unique player's offensive statistics for a specific NFL game. This project focuses on identifying trends in these NFL offensive statistics specifically in year 2022. I am interested in how specific variables such as passing yards and pass completions differ among the NFL teams and players. I am also interested to see if there is a linear relationship between these variables and other factors such as the total number of passing touchdowns thrown by quarterbacks. I will perform analysis on this dataset and make some figures to display these trends. 

##Building and Starting Docker##

First, in your terminal, you must first connect to the local host, establishing a tunnel to port 8992. (ex: I first type this into my terminal: 'ssh coral23@bios611-09.bios.unc.edu -L 8992:localhost:8992')
)

Then, build and run the docker container by running the go.sh script in my Github repository. (I type bash go.sh into my termianl)

Or run the script below to build and run the docker container: 
'#!/bin/bash
docker build . --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) -t 611
docker run -v $(pwd):/home/rstudio/work -p 8992:8787 -it 611'

(The Dockerfile can be found on my Git repository)

##Using Make to Build the Project Report##
Now that Docker has been built and run, Make can be used to build the artifacts and final project report. 
Using Make to build the report: 

**When invoking the Makefile, made sure to first cd into the work directory from inside the container! type into the terminal: 
cd ~/work 

First, type "make clean" in the terminal to clear away everything except the source code and data. 
Next, type "make "artifact name"" into the terminal to create any of the individual respective artifacts.
Example type "make pass_touchdowns.png" to create png disaplyign passing touchdowns by NFL team. 
To see the final project, type "make report.html" in the terminal to build and view the final project report. 


Note: All the necessary components for the project are directly inside the work directory. The BIOS611 folder contains homework assignments and other class components not related to the project. 