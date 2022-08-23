require_relative 'lib/database_connection'
require_relative "lib/account_repository.rb"
require_relative "lib/post_repository.rb"

class Application

  def initialize(database_name, io, post_repository, account_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @post_repository = post_repository
    @account_repository = account_repository
  end

  def run
    @io.puts "Welcome to the social accounts manager!"
    @io.puts "What would you like to do?"
    @io.puts "1 - List all accounts"
    @io.puts "2 - List all posts"
    @io.puts "Enter your choice: 1/2"
    selection = @io.gets.chomp

    if selection.to_i == 1
      @io.puts "Here is the list of posts:"
       @post_repository.all.each do |post|
     p "Title: #{post.title} - Content: #{post.content} - ID: #{post.account_id}"
   end
  elsif selection.to_i == 2
       @io.puts "Here is the list of accounts:"
        @account_repository.all.each do |accounts|
          p "Username: #{accounts.username} - Email: #{accounts.email_address}"
      end
  else 
    while true do
    @io.puts "Please enter a vlaid input!"
    @io.puts "What would you like to do?"
    @io.puts "1 - List all posts"
    @io.puts "2 - List all accounts"
    @io.puts "Enter your choice: 1/2"
    selection = @io.gets.chomp
    break if selection.to_i == 1 || selection.to_i == 2
    end
  end
end
end

  if __FILE__ == $0
  app = Application.new(
    'social_network_db',
    Kernel,
    PostRepository.new,
    AccountRepository.new
  )
  app.run
  end
