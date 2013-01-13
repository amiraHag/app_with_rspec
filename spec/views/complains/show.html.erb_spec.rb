require 'spec_helper'

describe "complains/show" do
  before(:each) do
    @complain = assign(:complain, stub_model(Complain,
      :subject => "Subject",
      :detail => "Detail",
      :solution => "Solution",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    rendered.should match(/Detail/)
    rendered.should match(/Solution/)
    rendered.should match(/1/)
  end
end
