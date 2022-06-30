class AdoptableAnimalsController < ApplicationController

    def index
      @adoptable_animals = {"adoptable animal": "species: cat, name: velma, breed: unknown, color: tuxedo"}
      json_response(@adoptable_animals)
    end
  
    private
    def json_response(object, status = :ok)
      render json: object, status: status
    end
  end