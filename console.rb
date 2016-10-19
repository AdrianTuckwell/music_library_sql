require_relative('./models/album')
require_relative('./models/artist')
require ( 'pry-byebug')

# create artist and save
oasis = Artist.new( { 'name' => "Oasis" } )
oasis.save()

# create album and save
album1 = Album.new( { 'name' => "Definitley Maybe", 'artist_id' => oasis.id } )
album1.save()




binding.pry
nil



