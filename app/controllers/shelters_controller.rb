class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelters = Shelter.find(params[:id])
  end

    def create
      shelter = Shelter.new({name: params[:shelter][:title],
        address: params[:shelter][:address],
        city: params[:shelter][:city],
        state: params[:shelter][:state],
        zip: params[:shelter][:zip]})

        shelter.save

        redirect_to '/shelters'
    end
end
