require 'spec_helper'

describe "westminster_catechism_qand_as/index" do
  before(:each) do
    assign(:westminster_catechism_qand_as, [
      stub_model(WestminsterCatechismQandA,
        :questionnumber => 1,
        :question => "MyText",
        :answer => "MyText"
      ),
      stub_model(WestminsterCatechismQandA,
        :questionnumber => 1,
        :question => "MyText",
        :answer => "MyText"
      )
    ])
  end

  it "renders a list of westminster_catechism_qand_as" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
