require 'spec_helper'

describe "complains/index" do
  before(:each) do
    assign(:complains, [
      stub_model(Complain,
        :subject => "Subject",
        :detail => "Detail",
        :solution => "Solution",
        :user_id => 1
      ),
      stub_model(Complain,
        :subject => "Subject",
        :detail => "Detail",
        :solution => "Solution",
        :user_id => 1
      )
    ])
  end

  it "renders a list of complains" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "Detail".to_s, :count => 2
    assert_select "tr>td", :text => "Solution".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
