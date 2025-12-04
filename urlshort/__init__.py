from flask import Flask
from . import config


def create_app(test_config=None):
    app = Flask(__name__, instance_relative_config=True)
    # Load defaults from the package config module (uppercase keys will be loaded)
    app.config.from_object(config)
    # Allow instance/config.py to override settings (optional, silent if missing)
    app.config.from_pyfile("config.py", silent=True)

    if test_config is not None:
        app.config.update(test_config)

    return app
