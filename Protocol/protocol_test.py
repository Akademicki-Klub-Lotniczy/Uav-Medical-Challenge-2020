import Protocol
import unittest

class ProtocolModuleTests(unittest.TestCase):
    def test_v1_functionality(self):

        vehicle_id = 1
        lon = 16.1784483
        lat = 51.1826638
        action_id = 5

        data = (vehicle_id, lat, lon, action_id)
        packet = Protocol.encode(data)

        assert data == Protocol.decode(packet)