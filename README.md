# Uav Medical Challenge 2020
[![Build Status](https://travis-ci.org/Akademicki-Klub-Lotniczy/Uav-Medical-Challenge-2020.svg?branch=master)](https://travis-ci.org/Akademicki-Klub-Lotniczy/Uav-Medical-Challenge-2020)

### Setup

#### Cloning

Since we're using git submodules, you should clone the repo like this:

`git clone --recurse-submodules git@github.com:Akademicki-Klub-Lotniczy/Uav-Medical-Challenge-2020.git`

#### Installation

What you'll need:

* Arch Linux
* Docker installed
* Python3 installed


Create a virtual environment

`virtualenv venv`

Activate it

`. venv/bin/activate`

Install the requirements

`pip install -re requimrements.txt`

Start and enable docker

`sudo systemctl start docker && sudo systemctl enable docker`

Do a test run of the SITL helper (Ardupilot simulator)

`cd utils/ardupilot_sitl_docker`

`./sitl.py -v ArduPlane`

The image should be downloaded and you should see the MavProxy
command prompt (press enter a few times if unsure).

If you got the SITL to work, you're probably good to go!


### Git workflow
Procedure will be quite easy:
- create branch for yourself only from pure origin master so:
    * `git checkout master`
    * `git pull --rebase origin/master`
    * `git checkout -b your_name/your_task`
- commits:
    * `git pull --rebase origin/master`
    * `git add <your_changes>`
    * `git commit -m "Clearly describtion of your changes"`
    * `git push origin your_branch`
    
There will be ban for commiting strict to the master ;)

### Tests/TDD
I would like to run code in Test Driven Development way. Your job is to at first write tests for your changes, check it with 
command below and then write your code.
Code without tests will not be merged!!!
Our CI agent (Travis) runs tests with "test_" in the name of .py file
So to check if your changes pass Travis run:
`python -m pytest -k "test_" && flake8`

### Merging
If you think that your changes are ready to merge, run tests ;) and create a pull request.
Code will be merged after review from two different persons.


## Transmission

`gstreamer` + camera -> `.ts` file

(find the right muxrate)

`.ts` file -> `gnuradio`


## Mission Control GUI

Kivy/other app for displaying the shelter pictures and managing other flight-related info/actions

# NO JSONs PLS - too slow

## Robot commands protocol
* Data via ethernet + some sort of robot simulation (just printing 'driving forward' etc)

## Drone commands protocol
* Progressive png - for sending shelter pics


### Zadania dla nowych
* OpenCV/Yolo/ML building recognition
* Mapowanie terenu
* Tracker
* Protokół do słania danych ramkami (`struct`, `udp`)
* Kivy - GUI tool do drona
* Łazik, kamera, gimbal
* Analiza kodu SAE
* MavLink
