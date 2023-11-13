def test_shorten(client):
    response = client.get("/")
    assert b"Shorten" in response.data


def test_home_response(client):
    response = client.get("/")
    assert response.status_code == 200
