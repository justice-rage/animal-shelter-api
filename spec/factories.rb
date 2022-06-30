FactoryBot.define do
    factory(:adoptable_animal) do
        type = ['cat', 'dog'].sample
        species_breed = type == 'cat' ? Faker::Creature::Cat.breed : Faker::Creature::Dog.breed
        animal_age = ['baby', 'adolescent', 'adult', 'senior'].sample
      
        species {type}
        breed {(species_breed).downcase}
        name {(Faker::Name.first_name).downcase}
        age {animal_age}
        sex {(Faker::Gender.binary_type).downcase}
    end
end