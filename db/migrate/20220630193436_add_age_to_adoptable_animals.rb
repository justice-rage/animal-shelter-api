class AddAgeToAdoptableAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column(:adoptable_animals, :age, :string)
  end
end
