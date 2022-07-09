require 'rails_helper'

describe AdoptableAnimal, type: :model do
  it { should validate_presence_of :species }
  it { should validate_presence_of :breed }
  it { should validate_presence_of :name }
  it { should validate_presence_of :age }
  it { should validate_presence_of :sex }
end