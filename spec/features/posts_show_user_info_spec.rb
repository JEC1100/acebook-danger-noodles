require 'rails_helper'

RSpec.feature "user details on posts", type: :feature do
  scenario "user name shows up on posts" do
    visit "/users/sign_up"
    fill_in "user_username", with: "Bob"
    fill_in "user_email", with: "bob@example.com"
    fill_in "user_password", with: "password1!"
    fill_in "user_password_confirmation", with: "password1!"
    click_button "Sign up"

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Bob")
  end
end