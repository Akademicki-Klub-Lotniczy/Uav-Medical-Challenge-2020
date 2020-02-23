from pymavlink import mavutil
import unittest
from utils.ardupilot_sitl_docker.sitl import SitlDockerHelper

# A quick lesson on the importance of __init__.py:
# how will your code be imported to other places

from . import QuadroPlane
# Why does the line above work?
# Answer: because in the __init__.py file
# there is a statement `from .src import QuadroPlane`
# The __init__.py file is executed when a module is
# imported, it "defines" what the module contains.
# The from-import statement makes the QuadroPlane
# class avialable from inside the Nav module.

# Notice that you could also do
# from .src import QuadroPlane

# Which does exactly the same, module-wise.
# But when your code is used by someone
# who just wants to use the API you're 
# providing, the best practice is to
# import all the interfaces to the __init__.py
# file, so they can be used using `module.interface`
#                   (for example: `Nav.quadroplane`)

class NavigationModuleTests(unittest.TestCase):
    def setUp(self):
        b = QuadroPlane() # Can the object be created test
        self.runner = SitlDockerHelper('ArduPlane', run_in_background=True)
        self.runner.run()

    def tearDown(self):
        self.runner.stop()
    
    def test_sitl_connectivity(self):
        the_connection = mavutil.mavlink_connection('udpin:0.0.0.0:14550')
        result = the_connection.wait_heartbeat(timeout=10)
        
        assert result is not None

    def test_takeoff_fly_to_point_lant(self):
        plane = QuadroPlane()

        plane.takeoff();
        time.sleep(30);

        assert plane.altitude > 10

        plane.fly_to_point(point_lat, point_lon)
        plane.land()
        time.sleep(30)

        assert plane.altitude < 1


if __name__ == '__main__':
    # unittest.main()
    pass