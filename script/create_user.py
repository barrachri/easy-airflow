from airflow import models, settings
from airflow.contrib.auth.backends.password_auth import PasswordUser, generate_password_hash


user = PasswordUser(models.User())
user.username = 'YourEmail'
user.email = 'YourEmail'
user._password = generate_password_hash('YourPassWord', 12).decode()
session = settings.Session()
session.add(user)
session.commit()
session.close()
