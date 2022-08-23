require "account_repository"

RSpec.describe AccountRepository do

def reset_account_table
seed_sql = File.read('spec/seeds_account.sql')
connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_db' })
connection.exec(seed_sql)
end

before(:each) do
reset_account_table
end

 it "returns list of accounts" do
  repo = AccountRepository.new
  accounts = repo.all
  expect(accounts.length).to eq 2 # 2
  expect(accounts.first.username).to eq "wilder" 
  expect(accounts.first.email_address).to eq "wilder8@gmail.com" 
 end

 it "returns a single artist" do
  repo = AccountRepository.new
  artist = repo.find(1)
  expect(artist.username).to eq "wilder" 
  expect(artist.email_address).to eq "wilder8@gmail.com" 
 end

 it "creates a new artist record" do
  repo = AccountRepository.new
  account = Account.new
  account.username = "Lop"
  account.email_address = "Lixies@gamail.com"

  repo.create(account)
  accounts = repo.all

  added_account = accounts.last
  expect(added_account.email_address).to eq("Lixies@gamail.com")  
  expect(added_account.username).to eq("Lop") 
 end


 it "deletes an artist from the list" do
   repo = AccountRepository.new
   the_account = repo.find(1)

   repo.delete(the_account.username)

   all_accounts = repo.all
   expect(all_accounts.length).to eq(1) # 1
   expect(all_accounts.first.username).to eq("tyson") 
 end

 it "updates an artist information" do
   repo = AccountRepository.new

   account = repo.find(1)

   account.email_address = "Jakie@gmail.com"
   account.username = "Jakie"

   repo.update(account)
   new_account = repo.find(1)

   expect(new_account.email_address).to eq("wilder8@gmail.com")  
   expect(new_account.username).to eq("wilder") 
 end
end