require "test_helper"

class CourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

 #  test "should not save course without category" do
 #  	category = Category.new(name: "Test")
	#   course = Course.new
	#   assert_not course.save
	# end

 #  test "should not save course without name" do
 #  	category = Category.new(name: "Test")
	#   course = Course.new(category: category, category: category)
	#   assert_not course.save
	# end

	# test "should save course without description" do
	# 	category = Category.new(name: "Test")
	#   course = Course.new(category: category, name: "Test")
	#   assert course.save
	#   assert_equal Course.first.name, "Test"
	#   assert_equal Course.first.description, ""
	# end

	# test "should save course with name and description" do
	# 	category = Category.new(name: "Test")
	#   course = Course.new(category: category, name: "Test", description: "Test")
	#   assert course.save
	#   assert_equal Course.first.name, "Test"
	#   assert_equal Course.first.description, "Test"
	# end

	# test "should update course name" do
	# 	category = Category.new(name: "Test")
	#   course = Course.new(category: category, name: "Test", description: "Test")
	#   assert course.update(name: "Test1")
	#   assert_equal Course.first.name, "Test1"
	#   assert_equal Course.first.description, "Test" 
	# end

	# test "should update course description" do
	# 	category = Category.new(name: "Test")
	#   course = Course.new(category: category, name: "Test", description: "Test")
	#   assert course.update(description: "Test1")
	#   assert_equal Course.first.name, "Test"
	#   assert_equal Course.first.description, "Test1"
	# end

	# test "should update course name and description" do
	# 	category = Category.new(name: "Test")
	#   course = Course.new(category: category, name: "Test", description: "Test")
	#   assert course.update(name: "Test1", description: "Test1")
	#   assert_equal Course.first.name, "Test1"
	#   assert_equal Course.first.description, "Test1"
	# end

	# test "should not destroy course" do
	# 	category = Category.new(name: "Test")
	# 	course = Course.new(category: category, name: "Test", description: "Test")
	#   assert course.destroy
	#   assert_empty Course.all
	# end

	# test "should save course with 100 symbols in name" do
	# 	category = Category.new(name: "Test")
	# 	name = ""
	# 	100.times { name += "1" }
	#   course = Course.new(category: category, name: name, description: "Test")
	#   assert course.save
	# end

	# test "should not save course with 101 symbols in name" do
	# 	category = Category.new(name: "Test")
	# 	name = ""
	# 	101.times { name += "1" }
	#   course = Course.new(category: category, name: name, description: "Test")
	#   assert_not course.save
	# end

	# test "should save course with 500 symbols in description" do
	# 	category = Category.new(name: "Test")
	# 	description = ""
	# 	500.times { description += "1" }
	#   course = Course.new(category: category, name: "Test", description: description)
	#   assert course.save
	# end

	# test "should not save course with 501 symbols in description" do
	# 	category = Category.new(name: "Test")
	# 	description = ""
	# 	501.times { description += "1" }
	#   course = Course.new(category: category, name: "Test", description: description)
	#   assert_not course.save
	# end
end
