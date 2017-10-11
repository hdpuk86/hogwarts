require_relative('../models/student')
require_relative('../models/house')

require 'pry-byebug'

Student.delete_all()
House.delete_all()

#House.....s
house1 = House.new({
  'name' => 'Hufflepuff',
  'logo' => '../public/images/badger.jpg'
})
house1.save()

house2 = House.new({
  'name' => 'Gryffindor',
  'logo' => '../public/images/lion.jpg'
  })
house2.save()

house3 = House.new({
  'name' => 'Slytherin',
  'logo' => '../public/images/snake.jpg'
  })
house3.save()

house4 = House.new({
  'name' => 'Ravenclaw',
  'logo' => '../public/images/raven.jpg'
  })
house4.save()


#Students.......
student1 = Student.new({
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'house' => house2.id,
  'age' => 11
  })
  student1.save()

student2 = Student.new({
  'first_name' => 'Hermione',
  'last_name' => 'Granger',
  'house' => house2.id,
  'age' => 11
  })
student2.save()


#
# house3 = House.new({
#   'name' => 'Ravenclaw'
#   'logo' => ''
#   })
#
# house4 = House.new({
#   'name' => 'Gryffindor'
#   'logo' => ''
#   })


binding.pry()
nil
