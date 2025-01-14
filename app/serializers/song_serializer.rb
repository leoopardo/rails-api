class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :duration
  has_many :genres, serializer: GenreSerializer
  belongs_to :album, serializer: AlbumSerializer
  belongs_to :band, serializer: BandSerializer
end
