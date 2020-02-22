# Uav Medical Challenge 2020
Project for UAV Medical Rescue Challenge Australia 2020

Ok, guys some more info for you ;)

### Git

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
`pytest -k "test_" && flake8`

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
