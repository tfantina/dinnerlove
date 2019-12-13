class MealPlansController < ApplicationController

    def show
      @meal_plan = MealPlan.find(params[:id])
      @meal_plans = user_meal_plans
    end

    def new 
      @meal_plan = MealPlan.new
      @meal_plans = user_meal_plans
    end

    def create
      @meal_plan = current_user.meal_plans.build(meal_plan_params)
      respond_to do |format|
        if @meal_plan.save
         format.html { redirect_to @meal_plan, notice: 'Dinner was successfully created.' }
        else 
           format.html { redirect_to root_path, notice: 'Your meal plan was not saved.' }
      end
    end
    end

    private

    def meal_plan_params
        params.require(:meal_plan).permit(:weekof, dinner_ids: [])
    end

    def user_meal_plans 
      meal_plans = {this_week: current_user.meal_plans.find_by(weekof: Date.today.beginning_of_week),
                    next_week: current_user.meal_plans.find_by(weekof: Date.today.beginning_of_week.next_week) }     
    end 


end
