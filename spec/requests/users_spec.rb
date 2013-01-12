require 'spec_helper'

describe "Users" do
  
   describe "register page" do
     
     let(:submit) { 'Create New Account' }
    before { visit register_path }

    it { page.should have_content('Registration Form ') }
    it "should have the right title" do
       page.should have_selector('title',
                    :text => "|Register")
    end
    
     it { page.should have_selector('a', :text => 'Register') }

    

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Telephone",         with: "01000000000"
        fill_in "Address",        with: "cairo egypt"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
        
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(0)
      end
    describe "after saving the user" do
         before { click_link "Home" }
        it { page.should_not have_selector('div.alert.alert-error') }
      end
  end
end
    describe "profile page" do
      let(:user) { FactoryGirl.create(:user) }
      before { visit user_path(user) }

     it { page.should have_selector('h1',    :text => user.name) }
     it { page.should have_selector('title', :text => user.name) }
     it { page.should have_content('Profile') }
    
     it { page.should have_selector('a', :text => 'Your Profile') }
   end 
  end