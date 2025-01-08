class Band < ApplicationRecord
  has_many :members
  has_and_belongs_to_many :genres
  has_many :albums
  has_many :songs, through: :albums and :genres
end
