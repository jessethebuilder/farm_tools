class TestCompaniesController < ApplicationController
  before_action :set_test_company, only: [:show, :edit, :update, :destroy]

  # GET /test_companies
  def index
    @test_companies = TestCompany.all
  end

  # GET /test_companies/1
  def show
  end

  # GET /test_companies/new
  def new
    @test_company = TestCompany.new
  end

  # GET /test_companies/1/edit
  def edit
  end

  # POST /test_companies
  def create
    @test_company = TestCompany.new(test_company_params)

    if @test_company.save
      redirect_to @test_company, notice: 'Test company was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /test_companies/1
  def update
    if @test_company.update(test_company_params)
      redirect_to @test_company, notice: 'Test company was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /test_companies/1
  def destroy
    @test_company.destroy
    redirect_to test_companies_url, notice: 'Test company was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_company
      @test_company = TestCompany.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def test_company_params
      params.require(:test_company).permit(:name)
    end
end
