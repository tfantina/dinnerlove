class TagsController < ApplicationController
  def new
    @tag = Tag.new

  end
  def create
    @tag = Tag.new(tag_params)
    respond_to do |format|
      if @tag.save
        format.html {redirect_to root_path}
      else
        format.html {render :new}
      end
    end
  end

  private

  def tag_params
      params.require(:tag).permit(:name)
  end
end
