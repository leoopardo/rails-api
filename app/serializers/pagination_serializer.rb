class PaginationSerializer < ActiveModel::Serializer
  attr_reader :object, :options

  def initialize(object, options = {})
    @object = object
    @options = options
    super(object, options)
  end

  def as_json(*args)
    {
      data: ActiveModelSerializers::SerializableResource.new(object, options),
      meta: {
          current_page: object.current_page,
          next_page: object.next_page,
          prev_page: object.prev_page,
          total_pages: object.total_pages,
          total_count: object.total_count
      }
    }
  end
end
