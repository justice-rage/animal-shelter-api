class AddNameToAdoptableAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column(:adoptable_animals, :name, :string)
  end
end
