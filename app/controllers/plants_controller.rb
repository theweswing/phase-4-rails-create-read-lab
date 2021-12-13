class PlantsController < ApplicationController
  wrap_parameters format: []
  def index
    byebug
    plants = Plant.all
    render json: plants, status: :ok
  end

  def show
    found_plant = Plant.find_by(id: params[:id])
    render json: found_plant, status: :ok
  end

  def create
    new_plant = Plant.create(accepted_params)
    render json: new_plant, status: 201
  end

  private

  def accepted_params
    params.permit(:name, :image, :price)
  end
end
