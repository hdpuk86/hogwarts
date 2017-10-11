require_relative('../db/sql_runner.rb')

class House

  attr_accessor :name, :logo
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = options['logo']
  end

  def save()
    sql = 'INSERT INTO houses(name, logo) VALUES ($1, $2) RETURNING id;'
    values = [@name, @logo]
    house = SqlRunner.run(sql, "save_house", values)
    @id = house[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM houses;"
    values = []
    SqlRunner.run(sql, "delete_all_houses", values)
  end

  def self.all()
    sql = "SELECT * FROM houses;"
    values = []
    houses = SqlRunner.run(sql, "find_all_houses", values)
    return houses.map {|house|House.new(house)}
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1;"
    values =[id]
    house = SqlRunner.run(sql, "find_house", values).first()
    return House.new(house)
  end

end
