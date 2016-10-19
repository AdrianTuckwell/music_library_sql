# get the SQL runner file
require_relative('../db/sql_runner')

class Album

  attr_reader :id, :name, :artist_id

  def initialize (options)
    @id = options['id'].to_i
    @name = options['name']
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums (name, artist_id) VALUES ('#{@name}', #{@artist_id}) RETURNING *"
    # returns what has just been added to database
    album = SqlRunner.run(sql).first
    # return comes back with the album id from the database
    @id = album['id']
  end

  def artist
    # Pass in SQL query, link between tables is album_id to id
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    # return from SqlRunner is a postgreSQL array
    artists = SqlRunner.run(sql)
    # run artists hash with block going over artists and creating a new artist object for each artist and return them as an array of artists in result
    result = artists.map{ |artist| Artist.new(artist)}
    return result
  end
end