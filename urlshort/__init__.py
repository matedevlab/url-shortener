from flask import Flask

from . import config


def create_app(test_config=None):
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_object(config)

    if test_config is not None:
        app.config.update(test_config)

    from . import urlshort

    app.register_blueprint(urlshort.bp)

    return app


app = create_app()
