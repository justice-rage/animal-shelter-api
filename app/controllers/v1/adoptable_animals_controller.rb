class V1::AdoptableAnimalsController < ApplicationController

  def index
    if params[:page].present?
      @adoptable_animals = AdoptableAnimal.paginate(:page => params[:page], per_page:25)
    elsif params[:random].present?
      @adoptable_animals = AdoptableAnimal.all.sample
    elsif params[:species].present?
      species = params[:species]
      @adoptable_animals = AdoptableAnimal.search_species(species)
    elsif params[:breed].present?
      breed = params[:breed]
      @adoptable_animals = AdoptableAnimal.search_breed(breed)
    elsif params[:name].present?
      name = params[:name]
      @adoptable_animals = AdoptableAnimal.search_name(name)
    elsif params[:age].present?
      age = params[:age]
      @adoptable_animals = AdoptableAnimal.search_age(age)
    elsif params[:sex].present?
      sex = params[:sex]
      @adoptable_animals = AdoptableAnimal.search_sex(sex)
    else
      @adoptable_animals = AdoptableAnimal.all
    end
    json_response(@adoptable_animals)
  end

  def show
    @adoptable_animal = AdoptableAnimal.find(params[:id])
    json_response(@adoptable_animal)
  end

  def create
    @adoptable_animal = AdoptableAnimal.create!(adoptable_animal_params)
    json_response(@adoptable_animal, :created)
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
  end

  private

  def adoptable_animal_params
    params.permit(:species, :breed, :name, :age, :sex)
  end
end