require 'spec_helper'

describe "westminster_catechism_qand_as/show" do
  before(:each) do
    @westminster_catechism_qand_a = assign(:westminster_catechism_qand_a, stub_model(WestminsterCatechismQandA,
      :questionnumber => 1,
      :question => "MyText",
      :answer => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
