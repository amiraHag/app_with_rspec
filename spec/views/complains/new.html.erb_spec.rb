require 'spec_helper'

describe "complains/new" do
  before(:each) do
    assign(:complain, stub_model(Complain,
      :subject => "MyString",
      :detail => "MyString",
      :solution => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new complain form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => complains_path, :method => "post" do
      assert_select "input#complain_subject", :name => "complain[subject]"
      assert_select "input#complain_detail", :name => "complain[detail]"
      assert_select "input#complain_solution", :name => "complain[solution]"
      assert_select "input#complain_user_id", :name => "complain[user_id]"
    end
  end
end
