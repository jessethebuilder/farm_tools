require 'spec_helper'

describe "test_companies/show" do
  before(:each) do
    @test_company = assign(:test_company, stub_model(TestCompany,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
