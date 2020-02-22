from pymavlink import mavutil
import unittest
from ..utils.ardupilot_sitl_docker.sitl import SitlDockerHelper



class SitlConnectionTests(unittest.TestCase):
    def setUp(self):
        self.runner = SitlDockerHelper('ArduPlane', run_in_background=True)
        self.runner.run()

    def tearDown(self):
        self.runner.stop()
    
    def test_sitl_connectivity(self):
        the_connection = mavutil.mavlink_connection('udpin:0.0.0.0:14550')
        result = the_connection.wait_heartbeat(timeout=10)
        
        assert result is not None
        
    
