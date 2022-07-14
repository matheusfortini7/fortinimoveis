class Property < ApplicationRecord
  has_many_attached :photos

  validates :title, :description, :area, :address, :status, :iptu, :price, presence: true
  validates :bathrooms, :rooms, :suites, :parking_space, presence: true, numericality: { only_integer: true }
end
