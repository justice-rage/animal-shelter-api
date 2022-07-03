class AdoptableAnimal < 
    validates :species, presence: true
    validates :breed, presence: true
    validates :name, presence: true
    validates :age, presence: true
    validates :sex, presence: true

    scope :search_species, -> (species_parameter) { where("species ilike ?", "%#{species_parameter}%")}
    scope :search_breed, -> (breed_parameter) { where("breed ilike ?", "%#{breed_parameter}%")}
    scope :search_name, -> (name_parameter) { where("name ilike ?", "%#{name_parameter}%")}
    scope :search_age, -> (age_parameter) { where("age ilike ?", "%#{age_parameter}%")}
    scope :search_sex, -> (sex_parameter) { where("sex ilike ?", "%#{sex_parameter}%")}

end