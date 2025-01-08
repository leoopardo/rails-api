class BandSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :members do
    object.members.select(:id, :name)
  end
  has_many :genres do
    object.genres.select(:id, :name)
  end
end
