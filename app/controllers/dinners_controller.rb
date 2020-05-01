# frozen_string_literal: true

class DinnersController < ApplicationController
  before_action :set_dinner, only: %i[show edit update destroy]
  before_action :meal_plan_exists?, only: [:index]
  before_action :dinner_current_user, only: [:edit]
  before_action :authenticate_user!, only: %i[edit update destroy create toggle_love]

  def index
    @meal_plan = MealPlan.new
    @dinners = Dinner.all

    if user_signed_in? && enough_love?
      loves = current_user.loves
      @dinners = Dinner.where(id: current_user.loves.pluck(:dinner_id))
      @seven_random_dinners = @dinners.sort { rand - 0.5 }[0..6]
    else
      @seven_random_dinners = Dinner.limit(7).order(Arel.sql('random()'))
    end
  end

  def show; end

  def new
    @dinner = Dinner.new
    @tags = Tag.all
  end

  # GET /dinners/1/edit
  def edit
    @tags = Tag.all
  end


  def create
    @dinner = current_user.dinners.build(dinner_params)

    if params[:dinner][:photo]
      shrink_img = MiniMagick::Image.new(params[:dinner][:photo].tempfile.path)
      shrink_img.resize '500x500'
    end

    respond_to do |format|
      save_tags(@dinner, params[:dinner][:tag])
      if @dinner.save
        format.html { redirect_to @dinner, notice: 'Dinner was successfully created.' }
        format.json { render :show, status: :created, location: @dinner }
      else
        format.html { render :new }
        format.json { render json: @dinner.errors, status: :unprocessable_entity }
      end
    end
  end

  def all
    @dinners = Dinner.all.order('RANDOM()')
  end

  def update
    respond_to do |format|

      if(params[:dinner][:photo])
         shrink_img = MiniMagick::Image.new(params[:dinner][:photo].tempfile.path)
         shrink_img.resize "500x500"
      end

      if @dinner.update(dinner_params)
        save_tags(@dinner, params[:dinner][:tag])
        format.html { redirect_to @dinner, notice: 'Dinner was successfully updated.' }
        format.json { render :show, status: :ok, location: @dinner }
      else
        format.html { render :edit }
        format.json { render json: @dinner.errors, status: :unprocessable_entity }
      end
    end
  end

  def toggle_love
    user_toggle_loved
    if !already_loved?
      @dinner = Dinner.find(params[:id])
      @love = @dinner.loves.build(user_id: current_user.id)
      @love.save
      @loved = true
    else
      @dinner = Dinner.find(params[:id])
      @love = Love.find_by(user_id: current_user.id, dinner_id: params[:id])
      @love.destroy
      @loved = false
    end
  end

  def destroy
    @dinner.destroy
    respond_to do |format|
      format.html { redirect_to dinners_url, notice: 'Dinner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_dinner
    @dinner = Dinner.find(params[:id])
  end

  # checks if the user already has a mealplan for the week
  def meal_plan_exists?
    if user_signed_in?
      @meal_plan = current_user.meal_plans.where(weekof: Date.today.beginning_of_week.to_datetime).take
    else
      return false
    end
    redirect_to meal_plan_path(@meal_plan) if @meal_plan
  end

  # checks if the current dinner belongs to the user (users can only edit their own meals)
  def dinner_current_user
    unless user_signed_in? && @dinner.user_id == current_user.id
      redirect_to root_path
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dinner_params
      params.require(:dinner).permit(:name, :notes, :photo, tags: [] )
    end


  def save_tags(dinner, tags)
      tags.each do |tag|
        puts tag
        @tag = Tag.find_by(id: tag)
        puts @tag.name
        @dinner_tag = dinner.dinner_tags.build(tag: Tag.find_by(id: tag))
      end
    end

  def already_loved?
    Love.where(user_id: current_user.id, dinner_id: params[:id]).exists?
  end

  # if a user's love drops below 14 they will start to see dinners they have not loved
  def user_toggle_loved
    if current_user.show_only_loved_meals && current_user.loves.count < 14
      current_user.show_only_loved_meals = false
    end
  end

  def enough_love?
    current_user.loves.count >= 14 if current_user.show_only_loved_meals
  end
end
