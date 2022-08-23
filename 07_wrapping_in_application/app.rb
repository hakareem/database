require_relative 'lib/database_connection'
require_relative "lib/artist_repository.rb"
require_relative "lib/album_repository.rb"

class Application

  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    @io.puts "Welcome to the music library manager!"
    @io.puts "What would you like to do?"
    @io.puts "1 - List all albums"
    @io.puts "2 - List all artists"
    @io.puts "Enter your choice: 1/2"
    selection = @io.gets.chomp

    if selection.to_i == 1
      @io.puts "Here is the list of albums:"
      @album_repository.all.each do |album|
      p "Title: #{album.title} - Release Year: #{album.release_year}"
    end
  elsif selection.to_i == 2
       @io.puts "Here is the list of artists:"
        @artist_repository.all.each do |artist|
        p "#{artist.id} - Artist Name: #{artist.name} - Genre: #{artist.genre}"
      end
  else 
    while true do
    @io.puts "Please enter a vlaid input!"
    @io.puts "What would you like to do?"
    @io.puts "1 - List all albums"
    @io.puts "2 - List all artists"
    @io.puts "Enter your choice: 1/2"
    selection = @io.gets.chomp
    break if selection.to_i == 1 || selection.to_i == 2
    end
  end
end
end

  if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
  end
