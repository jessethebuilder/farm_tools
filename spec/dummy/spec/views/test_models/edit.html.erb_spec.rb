require 'spec_helper'

describe "test_models/edit" do
  before(:each) do
    @test_model = assign(:test_model, stub_model(TestModel,
      :string => "MyString",
      :string2 => "MyString"
    ))
  end

  it "renders the edit test_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", test_model_path(@test_model), "post" do
      assert_select "input#test_model_string[name=?]", "test_model[string]"
      assert_select "input#test_model_string2[name=?]", "test_model[string2]"
    end
  end
end
