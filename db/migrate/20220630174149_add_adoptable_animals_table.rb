class AddAdoptableAnimalsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :adoptable_animals do |t|
      t.column :species, :string
      t.column :breed, :string
    end
  end
end
