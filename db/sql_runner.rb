# PostreSQL gem
require('pg')


class SqlRunner

  # Class Method - defined by 'self.'
  def self.run ( sql )
    begin
      db = PG.connect({dbname: 'music_library', host:'localhost'})
      result = db.exec( sql )
    ensure
      db.close
    end
    return result
  end
end

  # Class methods are methods that are called on a class and instance methods are methods that are called on an instance of a class.
