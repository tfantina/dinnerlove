class Api::DinnersController < ApiController
  def index
    @dinners = Dinner.all
    render json: @dinners, status: :ok
  end
end
