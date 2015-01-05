require 'spec_helper'

describe "test_models/show" do
  before(:each) do
    @test_model = assign(:test_model, stub_model(TestModel,
      :string => "String",
      :string2 => "String2"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/String/)
    rendered.should match(/String2/)
  end
end
