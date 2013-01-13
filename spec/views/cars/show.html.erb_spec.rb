require 'spec_helper'

describe "cars/show" do
  before(:each) do
    @car = assign(:car, stub_model(Car,
      :carmodel => "Carmodel",
      :price => "Price",
      :myear => "Myear",
      :uyear => "Uyear",
      :cartype => "Cartype",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Carmodel/)
    rendered.should match(/Price/)
    rendered.should match(/Myear/)
    rendered.should match(/Uyear/)
    rendered.should match(/Cartype/)
    rendered.should match(/1/)
  end
end
