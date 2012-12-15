require 'spec_helper'

describe "jm_verses/new" do
  before(:each) do
    assign(:jm_verse, stub_model(JmVerse,
      :verse_month => 1,
      :reference => "MyString",
      :text => "MyText"
    ).as_new_record)
  end

  it "renders new jm_verse form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jm_verses_path, :method => "post" do
      assert_select "input#jm_verse_verse_month", :name => "jm_verse[verse_month]"
      assert_select "input#jm_verse_reference", :name => "jm_verse[reference]"
      assert_select "textarea#jm_verse_text", :name => "jm_verse[text]"
    end
  end
end
