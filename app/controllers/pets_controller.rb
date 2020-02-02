require 'pry'
class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def new
    @shelter_id = params[:id]
    # binding.pry
  end


  def show
    @pet = Pet.find(params[:id])
  end

  def create
    pet = Pet.new(pet_params)
    pet.shelter_id = params[:id]
    pet.adoption_status = "Available"
    pet.save
    redirect_to "/shelters/#{pet.shelter_id}/pets"
    end



  def edit
    @pet_id = params[:id]
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    pet.save
    redirect_to '/pets'
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

    private

      def pet_params
        params.permit(:name, :image, :description, :approximate_age, :sex, :adoption_status, :shelter_id)
      end
end
