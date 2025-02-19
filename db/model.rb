require "sqlite3"

db = SQLite3::Database.new "linktree.db"

def create_database
  db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          'name' TEXT NOT NULL,
          username TEXT NOT NULL,
          'password' TEXT NOT NULL,
          link TEXT NOT NULL,
          created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    
      );
      SQL

  db.close
end
