require 'spec_helper'

describe "cars/edit" do
  before(:each) do
    @car = assign(:car, stub_model(Car,
      :carmodel => "MyString",
      :price => "MyString",
      :myear => "MyString",
      :uyear => "MyString",
      :cartype => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit car form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cars_path(@car), :method => "post" do
      assert_select "input#car_carmodel", :name => "car[carmodel]"
      assert_select "input#car_price", :name => "car[price]"
      assert_select "input#car_myear", :name => "car[myear]"
      assert_select "input#car_uyear", :name => "car[uyear]"
      assert_select "input#car_cartype", :name => "car[cartype]"
      assert_select "input#car_user_id", :name => "car[user_id]"
    end
  end
end
