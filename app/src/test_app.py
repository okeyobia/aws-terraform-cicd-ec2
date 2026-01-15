import pytest
from app import app

@pytest.fixture
def client():
    """Create a test client for the Flask application."""
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_index_route(client):
    """Test that the index route returns the expected message."""
    response = client.get('/')
    assert response.status_code == 200
    assert b'CodeBuild Pipeline Demo Application' in response.data

def test_index_route_content_type(client):
    """Test that the index route returns HTML content."""
    response = client.get('/')
    assert response.status_code == 200
    assert response.content_type == 'text/html; charset=utf-8'
