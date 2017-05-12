class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores

  validates :price, presence: true
  validates :price, numericality: { only_integer: true }
  validates :name, presence: true, length: { maximum: 100 }
  validates :name, uniqueness: { case_sensitive: false }

  before_save :capitalize_title

  private

  def capitalize_title
    self.name = name.split.map(&:capitalize).join(" ")
  end
end

class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands

  validates :name, presence: true, length: { maximum: 100 }
  validates :name, uniqueness: { case_sensitive: false }

  before_save :capitalize_title

  private

  def capitalize_title
    self.name = name.split.map(&:capitalize).join(" ")
  end
end

class BrandsStores < ActiveRecord::Base
  belongs_to :brand
  belongs_to :store
end
