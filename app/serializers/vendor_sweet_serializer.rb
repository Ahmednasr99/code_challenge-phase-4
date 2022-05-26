class VendorSweetSerializer < ActiveModel::Serializer
  attributes :id, :price
  has_one :vendor
  has_one :sweet
end
