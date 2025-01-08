class Genre < ApplicationRecord
  has_and_belongs_to_many :bands
  validates :name, presence: true
end
