require "sqlite3"

db = SQLite3::Database.new "linktree.db"

def create_database(db)
  db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          username TEXT NOT NULL,
          password TEXT,
          link TEXT,
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    
      );
      SQL

  puts "Users table created successfully!"
end

create_database db


def insert_users(db)
  db.execute("INSERT INTO users (name, username) VALUES (?, ?)", ["kelly", "Kellyzinha"])
  puts("Dados inseridos")
end

insert_users db


query = "SELECT name FROM users WHERE id = 1;"
name = db.get_first_value query
puts name

db.close
