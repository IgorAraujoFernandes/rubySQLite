require "sqlite3"

db = SQLite3::Database.new("./db/linktree.db")

# def create_database(db)
#   db.execute <<-SQL
#       CREATE TABLE IF NOT EXISTS users (
#           id INTEGER PRIMARY KEY AUTOINCREMENT,
#           name TEXT NOT NULL,
#           username TEXT NOT NULL,
#           password TEXT,
#           link TEXT,
#           created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
#       );
#       SQL
#   puts "Users table created successfully!"
# end

# create_database db


def insert_users(db) #Função para criação de usuário
  
  #Input do usuário para nome e senha
  puts "Digite seu nome\n"
  name_login = gets.chomp
  puts "Digite sua senha\n"
  password_login = gets.chomp

  #Pega o ID para criação do username
  id = db.execute("SELECT id FROM users ORDER BY id DESC LIMIT 1").flatten.first
  idINT = id.to_i

  #Inserção do usuário no banco e criação do username
  db.transaction do  
  db.execute("INSERT INTO users (name,username, password) VALUES (?, ?, ?)", [name_login, "#{name_login}.#{idINT}", password_login])
  confirmacao = db.execute("SELECT * FROM users WHERE name = ? and password = ?", [name_login, password_login])
  puts confirmacao
  end
    
  
end 
insert_users db


db.close
