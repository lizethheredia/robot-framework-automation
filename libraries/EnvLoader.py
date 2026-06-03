import os
from dotenv import load_dotenv

def load_env():
    load_dotenv()

def get_env_variable(name):
    value = os.getenv(name)
    if not value:
        raise ValueError(f"Environment variable '{name}' not found")
    return value