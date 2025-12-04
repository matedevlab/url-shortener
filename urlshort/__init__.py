from flask import Flask
from .config import SECRET_KEY


def create_app(test_config=None):
    app = Flask(__name__)
    app.config.from_mapping(SECRET_KEY=SECRET_KEY)

    if test_config is not None:
        app.config.update(test_config)

    from . import urlshort

    app.register_blueprint(urlshort.bp)

    return app


app = create_app()
