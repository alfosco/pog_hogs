class Category < ApplicationRecord
  has_many :items
  validates_uniqueness_of :title

  extend FriendlyId
  friendly_id :title, use: :slugged

end
