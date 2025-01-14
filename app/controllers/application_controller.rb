class ApplicationController < ActionController::API
  def paginate(resource, serializer:, per_page: 25)
    paginated_resource = resource.page(params[:page]).per(params[:per_page] || per_page)
    render json: PaginationSerializer.new(
      paginated_resource,
      each_serializer: serializer
    ).as_json
  end
end
