class FarmSlugTestObjectsController < ApplicationController
  before_action :set_farm_slug_test_object, only: [:show, :edit, :update, :destroy]

  # GET /farm_slug_test_objects
  def index
    @farm_slug_test_objects = FarmSlugTestObject.all
  end

  # GET /farm_slug_test_objects/1
  def show
  end

  # GET /farm_slug_test_objects/new
  def new
    @farm_slug_test_object = FarmSlugTestObject.new
  end

  # GET /farm_slug_test_objects/1/edit
  def edit
  end

  # POST /farm_slug_test_objects
  def create
    @farm_slug_test_object = FarmSlugTestObject.new(farm_slug_test_object_params)

    if @farm_slug_test_object.save
      redirect_to @farm_slug_test_object, notice: 'Farm slug test object was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /farm_slug_test_objects/1
  def update
    if @farm_slug_test_object.update(farm_slug_test_object_params)
      redirect_to @farm_slug_test_object, notice: 'Farm slug test object was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /farm_slug_test_objects/1
  def destroy
    @farm_slug_test_object.destroy
    redirect_to farm_slug_test_objects_url, notice: 'Farm slug test object was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm_slug_test_object
      @farm_slug_test_object = FarmSlugTestObject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def farm_slug_test_object_params
      params.require(:farm_slug_test_object).permit(:url_slug, :caption)
    end
end
