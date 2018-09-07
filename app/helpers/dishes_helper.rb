module DishesHelper

  def get_course(course_id)
    Course.find(course_id)
  end
end

