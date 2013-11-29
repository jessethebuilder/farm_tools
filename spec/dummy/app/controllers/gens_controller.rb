class GensController < ApplicationController
  before_action :set_gen, only: [:show, :edit, :update, :destroy]

  # GET /gens
  def index
    @gens = Gen.all
  end

  # GET /gens/1
  def show
  end

  # GET /gens/new
  def new
    @gen = Gen.new
  end

  # GET /gens/1/edit
  def edit
  end

  # POST /gens
  def create
    @gen = Gen.new(gen_params)

    if @gen.save
      redirect_to @gen, notice: 'Gen was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /gens/1
  def update
    if @gen.update(gen_params)
      redirect_to @gen, notice: 'Gen was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /gens/1
  def destroy
    @gen.destroy
    redirect_to gens_url, notice: 'Gen was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gen
      @gen = Gen.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gen_params
      params[:gen]
    end
end
