describe "Authentication" do

  describe "signin page" do
    before { visit signin_path }
    
     describe "with invalid information" do
      before { click_button "Sign in" }

   it { page.should have_selector('h1',    :text => 'Sign in') }
   it { page.should have_selector('title', :text =>'Sign in') }
   it { page.should have_selector('div.alert.alert-error', :text =>'Invalid') }
    end
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end
      it { page.should have_selector('title', :text => user.name) }
      it { page.should have_link('Profile', :href => user_path(user)) }
      it { page.should have_link('Sign out', :href => signout_path) }
      it { page.should_not have_link('Sign in', :href => signin_path) }
      describe "followed by signout" do
        before { click_link "Sign out"}
        it { page.should_not have_link('Sign in', :href => signin_path) }
      end
    end 
  end
end