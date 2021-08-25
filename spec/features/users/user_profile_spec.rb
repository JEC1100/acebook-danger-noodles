require 'rails_helper'
require 'feature_test_helpers'

feature 'User Profile' do
  scenario 'clicking on profile icon will take you to profile' do
    user_sign_up
    click_link 'Profile'
    expect(page).to have_content 'Bob'
  end
  scenario 'you can see a users posts on their profile' do
    user_sign_up
    visit '/posts/new'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Profile'
    expect(page).to have_content 'Hello, world!'
  end
end
