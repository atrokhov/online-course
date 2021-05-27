# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


category = Category.create(name: "Test")
course = Course.create(name: "Test course", category: category)

su = User.create(first_name: "Super", last_name: "User", email: "superuser@course.kg", role: 3, password: "123456789", password_confirmation: "123456789")

teacher1 = User.create(first_name: "Teacher", last_name: "User 1", email: "teacher1@course.kg", role: 4, password: "123456789", password_confirmation: "123456789")
teacher2 = User.create(first_name: "Teacher", last_name: "User 2", email: "teacher2@course.kg", role: 4, password: "123456789", password_confirmation: "123456789")

client1 = User.create(first_name: "Client", last_name: "User 1", email: "client1@course.kg", password: "123456789", password_confirmation: "123456789")
client2 = User.create(first_name: "Client", last_name: "User 2", email: "client2@course.kg", password: "123456789", password_confirmation: "123456789")

manager1 = User.create(first_name: "Manager", last_name: "User 1", email: "manager1@course.kg", role: 2, password: "123456789", password_confirmation: "123456789")
manager2 = User.create(first_name: "Manager", last_name: "User 2", email: "manager2@course.kg", role: 2, password: "123456789", password_confirmation: "123456789")

admin1 = User.create(first_name: "Admin", last_name: "User 1", email: "admin1@course.kg", role: 0, password: "123456789", password_confirmation: "123456789")
admin2 = User.create(first_name: "Admin", last_name: "User 2", email: "admin2@course.kg", role: 0, password: "123456789", password_confirmation: "123456789")