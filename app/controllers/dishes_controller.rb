class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]
  before_action :set_course, only: [:new, :edit, :create, :update]

  def index
    @dishes = Dish.all.includes(:course).order(:name)
    @menu = @dishes.group_by(&:course_id)
  end

  def show
  end

  def new
    @dish = Dish.new
  end

  def edit
  end

  def create
    @dish = Dish.new(dish_params)
    respond_to do |format|
      if @dish.save
        format.html { redirect_to dishes_path }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to dishes_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url }
    end
  end

  private
    def set_dish
      @dish = Dish.find(params[:id])
    end

    def set_course
      course_id = params[:course_id].present? ? params[:course_id] : dish_params[:course_id]
      @course = Course.find(course_id)
    end

    def dish_params
      params.fetch(:dish, {}).permit(:name, :price, :description, :course_id)
    end
end
