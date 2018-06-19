import sys

from airflow import models, settings
from airflow.contrib.auth.backends.password_auth import PasswordUser, generate_password_hash


if __name__ == '__main__':
    email, password = sys.argv[1:]
    user = PasswordUser(models.User())
    user.username = email
    user.email = email
    user._password = generate_password_hash(password, 12).decode()
    session = settings.Session()
    session.add(user)
    session.commit()
    session.close()
