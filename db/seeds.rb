# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

su = User.create(first_name: "Super", last_name: "User", email: "superuser@course.kg", role: 3, password: "123456789", password_confirmation: "123456789")

teacher1 = User.create(first_name: "Teacher", last_name: "User 1", email: "teacher1@course.kg", role: 4, password: "123456789", password_confirmation: "123456789")
teacher2 = User.create(first_name: "Teacher", last_name: "User 2", email: "teacher2@course.kg", role: 4, password: "123456789", password_confirmation: "123456789")

client1 = User.create(first_name: "Client", last_name: "User 1", email: "client1@course.kg", password: "123456789", password_confirmation: "123456789")
client2 = User.create(first_name: "Client", last_name: "User 2", email: "client2@course.kg", password: "123456789", password_confirmation: "123456789")

manager1 = User.create(first_name: "Manager", last_name: "User 1", email: "manager1@course.kg", role: 2, password: "123456789", password_confirmation: "123456789")
manager2 = User.create(first_name: "Manager", last_name: "User 2", email: "manager2@course.kg", role: 2, password: "123456789", password_confirmation: "123456789")

admin1 = User.create(first_name: "Admin", last_name: "User 1", email: "admin1@course.kg", role: 0, password: "123456789", password_confirmation: "123456789")
admin2 = User.create(first_name: "Admin", last_name: "User 2", email: "admin2@course.kg", role: 0, password: "123456789", password_confirmation: "123456789")

category1 = Category.create(name: "Test 1")
category2 = Category.create(name: "Test 2")
course1 = Course.create(name: "Test course 1", category: category1, active: true, teacher_id: teacher1.id)
course2 = Course.create(name: "Test course 2", category: category1, active: true, teacher_id: teacher1.id)
course3 = Course.create(name: "Test course 3", category: category2, active: true, teacher_id: teacher1.id)
course4 = Course.create(name: "Test course 4", category: category2, teacher_id: teacher2.id)

lesson1 = Lesson.create(course: course1, name: "Lesson 1", active: true, price: 1000)
lesson2 = Lesson.create(course: course1, name: "Lesson 2", active: true, price: 200000)
lesson3 = Lesson.create(course: course3, name: "Lesson 3", active: true, price: 200)

check = Check.create(sum: lesson1.price, customer: SecureRandom.hex(16))

basket1 = Basket.create(user: client1)
basket2 = Basket.create(user: client2)
basket3 = Basket.create(user: manager1)
basket4 = Basket.create(user: manager2)
basket5 = Basket.create(user: admin1)
basket6 = Basket.create(user: admin2)
basket7 = Basket.create(user: teacher1)
basket8 = Basket.create(user: teacher2)
basket9 = Basket.create(user: su)

paid_lesson = PaidLesson.create(check: check, user_id: client1.id, lesson: lesson1)