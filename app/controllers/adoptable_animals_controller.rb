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
      @adoptable_animal = AdoptableAnimal.create(adoptable_animal_params)
      json_response(@adoptable_animal)
    end

    def update
      @adoptable_animal = AdoptableAnimal.find(params[:id])
      @adoptable_animal.update(adoptable_animal_params)
    end

    def destroy
      @adoptable_animal = AdoptableAnimal.find(params[:id])
      @adoptable_animal.destroy
    end
  
    private

    def adoptable_animal_params
      params.permit(:species, :breed, :name, :age, :sex)
    end
  end