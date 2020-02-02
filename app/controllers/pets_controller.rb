require 'pry'
class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
  end

  def create
    pet = Pet.new(pet_params)
    pet.shelter_id = params[:id]
    pet.adoption_status = "Available"
    # binding.pry
    pet.save
    redirect_to '/shelters'
    end

  

  def edit
    @pet_id = params[:id]
    # binding.pry
  end

  def update
    # binding.pry
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    pet.save
    redirect_to '/pets'
  end

  # def destroy
  #   Pet.destroy(params[:id])
  #   redirect_to '/pets'
  # end

    private

      def pet_params
        params.permit(:name, :description, :approximate_age, :sex, :adoption_status, :shelter_id)
      end
end
