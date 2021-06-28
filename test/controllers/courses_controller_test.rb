require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # def auth_user(user_role)
  #   first_name = user_role.to_s + 
  #   last_name = "User"
  #   email = user_role.to_s + "User@example.com"
  #   return user = User.create(first_name: first_name, last_name: last_name,email: email, password: "qwerty123", password_confirmation: "qwerty123", role: user_role)
  # end

  # def create_category
  #   category = Category.create(name: "Test")
  # end

  # test "should get index" do
  #   category = create_category
  #   get category_courses_url(course.category.id)
  #   assert_response :success
  #   sleep 0.5
  # end

  # test "should get show" do
  #   teacher = auth_user(:teacher)
  #   course = create_category_and_course(teacher)
  #   get category_course_path(course.category.id, course.id)
  #   assert_response :success
  #   sleep 0.5
  # end

  # test "should get new as superuser" do
  #   category = create_category
  #   user = auth_user(:superuser)
  #   sign_in user
  #   get new_category_course_url(category.id)
  #   assert_response :success
  #   sign_out user
  #   sleep 0.5
  # end

  # test "should get new as teacher" do
  #   category = create_category
  #   user = auth_user(:teacher)
  #   sign_in user
  #   get new_category_course_url(category.id)
  #   assert_response :success
  #   sign_out user
  #   sleep 0.5
  # end

  # test "should get edit as superuser" do
  #   course = create_category_and_course
  #   user = auth_user(:superuser)
  #   sign_in user
  #   get edit_category_course_path(course.category.id ,course.id)
  #   assert_response :success
  #   sign_out user
  #   sleep 0.5
  # end

  # test "should get edit as teacher of this course" do
  #   user = auth_user(:teacher)
  #   sign_in user
  #   course = create_category_and_course(user)
  #   get edit_category_course_path(course.category.id ,course.id)
  #   assert_response :success
  #   sign_out user
  #   sleep 0.5
  # end

  # test "shouldn't get edit as teacher on another course" do
  #   user = auth_user(:teacher)
  #   user2 = auth_user(:teacher)
  #   sign_in user2
  #   course = create_category_and_course(user)
  #   get edit_category_course_path(course.category.id ,course.id)
  #   assert_response :found
  #   sign_out user
  #   sleep 0.5
  # end

  # test "shouldn't get new without login" do
  #   category = create_category
  #   get new_category_course_url(category.id)
  #   assert_response :found
  #   sleep 0.5
  # end

  # test "shouldn't get edit without login" do
  #   course = create_category_and_course
  #   get edit_category_course_path(course.category.id, course.id)
  #   assert_response :found
  #   sleep 0.5
  # end

  # test "shouldn't get new with another account" do
  #   category = create_category
  #   user = auth_user(:client)
  #   sign_in user
  #   get new_category_course_url(category.id)
  #   assert_response :found
  #   sign_out user
  #   sleep 0.5
  # end

  # test "shouldn't get edit with another account" do
  #   course = create_category_and_course
  #   user = auth_user(:client)
  #   sign_in user
  #   get edit_category_course_path(course.category.id, course.id)
  #   assert_response :found
  #   sign_out user
  #   sleep 0.5
  # end

  # test "superuser should create new course" do
  #   category = Category.create(name: "Test")
  #   auth_user(Superuser)
  #   puts category.id
  #   post courses_url, params: { course: { category: category,  category_id: category.id, name: "Test", description: "Test" } }
  #   assert_response :found
  #   assert_equal [Course.last.name, Course.last.description], ["Test", "Test"]
  # end

  # test "superuser should update course name" do
  #   category = Category.create(name: "Test")
  #   course = Course.create(category: category, name: "Test", description: "Test")
  #   auth_user(Superuser)
  #   patch course_path(course.id), params: { course: { category: category,  name: "Test1" } }
  #   assert_response :found
  #   assert_equal Course.last.name, "Test1"
  # end

  # test "superuser should update course description" do
  #   category = Category.create(name: "Test")
  #   course = Course.create(category: category, name: "Test", description: "Test")
  #   auth_user(Superuser)
  #   patch course_path(course.id), params: { course: { category: category,  description: "Test1" } }
  #   assert_response :found
  #   assert_equal Course.last.description, "Test1"
  # end

  # test "superuser should update full course" do
  #   category = Category.create(name: "Test")
  #   course = Course.create(category: category, name: "Test", description: "Test")
  #   auth_user(Superuser)
  #   patch course_path(course.id), params: { course: { category: category,  name: "Test1", description: "Test1" } }
  #   assert_response :found
  #   assert_equal [Course.last.name, Course.last.description], ["Test1", "Test1"]
  # end

  # test "superuser should destroy course" do
  #   category = Category.create(name: "Test")
  #   course = Course.create(category: category, name: "Test", description: "Test")
  #   auth_user(Superuser)
  #   delete course_path(course.id)
  #   assert_response :found
  #   assert_empty Course.all
  # end

  # test "not superuser shouldn't create new course" do
  #   auth_user(Client)
  #   post courses_url, params: { course: { category: category,  name: "Test", description: "Test" } }
  #   assert_response :found
  #   assert_empty Course.all
  # end

  # test "not superuser shouldn't update course name" do
  #   category = Category.create(name: "Test")
  #   course = Course.create(category: category, name: "Test", description: "Test")
  #   auth_user(Client)
  #   patch course_path(course.id), params: { course: { category: category,  name: "Test1" } }
  #   assert_response :found
  #   assert_equal Course.last.name, "Test"
  # end

  # test "not superuser shouldn't update course description" do
  #   category = Category.create(name: "Test")
  #   course = Course.create(category: category, name: "Test", description: "Test")
  #   auth_user(Client)
  #   patch course_path(course.id), params: { course: { category: category,  description: "Test1" } }
  #   assert_response :found
  #   assert_equal Course.last.description, "Test"
  # end

  # test "not superuser shouldn't update full course" do
  #   category = Category.create(name: "Test")
  #   course = Course.create(category: category, name: "Test", description: "Test")
  #   auth_user(Client)
  #   patch course_path(course.id), params: { course: { category: category,  name: "Test1", description: "Test1" } }
  #   assert_response :found
  #   assert_equal [Course.last.name, Course.last.description], ["Test", "Test"]
  # end

  # test "not superuser shouldn't destroy course" do
  #   category = Category.create(name: "Test")
  #   course = Course.create(category: category, name: "Test", description: "Test")
  #   auth_user(Client)
  #   delete course_path(course.id)
  #   assert_response :found
  #   assert_not_empty Course.all
  #   assert_equal [Course.last.name, Course.last.description], ["Test", "Test"]
  # end

  test 'Unautorized users must get index and show, another views must not to be accessed' do
    teacher = User.create(first_name: "Teacher", last_name: "User 1", email: "teacher1@course.kg", role: 4, password: "123456789", password_confirmation: "123456789")
    course = create_category_and_course(teacher)

    get category_courses_url(course.category.id)
    assert_response :success

    course.active = true
    course.save!
    get category_course_path(course.category.id, course.id)
    assert_response :success

    course.active = false
    course.save!
    get category_course_path(course.category.id, course.id)
    assert_response :not_found

    get new_category_course_url(course.category.id)
    assert_response :found

    get edit_category_course_path(course.category.id, course.id)
    assert_response :found

    post category_courses_url(course.category.id), params: { course: { category: course.category,  name: "Test1", description: "Test1" } }
    assert_response :found
    assert_equal [Course.last.name, Course.last.description], ["Test", "Test"]

    post category_courses_url(course.category.id), params: { course: { category: course.category,  name: "Test1"} }
    assert_response :found
    assert_equal [Course.last.name, Course.last.description], ["Test", "Test"]

    post category_courses_url(course.category.id), params: { course: { category: course.category,  description: "Test1" } }
    assert_response :found
    assert_equal [Course.last.name, Course.last.description], ["Test", "Test"]

    patch category_course_path(course.category.id, course.id), params: { course: { name: "Test1", description: "Test1" } }
    assert_response :found
    assert_equal [Course.last.name, Course.last.description], ["Test", "Test"]

    patch category_course_path(course.category.id, course.id), params: { course: { name: "Test1" } }
    assert_response :found
    assert_equal [Course.last.name, Course.last.description], ["Test", "Test"]

    patch category_course_path(course.category.id, course.id), params: { course: { description: "Test1" } }
    assert_response :found
    assert_equal [Course.last.name, Course.last.description], ["Test", "Test"]

    delete category_course_path(course.category.id, course.id)
    assert_response :found
    assert_not_empty Course.all
    assert_equal [Course.last.name, Course.last.description], ["Test", "Test"]

    patch category_activate_course_url(course.category.id, course.id)
    assert_response :found
    assert_equal [Course.last.name, Course.last.description], ["Test", "Test"]
  end

  private

      def create_category_and_course(teacher)
        category = Category.create(name: "Test")
        return course = Course.create(category: category, name: "Test", description: "Test", teacher_id: teacher.id)
      end
end
