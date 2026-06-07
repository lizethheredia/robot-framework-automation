import sqlite3
import json
import os


def setup_test_database(data_file="data/db_data.json", db_path="results/test_db.sqlite"):
    """Create and seed SQLite database from JSON data file."""
    os.makedirs(os.path.dirname(db_path), exist_ok=True)

    with open(data_file) as f:
        data = json.load(f)

    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()

    cursor.execute(f"""
        CREATE TABLE IF NOT EXISTS {data['table']} (
            id    INTEGER PRIMARY KEY,
            name  TEXT NOT NULL,
            email TEXT NOT NULL,
            role  TEXT NOT NULL
        )
    """)

    cursor.execute(f"DELETE FROM {data['table']}")

    for user in data["users"]:
        cursor.execute(
            f"INSERT INTO {data['table']} (id, name, email, role) VALUES (?, ?, ?, ?)",
            (user["id"], user["name"], user["email"], user["role"])
        )

    conn.commit()
    conn.close()
    return db_path


def teardown_test_database(db_path="results/test_db.sqlite"):
    """Remove the test database file."""
    if os.path.exists(db_path):
        os.remove(db_path)
