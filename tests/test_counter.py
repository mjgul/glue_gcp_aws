import unittest
from unittest.mock import MagicMock, patch
import sys
import os

# Add the api directory to the path so we can import main
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../app/api')))

from main import main

class TestCounter(unittest.TestCase):
    @patch('main.boto3')
    @patch('main.secretmanager')
    def test_main(self, mock_secretmanager, mock_boto3):
        # Mock request
        request = MagicMock()
        request.method = 'GET'
        
        # Call the function
        response = main(request)
        
        # Check response
        self.assertEqual(response[1], 200)
        self.assertIn('count', response[0])

if __name__ == '__main__':
    unittest.main()
