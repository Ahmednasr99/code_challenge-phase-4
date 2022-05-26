class Sweet < ApplicationRecord
    has_many :vendor_sweets, dependent: :destroy
    has_many :vendors, through: :vendor_sweets
end
