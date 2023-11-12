from flask import Flask
import config


def create_app(test_config=None):
    app = Flask(__name__)
    app.secret_key = config.SECRET_KEY

    from . import urlshort

    app.register_blueprint(urlshort.bp)

    return app


if __name__ == "__main__":
    app = create_app()
    app.run(port=5000, debug=True)
