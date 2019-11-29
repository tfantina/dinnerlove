class MealPlansController < ApplicationController
    def show 
     @meal_plan = MealPlan.find(params[:id])
    end

    def create 

      @meal_plan = current_user.meal_plans.build(meal_plan_params)
 
      respond_to do |format|
        if @meal_plan.save
         format.html { redirect_to root_path, notice: 'Dinner was successfully created.' }
         end
      end
    end
  
    private 
    
    def meal_plan_params
        params.require(:meal_plan).permit(:weekof, dinner_ids: []) 
    end

    

end