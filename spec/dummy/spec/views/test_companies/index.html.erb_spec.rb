require 'spec_helper'

describe "test_companies/index" do
  before(:each) do
    assign(:test_companies, [
      stub_model(TestCompany,
        :name => "Name"
      ),
      stub_model(TestCompany,
        :name => "Name"
      )
    ])
  end

  it "renders a list of test_companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
