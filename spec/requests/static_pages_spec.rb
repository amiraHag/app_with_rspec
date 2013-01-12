require 'spec_helper'
describe "Static pages" do
  shared_examples_for "static_pages" do
    it { page.should have_selector('a',    :text => page_link) }
    it "should have the right title" do
       page.should have_selector('title',
                    :text => page_title)
    end
    it { page.should have_content(content) }
    
    it "should have the right links on the layout" do
    click_link "About Us"
    page.should have_selector('title',    :text => "About Us")
    click_link "Help"
    page.should have_selector('title',    :text => "Help")
    click_link "Contact Us"
    page.should have_selector('title',    :text => "Contact us")
    click_link "Home"
    page.should have_selector('title',    :text => "Home")
    click_link "Register"
    page.should have_selector('title',    :text => "Register")
    click_link "Sign In"
    page.should have_selector('title',    :text => "Sign in")
  end
  end

  describe "Home page" do
     before { visit home_path }
    let(:page_link)    { 'Home' }
    let(:page_title) { '|Home' }
     let(:content) { 'Welcome To Car Website' }
    it_should_behave_like "static_pages"
  end
    
  describe "about page" do
     before { visit about_path }
     let(:page_link)    { 'About' }
     let(:page_title) { '|About Us' }
     let(:content) { 'About Us' }
     it_should_behave_like "static_pages"
  end
  describe "contact page" do
     before { visit contact_path }
     let(:page_link)    { 'Contact' }
     let(:page_title) { '|Contact us' }
     let(:content) { 'Our Contact Information' }
    it_should_behave_like "static_pages"
  end

  describe "Help page" do
     before { visit help_path }
     let(:page_link)    { 'Help' }
     let(:page_title) { '|Help' }
     let(:content) { 'Technical solution to your problems' }
    it_should_behave_like "static_pages"
  end

end