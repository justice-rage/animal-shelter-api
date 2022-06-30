class AddSexToAdoptableAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column(:adoptable_animals, :sex, :string)
  end
end
