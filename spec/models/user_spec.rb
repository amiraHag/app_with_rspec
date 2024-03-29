require 'spec_helper'

describe User do
   before { @user = User.new(name: "Example User", email: "user@example.com" , telephone: 01300000000 , address: "User Address" , password: "User password", password_confirmation: "User password") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:telephone) }
  it { should respond_to(:address) }
  it { should respond_to(:password) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
   
  

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
 describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  describe "when telephone is not present" do
    before { @user.telephone = " " }
    it { should_not be_valid }
  end
  describe "when address is not present" do
    before { @user.address = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @user.name = "a" * 31 }
    it { should_not be_valid }
  end
  
  describe "when email is too long" do
    before { @user.email = "a" * 36 }
    it { should_not be_valid }
  end
  describe "when address is too long" do
    before { @user.address = "a" * 51 }
    it { should_not be_valid }
  end
    describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end      
    end
  end
 describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end
  describe "when telephone is already taken" do
    before do
      user_with_same_telephone = @user.dup
      user_with_same_telephone.save
    end

    it { should_not be_valid }
  end

describe "when password is not present" do
  before { @user.password = @user.password_confirmation = " " }
  it { should_not be_valid }
  end
   describe "when password doesn't match confirmation" do
     before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end
    describe "when password confirmation is nil" do
      before { @user.password_confirmation = nil }
      it { should_not be_valid }
      end
       describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
  describe "remember token" do
    before { @user.save }
    its(:remember_token) { @user.should_not be_blank }
  end
end
