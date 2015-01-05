require 'spec_helper'

describe "test_models/index" do
  before(:each) do
    assign(:test_models, [
      stub_model(TestModel,
        :string => "String",
        :string2 => "String2"
      ),
      stub_model(TestModel,
        :string => "String",
        :string2 => "String2"
      )
    ])
  end

  it "renders a list of test_models" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "String2".to_s, :count => 2
  end
end
