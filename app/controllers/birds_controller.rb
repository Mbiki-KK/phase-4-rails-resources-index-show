class BirdsController < ApplicationController

  def index
    birds = Bird.all
    render json: birds
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: {error: "Bird not found"}, state: :not_found
    end
  end

  def create
    # byebug
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end


  private

  def bird_params
    params.permit(:name, :species)
  end
end
