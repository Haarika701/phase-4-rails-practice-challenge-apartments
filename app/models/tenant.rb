class Tenant < ApplicationRecord
    has_many :leases
    has_many :apartments,through: :leases
    validates :name,:age,presence: true
    validates :validate_age

    private
    
    def validate_age
         if age >= 18.years.ago.to_d
            errors.add(:age, 'You should be 18 years old or above.')
         end
    end
end
