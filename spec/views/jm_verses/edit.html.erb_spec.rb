require 'spec_helper'

describe "jm_verses/edit" do
  before(:each) do
    @jm_verse = assign(:jm_verse, stub_model(JmVerse,
      :verse_month => 1,
      :reference => "MyString",
      :text => "MyText"
    ))
  end

  it "renders the edit jm_verse form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jm_verses_path(@jm_verse), :method => "post" do
      assert_select "input#jm_verse_verse_month", :name => "jm_verse[verse_month]"
      assert_select "input#jm_verse_reference", :name => "jm_verse[reference]"
      assert_select "textarea#jm_verse_text", :name => "jm_verse[text]"
    end
  end
end
