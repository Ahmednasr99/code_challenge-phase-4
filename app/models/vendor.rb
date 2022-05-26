class Vendor < ApplicationRecord
    has_many:vendor_sweets, dependent: :destroy
    has_many:sweets, through: :vendor_sweets

    
end
