class StaticController < ApplicationController
    def home
      user = User.all 
      render json: user
    end
end
