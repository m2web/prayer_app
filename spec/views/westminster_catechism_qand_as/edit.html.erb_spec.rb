require 'spec_helper'

describe "westminster_catechism_qand_as/edit" do
  before(:each) do
    @westminster_catechism_qand_a = assign(:westminster_catechism_qand_a, stub_model(WestminsterCatechismQandA,
      :questionnumber => 1,
      :question => "MyText",
      :answer => "MyText"
    ))
  end

  it "renders the edit westminster_catechism_qand_a form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => westminster_catechism_qand_as_path(@westminster_catechism_qand_a), :method => "post" do
      assert_select "input#westminster_catechism_qand_a_questionnumber", :name => "westminster_catechism_qand_a[questionnumber]"
      assert_select "textarea#westminster_catechism_qand_a_question", :name => "westminster_catechism_qand_a[question]"
      assert_select "textarea#westminster_catechism_qand_a_answer", :name => "westminster_catechism_qand_a[answer]"
    end
  end
end
