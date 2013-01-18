require 'spec_helper'

describe Car do
  before { @car = Car.new(carmodel: "bmw", cartype: "used" , myear: 2012 , uyear: 12 , price: 5000, user_id: 1) }

  subject { @car }

  it { should respond_to(:carmodel) }
  it { should respond_to(:cartype) }
  it { should respond_to(:myear) }
  it { should respond_to(:uyear) }
  it { should respond_to(:price) }
  it { should respond_to(:user_id) }
  

  describe "when carmodel is not present" do
    before { @car.carmodel = " " }
    it { should_not be_valid }
  end
 describe "when cartype is not present" do
    before { @car.cartype = " " }
    it { should_not be_valid }
  end
  describe "when myear is not present" do
    before { @car.myear = " " }
    it { should_not be_valid }
  end
  describe "when uyear is not present" do
    before { @car.uyear = " " }
    it { should_not be_valid }
  end
  describe "when user_id is not present" do
    before { @car.user_id = " " }
    it { should_not be_valid }
  end
  describe "when price is not present" do
    before { @car.price = " " }
    it { should_not be_valid }
  end
  
  describe "when carmodel is too long" do
    before { @car.carmodel = "a" * 31 }
    it { should_not be_valid }
  end
  
  describe "when cartype is too long" do
    before { @car.cartype = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when myear is too long" do
    before { @car.myear = "a" * 5 }
    it { should_not be_valid }
  end
   
end
