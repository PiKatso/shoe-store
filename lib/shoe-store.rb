class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
end

class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands
end

class BrandsStores < ActiveRecord::Base
  belongs_to :brand
  belongs_to :store
end
