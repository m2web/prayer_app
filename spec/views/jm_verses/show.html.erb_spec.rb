require 'spec_helper'

describe "jm_verses/show" do
  before(:each) do
    @jm_verse = assign(:jm_verse, stub_model(JmVerse,
      :verse_month => 1,
      :reference => "Reference",
      :text => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Reference/)
    rendered.should match(/MyText/)
  end
end
