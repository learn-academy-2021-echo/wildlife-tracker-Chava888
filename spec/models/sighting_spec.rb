require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'is not valid without date' do
    sighting = Sighting.create latitude: 32.715736, longitude: -117.161087
    expect(sighting.errors[:date]).to_not be_empty
  end
  it 'is not valid without latitude' do
    sighting = Sighting.create longitude: -117.161087, date: 2019-04-18
    expect(sighting.errors[:latitude]).to_not be_empty
  end
  it 'is not valid without longitude' do
    sighting = Sighting.create latitude: 32.715736, date: 2019-04-18
    expect(sighting.errors[:longitude]).to_not be_empty
  end
end
