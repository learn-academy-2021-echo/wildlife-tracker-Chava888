require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is not valid without common name' do
    animal = Animal.create latin_name: 'panthera leo', kingdom: 'animalia'
    expect(animal.errors[:common_name]).to_not be_empty
  end
  it 'is not valid without latin name' do
    animal = Animal.create common_name: 'lion', kingdom: 'animalia'
    expect(animal.errors[:latin_name]).to_not be_empty
  end
  it 'is not valid if common name equals latin name' do
    animal = Animal.create common_name: 'lion', latin_name: 'lion', kingdom: 'animalia'
    expect(animal.errors[:common_name]).to_not be_empty
  end
  it 'is not valid if common name is not unique' do
    Animal.create common_name: 'lion', latin_name: 'panthera leo', kingdom: 'animalia'
    animal_one = Animal.create common_name: 'lion', latin_name: 'panthera leo', kingdom: 'animalia'
    expect(animal_one.errors[:common_name]).to_not be_empty
  end
  it 'is not valid if latin name is not unique' do
    Animal.create common_name: 'lion', latin_name: 'panthera leo', kingdom: 'animalia'
    animal_one = Animal.create common_name: 'lionses', latin_name: 'panthera leo', kingdom: 'animalia'
    expect(animal_one.errors[:latin_name]).to_not be_empty
  end
end
