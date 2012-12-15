require 'spec_helper'

describe "jm_verses/index" do
  before(:each) do
    assign(:jm_verses, [
      stub_model(JmVerse,
        :verse_month => 1,
        :reference => "Reference",
        :text => "MyText"
      ),
      stub_model(JmVerse,
        :verse_month => 1,
        :reference => "Reference",
        :text => "MyText"
      )
    ])
  end

  it "renders a list of jm_verses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Reference".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
