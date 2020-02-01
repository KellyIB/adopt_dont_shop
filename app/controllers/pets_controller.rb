class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pets = Pet.find(params[:id])
  end

  def new
  end

  def create
    pet = Pet.new(pet_params)
      pet.save
      redirect_to '/pets'
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
        params.permit(:name, :approximate_age, :sex, :state, :shelter_id)
      end
end
