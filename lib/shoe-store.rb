class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  validates :name, length: { maximum: 100 }
  before_save :capitalize_title
end

class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands
  validates :name, length: { maximum: 100 }
  before_save :capitalize_title
end

class BrandsStores < ActiveRecord::Base
  belongs_to :brand
  belongs_to :store
end

private

def capitalize_title
  self.name = name.split.map(&:capitalize).join(" ")
end
