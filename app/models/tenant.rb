class Tenant < ApplicationRecord
    has_many :leases
    has_many :apartments, through: :leases

    validates :name, presence:true 
    validates :age, presence:true, numericality: {only_integer:true, greater_than_or_equal_to: 18, message: "must be at least 18 years old" }
end
