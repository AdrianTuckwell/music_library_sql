# get the SQL runner file
require_relative( '../db/sql_runner' )

class Artist

  attr_reader :id, :name 

  def initialize (options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *"
    # returns what has just been added to database
    artist = SqlRunner.run(sql).first
    # return comes back with the artist id from the database
    @id = artist['id']
  end

  def albums
    # Pass in SQL query, link between tables is artist_id to this particular instance id
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    # return from SqlRunner is a postgrSQL array
    albums = SqlRunner.run(sql)
    # run albums hash through block going over album and creating a new album object for each album and return them as an array of albums in result
    result = albums.map{ |album| Album.new(album)}
    return result
  end
end
