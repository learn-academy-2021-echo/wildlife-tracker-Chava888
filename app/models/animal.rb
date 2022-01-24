class MyValidator < ActiveModel::Validator
    def validate(record)
      if record.common_name == record.latin_name
        record.errors.add :common_name, "common name cannot be the same as latin name!"
      end
    end
end
  


class Animal < ApplicationRecord
    include ActiveModel::Validations
    validates_with MyValidator
    validates :common_name, :latin_name, presence: true
    validates :common_name, :latin_name, uniqueness: true

    has_many :sightings
end


