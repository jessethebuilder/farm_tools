require 'spec_helper'

describe "test_companies/edit" do
  before(:each) do
    @test_company = assign(:test_company, stub_model(TestCompany,
      :name => "MyString"
    ))
  end

  it "renders the edit test_company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", test_company_path(@test_company), "post" do
      assert_select "input#test_company_name[name=?]", "test_company[name]"
    end
  end
end
