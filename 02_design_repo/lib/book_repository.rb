require_relative "./book.rb"

class BookRepository

 def all
  sql = 'SELECT id,title, author_name FROM books;'
  result_set = DatabaseConnection.exec_params(sql, [])

  all_books = []
  result_set.each do |record|
   books = Book.new
   books.id = record["id"]
   books.title = record["title"]
   books.author_name = record["author_name"]

   all_books << books
   end
   return all_books
 end
end