class BandsController < ApplicationController
  before_action :set_band, only: %i[show update destroy]

  # GET /bands
  def index
    @bands = Band.all

    render json: @bands.to_json(only: [ :name, :id ], include: { members: { only: [ :name, :id ] }, genres: { only: [ :name, :id ] } },)
  end

  # GET /bands/1
  def show
    render json: @band.to_json(only: [ :name, :id ], include: { members: { only: [ :name, :id ] }, genres: { only: [ :name, :id ] } },)
  end

  # POST /bands
  def create
    @band = Band.new(band_params)

    if @band.save
      render json: @band, status: :created, location: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bands/1
  def update
    if @band.update(band_params)
      render json: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bands/1
  def destroy
    @band.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_band
    @band = Band.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def band_params
    params.require(:band).permit(:name)
  end
end
