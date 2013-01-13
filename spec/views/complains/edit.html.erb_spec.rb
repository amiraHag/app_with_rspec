require 'spec_helper'

describe "complains/edit" do
  before(:each) do
    @complain = assign(:complain, stub_model(Complain,
      :subject => "MyString",
      :detail => "MyString",
      :solution => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit complain form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => complains_path(@complain), :method => "post" do
      assert_select "input#complain_subject", :name => "complain[subject]"
      assert_select "input#complain_detail", :name => "complain[detail]"
      assert_select "input#complain_solution", :name => "complain[solution]"
      assert_select "input#complain_user_id", :name => "complain[user_id]"
    end
  end
end
