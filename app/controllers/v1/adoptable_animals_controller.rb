class V1::AdoptableAnimalsController < ApplicationController

  def index
    if params[:page].present?
      @adoptable_animals = AdoptableAnimal.paginate(:page => params[:page], per_page:25)
    # Random Endpoint - Bug Note:
    #   Entering /v1/adoptable_animals?random returns same results as /v1/adoptable_animals
    #   When .sample is appended to line 12 statement an undefined method error is returned
    #   .sample appended to else statement works as expected, but not on elsif
    #   Potential Bug Explanation:
    #     elsif is being skipped over, but unsure why.
    # elsif params[:random].present?
    #   @adoptable_animals = AdoptableAnimal.all.sample
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