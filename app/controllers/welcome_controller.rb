#app/controllers/WelcomeController.rb
class WelcomeController < ApplicationController
  def index
    redirect_to "/shelters"
  end
end
