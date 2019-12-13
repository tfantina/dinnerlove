class MealPlansController < ApplicationController
    def show
      @meal_plan = MealPlan.find(params[:id])
      @seven_random_dinners = Dinner.limit(7).order(Arel.sql('random()'))
      @meal_plan_this_week = current_user.meal_plans.find_by(weekof: Date.today.beginning_of_week) || nil
      @meal_plan_next_week = current_user.meal_plans.find_by(weekof: Date.today.beginning_of_week.next_week) || nil
    end

    def new 
      @meal_plan = MealPlan.new
    end

    def create
      puts "#{meal_plan_params} MEAL PLAN PARAMS"
      
      @meal_plan = current_user.meal_plans.build(meal_plan_params)
      puts "#{@meal_plan.weekof} THIS SIS THE WEEK OF "
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



end
