# Australia_AKL_2019
Project for UAV Medical Rescue Challenge Australia 2020

Ok, guys some more info for you ;)

At first - Git\
Procedure will be quite easy:
- create branch for yourself only from pure origin master so:
    * git checkout master
    * git pull --rebase origin/master
    * git checkout -b your_name/your_task
- commits:
    * git pull --rebase origin/master
    * git add <your_changes>
    * git commit -m "Clearly describtion of your changes"
    * git push origin your_branch
    
There will be ban for commiting strict to the master ;)

Second case - tests/TDD\
I would like to run code in Test Driven Development way. Your job is to at first write tests for your changes, check it with 
command below and then write your code.\
Code without tests will not be merged!!!\
Our CI agent (Travis) runs tests with "test_" in the name of .py file
So to check if your changes pass Travis run:\
pytest -k "test_" && flake8

Third case - merging\
If you think that your changes are ready to merge, run tests ;) and create a pull request.
Code will be merged after review from two different persons.

That's all for today ;)

Stay tuned :)