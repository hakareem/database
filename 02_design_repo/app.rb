require_relative 'lib/database_connection'

DatabaseConnection.connect('book_store_test')

sql = 'SELECT id, title, author_name FROM books;'
result = DatabaseConnection.exec_params(sql, [])

result.each do |book|
  p "#{book["id"]} - #{book["title"]} - #{book["author_name"]}"
end