class DinnersController < ApplicationController
  before_action :set_dinner, only: [:show, :edit, :update, :destroy]
  before_action :meal_plan_exists?, only: [:index]

  # GET /dinners
  # GET /dinners.json
  def index
    @meal_plan = MealPlan.new
    @dinners = Dinner.all
    @seven_random_dinners = Dinner.limit(7).order(Arel.sql('random()'))
  end

  # GET /dinners/1
  # GET /dinners/1.json
  def show
    @dinners = current_user.dinners
  end

  # GET /dinners/new
  def new
    @dinner = Dinner.new

  end

  # GET /dinners/1/edit
  def edit
  end

  # POST /dinners
  # POST /dinners.json
  def create
    @dinner = current_user.dinners.build(dinner_params)
    respond_to do |format|
      if @dinner.save
        format.html { redirect_to @dinner, notice: 'Dinner was successfully created.' }
        format.json { render :show, status: :created, location: @dinner }
      else
        format.html { render :new }
        format.json { render json: @dinner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dinners/1
  # PATCH/PUT /dinners/1.json
  def update
    respond_to do |format|
      if @dinner.update(dinner_params)
        format.html { redirect_to @dinner, notice: 'Dinner was successfully updated.' }
        format.json { render :show, status: :ok, location: @dinner }
      else
        format.html { render :edit }
        format.json { render json: @dinner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dinners/1
  # DELETE /dinners/1.json
  def destroy
    @dinner.destroy
    respond_to do |format|
      format.html { redirect_to dinners_url, notice: 'Dinner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def test
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dinner
      @dinner = Dinner.find(params[:id])
    end

    # checks if the user already has a mealplan for the week
    def meal_plan_exists?
     if user_signed_in? then
       @meal_plan = current_user.meal_plans.where(weekof: Date.today.beginning_of_week.to_datetime).take
     else
       return false
     end
      if @meal_plan then
        redirect_to meal_plan_path(@meal_plan)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dinner_params
      params.require(:dinner).permit(:name, :notes)
    end


end
