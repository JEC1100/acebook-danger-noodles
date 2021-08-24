require 'rails_helper'
require 'feature_test_helpers'

feature 'User navigation' do

  scenario 'clicking on an avatar or username takes you to the profile of the user' do
    # user signs up with an avatar (using factory bot so they have id of 1)
    create(:user)
    visit "/users/sign_in"
    fill_in "user_email", with: "email@email.com"
    fill_in "user_password", with: "password"
    click_button "Log in"
    # user 1 creates post so their icon can be clicked on
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link 'Log Out'

    #another user signs up and clicks on user 1's avatar
    visit "/users/sign_up"
    fill_in "user_username", with: "Other account"
    fill_in "user_email", with: "otheraccount@example.com"
    fill_in "user_password", with: "password1!"
    fill_in "user_password_confirmation", with: "password1!"
    click_button 'Sign up'
    visit '/posts'
    find('.user-avatar-link').click
    # it takes them to user 1's profile page
    expect(current_path).to eq('/users/1')
    expect(page).to have_content 'Test'
  end

end