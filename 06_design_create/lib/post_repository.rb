require_relative "./post.rb"

class PostRepository

 def all
  sql = 'SELECT title, content, account_id FROM posts;'
  result_set = DatabaseConnection.exec_params(sql, [])

  all_posts = []
  result_set.each do |record|
   posts = Post.new
   posts.title = record["title"]
   posts.content = record["content"]
   posts.account_id = record["account_id"]

   all_posts << posts
   end
   return all_posts
 end

  def find(id)
  sql = 'SELECT title, content FROM posts WHERE id = $1;'
  result = DatabaseConnection.exec_params(sql, [id])
  record = result[0]

  post = Post.new
  post.title = record["title"]
  post.content = record["content"]

  return post
 end

  # adds a new post record using sql query
  def create(post)
    sql = 'INSERT INTO posts (title, content, account_id) VALUES($1,$2, $3)';
    DatabaseConnection.exec_params(sql, [post.title, post.content, post.account_id ])
    return 
  end

   # deletes an post record using sql query
def delete(title)
  sql = 'DELETE FROM posts WHERE title = $1'
  DatabaseConnection.exec_params(sql, [title])
 return 
end

 # updates a record using query with updated info
 def update(post)
  sql = 'UPDATE posts SET title = $1, content = $2 WHERE id = $3;'
  DatabaseConnection.exec_params(sql, [post.title, post.content, post.account_id])
  return nil
 end

end