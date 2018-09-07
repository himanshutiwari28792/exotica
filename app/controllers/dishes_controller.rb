class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]
  before_action :set_course, only: [:new, :edit, :update, :course_dishes]

  def index
    @dishes = Dish.all.includes(:course)
    @menu = @dishes.group_by(&:course_id)
  end

  def show
  end

  # def course_dishes
  #   if @course.present?
  #     @dishes = Dish.all.where(course_id: @course.id).order(:name)
  #   else
  #     respond_to do |format|
  #       format.html { redirect_to dishes_url, notice: 'No course found' }
  #     end 
  #   end
  # end

  def new
    @dish = Dish.new
  end

  def edit
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = Dish.new(dish_params)
    respond_to do |format|
      if @dish.save
        format.html { redirect_to course_dishes_dishes_path(course_id: dish_params[:course_id]), notice: 'Dish was successfully created.' }
        format.json { render :show, status: :created, location: @dish }
      else
        format.html { render :new }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1
  # PATCH/PUT /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to @dish, notice: 'Dish was successfully updated.' }
        format.json { render :show, status: :ok, location: @dish }
      else
        format.html { render :edit }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url, notice: 'Dish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.fetch(:dish, {}).permit(:name, :price, :description, :course_id)
    end
end
