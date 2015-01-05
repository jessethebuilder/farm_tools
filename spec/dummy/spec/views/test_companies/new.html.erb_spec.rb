require 'spec_helper'

describe "test_companies/new" do
  before(:each) do
    assign(:test_company, stub_model(TestCompany,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new test_company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", test_companies_path, "post" do
      assert_select "input#test_company_name[name=?]", "test_company[name]"
    end
  end
end
