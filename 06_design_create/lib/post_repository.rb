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

  # adds a new post record using sql query
  def create(post)
    sql = 'INSERT INTO posts (title, content, account_id) VALUES($1,$2, $3)';
    DatabaseConnection.exec_params(sql, [post.title, post.content, post.account_id ])
    return 
  end

end