import os
import sys

import pytest

test_root = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
if test_root not in sys.path:
    sys.path.insert(0, test_root)

from urlshort import create_app


@pytest.fixture
def app():
    app = create_app({"TESTING": True})
    yield app


@pytest.fixture
def client(app):
    return app.test_client()
