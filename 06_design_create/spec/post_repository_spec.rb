require "post_repository"

RSpec.describe PostRepository do

def reset_post_table
seed_sql = File.read('spec/seeds_post.sql')
connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_db' })
connection.exec(seed_sql)
end

before(:each) do
reset_post_table
end

 it "returns list of posts" do
  repo = PostRepository.new
  posts = repo.all
  expect(posts.length).to eq 2 # 2
  expect(posts.first.title).to eq "Fly" 
  expect(posts.first.content).to eq "going there" 
  expect(posts.first.account_id).to eq "1" 
 end

  it "creates a new post record" do
  repo = PostRepository.new
  post = Post.new
  post.title = "Lixies"
  post.content = "testing"
  post.account_id = "7"

  repo.create(post)
  posts = repo.all

  added_post = posts.last
  expect(added_post.title).to eq("Lixies")  # Lixies
  expect(added_post.content).to eq("testing") 
  expect(added_post.account_id).to eq("7") 
 end 

  it "deletes an artist from the list" do
   repo = PostRepository.new
   the_post = repo.find(1)

   repo.delete(the_post.title)

   all_posts = repo.all
   expect(all_posts.length).to eq(1) # 1
   expect(all_posts.first.title).to eq("Slow") 
 end

 it "updates an artist information" do
   repo = PostRepository.new

   post = repo.find(1)

   post.content = "Jakie@gmail.com"
   post.title = "Jakie"

   repo.update(post)
   new_post = repo.find(1)

   expect(new_post.content).to eq("going there")  
   expect(new_post.title).to eq("Fly") 
 end
end