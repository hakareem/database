# Account Model and Repository Classes Design Recipe

1. Design and create the Table

```
# EXAMPLE

Table: accounts

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

TRUNCATE TABLE accounts RESTART IDENTITY; 

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO accounts (name, genre) VALUES ('David', 'April 2022');
INSERT INTO accounts (name, genre) VALUES ('Anna', 'May 2022');
Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 your*database_name < seeds*{table_name}.sql 3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.
```
```sql
-- Truncate the table - this is so the table is emptied between each test run

TRUNCATE TABLE accounts RESTART IDENTITY; 


INSERT INTO accounts (username, email_address) VALUES ('wilder', 'wilder8@gmail.com');
INSERT INTO accounts (username, email_address) VALUES ('tyson', 'tyson10@gmail.com');

```

```RUBY
# EXAMPLE

class Account

end


class AccountRepository

end
```

4. Implement the Model class

```

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```

```RUBY

class Account
attr_accessor :id, :username, :email_address

end

```

5. Define the Repository Class interface

```

   Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

  Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```

```RUBY
# EXAMPLE

# Table name: accounts

class AccountRepository

# Selecting all records
def all 
# Executes the SQL query: # SELECT id, name, genre FROM accounts; # Returns an array of Account objects.
end

# Gets a single record by its ID
def find(id) 
# Executes the SQL query: # SELECT id, name, genre FROM accounts WHERE id = $1;
# Returns a single Account object.
end

# Add more methods below for each operation you'd like to implement.
def create(Account)

end

# Updates existing records
def update(Account)

end

# Deletes accounts records from list
def delete(Account)

end
```

6. Write Test Examples

```
   Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

   These examples will later be encoded as RSpec tests.

```

```RUBY
# EXAMPLES

 # get list of accounts
  repo = AccountRepository.new
  accounts = repo.all
  accounts.length 2 # 2
  accounts.first.username # "wilder" 
  accounts.first.email_address #"wilder8@gmail.com" 

 # returns a single account
  repo = AccountRepository.new
  account = repo.find(1)
  account.username # "wilder" 
  account.email_address # "wilder8@gmail.com" 

 # creates and adding a new account record
  repo = AccountRepository.new
  account = Account.new
  account.username = "Lop"
  account.email_address = "Lixies@gamail.com"

  repo.create(account)
  accounts = repo.all

  added_account = accounts.last
  added_account.email_address # "Lixies@gamail.com"
  added_account.username # "Lop"

  # deletes an account from the list
   repo = AccountRepository.new
   the_account = repo.find(1)

   repo.delete(the_account.username)

   all_accounts = repo.all
   all_accounts.length # 1
   all_accounts.first.username # "tyson"

 # "updates an account information" 
   repo = AccountRepository.new

   account = repo.find(1)

   account.email_address = "Jakie@gmail.com"
   account.username = "Jakie"

   repo.update(account)
   new_account = repo.find(1)

   new_account.email_address # "wilder8@gmail.com"
   new_account.username# "wilder"


```

7. Reload the SQL seeds before each test run

```
   Running the SQL code present in the seed file will empty the table and re-insert the seed data.

   This is so you get a fresh table contents every time you run the test suite.
```

```RUBY
# EXAMPLE

def reset_account_table
seed_sql = File.read('spec/seeds_account.sql')
connection = PG.connect({ host: '127.0.0.1', dbname: 'social_db_test' })
connection.exec(seed_sql)
end

before(:each) do
reset_account_table
end

```

8. Test-drive and implement the Repository class behaviour

```

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

```
