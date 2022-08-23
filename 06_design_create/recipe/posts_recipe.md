# Post Model and Repository Classes Design Recipe

1. Design and create the Table

```
# EXAMPLE

Table: posts

Columns:
id | name | genre 2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds\_{table_name}.sql)

-- Write your SQL seed here.

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE posts RESTART IDENTITY; 

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO posts (name, genre) VALUES ('David', 'April 2022');
INSERT INTO posts (name, genre) VALUES ('Anna', 'May 2022');
Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 your*database_name < seeds*{table_name}.sql 3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.
```
```sql
-- Truncate the table - this is so the table is emptied between each test run

TRUNCATE TABLE accounts RESTART IDENTITY; 
TRUNCATE TABLE posts RESTART IDENTITY; 


INSERT INTO accounts (username, email_address) VALUES ('tyson', 'tyson10@gmail.com');
INSERT INTO posts (title, content, account_id) VALUES ('Fly','going there',1);
INSERT INTO posts (title, content, account_id) VALUES ('Slow', 'running here',2);

```

```RUBY
# EXAMPLE

class Post

end


class PostRepository

end
```

4. Implement the Model class

```

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```

```RUBY

class Post
attr_accessor :title, :content, :account_id

end
```

5. Define the Repository Class interface

```

   Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

  Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```

```RUBY
# EXAMPLE

# Table name: posts

# Repository class

# (in lib/Post_repository.rb)

class PostRepository

# Selecting all records
 def all
 end

 # adds a new post record using sql query
 def create(post)
 end

# Updates existing records
def update(Post)

end

# Deletes posts records from list
def delete(Post)

end
```

6. Write Test Examples

```
   Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

   These examples will later be encoded as RSpec tests.

```

```RUBY
# EXAMPLES

 # returns list of posts
  repo = PostRepository.new
  posts = repo.all
  posts.length # 2
  posts.first.title # "Fly" 
  posts.first.content # "going there" 
  posts.first.account_id # "1" 
 

  # creates a new post record
  repo = PostRepository.new
  post = Post.new
  post.title = "Lixies"
  post.content = "1995"
  post.account_id = "7"

  repo.create(post)
  posts = repo.all

  added_post = posts.last
  added_post.title # Lixies
  added_post.content # "1995"
  added_post.account_id # "7" 

  # deletes a post from the list 
   repo = PostRepository.new
   the_post = repo.find(1)

   repo.delete(the_post.title)

   all_posts = repo.all
   all_posts.length # 1
   all_posts.first.title # "Slow" 

 # updates an post information
   repo = PostRepository.new

   post = repo.find(1)

   post.content = "apple pie"
   post.title = "Jakie"

   repo.update(post)
   new_post = repo.find(1)

   new_post.content # going there
   new_post.title # Fly
```

7. Reload the SQL seeds before each test run

```
   Running the SQL code present in the seed file will empty the table and re-insert the seed data.

   This is so you get a fresh table contents every time you run the test suite.
```

```RUBY
# EXAMPLE

def reset_post_table
seed_sql = File.read('spec/seeds_post.sql')
connection = PG.connect({ host: '127.0.0.1', dbname: 'social_db_test' })
connection.exec(seed_sql)
end

before(:each) do
reset_post_table
end



```

8. Test-drive and implement the Repository class behaviour

```

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

```
