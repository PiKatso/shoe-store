class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores

  validates :price, presence: true
  validates :price, numericality: { only_integer: true }, length: { maximum: 3 }
  validates :name, presence: true, length: { maximum: 100 }
  # validates_format_of :name, :with => /[a-z]/i doesn't work
  validates :name, uniqueness: { case_sensitive: false }

  before_save :capitalize_title

end

class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands

  validates :name, presence: true, length: { maximum: 100 }
  # validates_format_of :name, :with => /[a-z]/i  doesn't work?
  validates :name, uniqueness: { case_sensitive: false }

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
