require_relative('../db/sql_runner')

class Student

attr_accessor :first_name, :last_name, :house, :age
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, house, age) VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@first_name, @last_name, @house, @age]
    student = SqlRunner.run(sql, "save_student", values)
    @id = student[0]['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1;"
    values = [id]
    student = SqlRunner.run(sql, "find_student", values).first()
    return Student.new(student)
  end

  def self.all()
    sql = "SELECT * FROM students;"
    values = []
    students = SqlRunner.run(sql, "all_students", values)
    return students.map {|student| Student.new(student)}
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    values = []
    SqlRunner.run(sql, "delete_all_students", values)
  end

  def house()
    sql = "SELECT houses.* FROM houses WHERE id = $1;"
    values = [@house]
    house = SqlRunner.run(sql, "find_my_house", values).first()
    return House.new(house)
  end

end
