class Seed

    def self.begin
      seed = Seed.new
      seed.generate_adoptable_animals
    end
  
    def generate_adoptable_animals
      20.times do |i|
        type = ['cat', 'dog'].sample
        species_breed = type == 'cat' ? Faker::Creature::Cat.breed : Faker::Creature::Dog.breed
        animal_age = ['baby', 'adolescent', 'adult', 'senior'].sample
        adoptable_animal = AdoptableAnimal.create!(
            species: type,
            breed: species_breed,
            name: Faker::Name.first_name,
            age: animal_age,
            sex: Faker::Gender.binary_type
        )
        puts "Adoptable Animal: #{i},
        Species: #{adoptable_animal.species}, 
        Breed: #{adoptable_animal.breed}, 
        Name: #{adoptable_animal.name}, 
        Age: #{adoptable_animal.age}, 
        Sex: #{adoptable_animal.sex}"
      end
    end
  end
  
  Seed.begin