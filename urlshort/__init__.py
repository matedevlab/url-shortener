from flask import Flask
from .config import SECRET_KEY


def create_app(test_config=None):
    app = Flask(__name__)
    app.secret_key = SECRET_KEY

    from . import urlshort

    app.register_blueprint(urlshort.bp)

    return app
