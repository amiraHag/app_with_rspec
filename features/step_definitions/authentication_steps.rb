Given /^a user visits the signin page$/ do
  visit signin_path
end

When /^he submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^he should see an error message$/ do
  page.should have_selector('div.alert.alert-error')
end

Given /^the user has an account$/ do
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
end

When /^the user submits valid signin information$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password 
  click_button "Sign in"
end

Then /^he should see his profile page$/ do
  page.should have_selector('title', text: "Example User")
end


Given /^a user visits the register page$/ do
  visit register_path
end

When /^he submits invalid register information$/ do
  click_button "Create New Account"
end

Then /^he should see a rgisteration error message$/ do
 page.should have_selector('title', text:"Register")
end

When /^the user submits valid registeration information$/ do
  fill_in "Email",    with: "user@example.com"
  fill_in "Password", with: "foobar" 
  click_button "Create New Account"
end

Then /^he should see a signout link$/ do
  page.should have_link('Sign out',:href => signout_path)
end
