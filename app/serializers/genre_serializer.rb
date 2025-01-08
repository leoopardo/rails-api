class GenreSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :bands, serializer: BandSerializer
end
