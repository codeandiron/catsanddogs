class AnimalAreasController < ApplicationController
  before_action :set_animal_area, only: [:show, :edit, :update, :destroy]

  # GET /animal_areas
  # GET /animal_areas.json
  def index
    @animal_areas = AnimalArea.all
  end

  def areas
    @animal_areas = AnimalArea.all
    @areas= []
    @animal_areas.each do |area|
      total = area.cats + area.dogs
      @areas << {
        data: {
        lng: area.longitude,
        lat: area.latitude,
        radius: (area.cats + area.dogs)/1.5
        },
        options: {
        strokeColor: "#0000",
        strokeOpacity: 1,
        strokeWeight: 1,
        fillColor: "#%02x%02x%02x" % [(area.cats.to_f/total)*255, 0, (area.dogs.to_f/total)*255],
        fillOpacity: 0.7
        }
      }
    end
    render json: @areas
  end

  # GET /animal_areas/1
  # GET /animal_areas/1.json
  def show
  end

  # GET /animal_areas/new
  def new
    @animal_area = AnimalArea.new
  end

  # GET /animal_areas/1/edit
  def edit
  end

  # POST /animal_areas
  # POST /animal_areas.json
  def create
    @animal_area = AnimalArea.new(animal_area_params)

    respond_to do |format|
      if @animal_area.save
        format.html { redirect_to @animal_area, notice: 'Animal area was successfully created.' }
        format.json { render action: 'show', status: :created, location: @animal_area }
      else
        format.html { render action: 'new' }
        format.json { render json: @animal_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animal_areas/1
  # PATCH/PUT /animal_areas/1.json
  def update
    respond_to do |format|
      if @animal_area.update(animal_area_params)
        format.html { redirect_to @animal_area, notice: 'Animal area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @animal_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animal_areas/1
  # DELETE /animal_areas/1.json
  def destroy
    @animal_area.destroy
    respond_to do |format|
      format.html { redirect_to animal_areas_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_animal_area
    @animal_area = AnimalArea.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def animal_area_params
    params.require(:animal_area).permit(:forward_sorting_area, :dogs, :cats, :latitude, :longitude)
  end
end
