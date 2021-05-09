require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  # test "the truth" do
  #   assert true
  # end

  test "should not save category without name" do
	  category = Category.new
	  assert_not category.save
	end

	test "should save category without description" do
	  category = Category.new(name: "Test")
	  assert category.save
	  assert_equal Category.first.name, "Test"
	  assert_equal Category.first.description, ""
	end

	test "should save category with name and description" do
	  category = Category.new(name: "Test", description: "Test")
	  assert category.save
	  assert_equal Category.first.name, "Test"
	  assert_equal Category.first.description, "Test"
	end

	test "should update category name" do
	  category = Category.new(name: "Test", description: "Test")
	  assert category.update(name: "Test1")
	  assert_equal Category.first.name, "Test1"
	  assert_equal Category.first.description, "Test" 
	end

	test "should update category description" do
	  category = Category.new(name: "Test", description: "Test")
	  assert category.update(description: "Test1")
	  assert_equal Category.first.name, "Test"
	  assert_equal Category.first.description, "Test1"
	end

	test "should update category name and description" do
	  category = Category.new(name: "Test", description: "Test")
	  assert category.update(name: "Test1", description: "Test1")
	  assert_equal Category.first.name, "Test1"
	  assert_equal Category.first.description, "Test1"
	end

	test "should not destroy category" do
		category = Category.new(name: "Test", description: "Test")
	  assert category.destroy
	  assert_empty Category.all
	end

	test "should save category with 100 symbols in name" do
		name = ""
		100.times { name += "1" }
	  category = Category.new(name: name, description: "Test")
	  assert category.save
	end

	test "should not save category with 101 symbols in name" do
		name = ""
		101.times { name += "1" }
	  category = Category.new(name: name, description: "Test")
	  assert_not category.save
	end

	test "should save category with 500 symbols in description" do
		description = ""
		500.times { description += "1" }
	  category = Category.new(name: "Test", description: description)
	  assert category.save
	end

	test "should not save category with 501 symbols in description" do
		description = ""
		501.times { description += "1" }
	  category = Category.new(name: "Test", description: description)
	  assert_not category.save
	end
end
