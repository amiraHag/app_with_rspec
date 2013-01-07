require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Welcome To Car Website'" do
      visit '/static_pages/home'
      page.should have_content('Welcome To Car Website')
    end
    it "should have the right title" do
       visit '/static_pages/home'
       page.should have_selector('title',
                    :text => "|Home")
    end
    it "should have the a 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('a', :text => 'Home')
    end
  end
  describe "about page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/home'
      page.should have_content('About Us')
    end
    it "should have the right title" do
       visit '/static_pages/about'
       page.should have_selector('title',
                    :text => "|About Us")
    end
    it "should have the a 'about us'" do
      visit '/static_pages/about'
      page.should have_selector('a', :text => 'About')
    end
  end
  describe "contact page" do

    it "should have the content 'Our Contact Information'" do
      visit '/static_pages/contact'
      page.should have_content('Our Contact Information')
    end
    it "should have the right title" do
       visit '/static_pages/contact'
       page.should have_selector('title',
                    :text => "|Contact us")
    end
    it "should have the a 'contact'" do
      visit '/static_pages/contact'
      page.should have_selector('a', :text => 'Contact_us')
    end
  end

  describe "Help page" do

    it "should have the content 'Technical solution to your problems'" do
      visit '/static_pages/help'
      page.should have_content('Technical solution to your problems')
    end
    it "should have the right title" do
       visit '/static_pages/help'
       page.should have_selector('title',
                    :text => "|Help")
    end
    it "should have the a 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('a', :text => 'Help')
    end
  end

end