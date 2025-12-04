import os


# Default secret key for the application. In production this can be
# overridden by setting the SECRET_KEY environment variable.
SECRET_KEY = os.environ.get("SECRET_KEY", "dev")
