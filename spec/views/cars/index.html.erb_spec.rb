require 'spec_helper'

describe "cars/index" do
  before(:each) do
    assign(:cars, [
      stub_model(Car,
        :carmodel => "Carmodel",
        :price => "Price",
        :myear => "Myear",
        :uyear => "Uyear",
        :cartype => "Cartype",
        :user_id => 1
      ),
      stub_model(Car,
        :carmodel => "Carmodel",
        :price => "Price",
        :myear => "Myear",
        :uyear => "Uyear",
        :cartype => "Cartype",
        :user_id => 1
      )
    ])
  end

  it "renders a list of cars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Carmodel".to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    assert_select "tr>td", :text => "Myear".to_s, :count => 2
    assert_select "tr>td", :text => "Uyear".to_s, :count => 2
    assert_select "tr>td", :text => "Cartype".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
