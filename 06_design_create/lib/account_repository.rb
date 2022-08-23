require_relative "./account.rb"

class AccountRepository

 def all
  sql = 'SELECT username, email_address FROM accounts;'
  result = DatabaseConnection.exec_params(sql, [])

  all_accounts = []
  result.each do |record|
   account = Account.new
   account.username = record["username"]
   account.email_address = record["email_address"]

   all_accounts << account
   end
   return all_accounts
 end


 def find(id)
  sql = 'SELECT username, email_address FROM accounts WHERE id = $1;'
  result = DatabaseConnection.exec_params(sql, [id])
  record = result[0]

  account = Account.new
  account.username = record["username"]
  account.email_address = record["email_address"]

  return account
 end


 # adds a new account record using sql query
  def create(account)
    sql = 'INSERT INTO accounts (username, email_address) VALUES($1,$2)';
    DatabaseConnection.exec_params(sql, [account.username, account.email_address])
    return 
  end

 # deletes an account record using sql query
def delete(username)
  sql = 'DELETE FROM accounts WHERE username = $1'
  DatabaseConnection.exec_params(sql, [username])
 return 
end

 # updates a record using query with updated info
 def update(account)
  sql = 'UPDATE accounts SET username = $1, email_address = $2 WHERE id = $3;'
  DatabaseConnection.exec_params(sql, [account.username, account.email_address, account.id])
  return nil
 end
end