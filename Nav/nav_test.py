from pymavlink import mavutil
import unittest
from utils.ardupilot_sitl_docker.sitl import SitlDockerHelper
from Nav.nav import QuadroPlane


class NavigationModuleTests(unittest.TestCase):
    def setUp(self):
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
    unittest.main()