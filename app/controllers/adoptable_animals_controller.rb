class AdoptableAnimalsController < ApplicationController

    def index
      @adoptable_animals = AdoptableAnimal.all
      json_response(@adoptable_animals)
    end

    def show
      @adoptable_animal = AdoptableAnimal.find(params[:id])
      json_response(@adoptable_animal)
    end

    def create
      @adoptable_animal = AdoptableAnimal.create!(adoptable_animal_params)
      json_response(@adoptable_animal)
    end

    def update
      @adoptable_animal = AdoptableAnimal.find(params[:id])
      if @adoptable_animal.update!(adoptable_animal_params)
        render status: 200, json: {
          message: "Update successful."
        }
      end
    end

    def destroy
      @adoptable_animal = AdoptableAnimal.find(params[:id])
      if @adoptable_animal.destroy
        render status: 200, json: {
          message: "Destruction successful."
        }
    end
  
    private

    def adoptable_animal_params
      params.permit(:species, :breed, :name, :age, :sex)
    end
  end
end