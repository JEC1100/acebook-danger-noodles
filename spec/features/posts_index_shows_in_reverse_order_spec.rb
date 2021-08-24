require 'rails_helper'


RSpec.feature "Timeline", type: :feature do
  scenario "posts are viewed in reverse order" do
    visit "/users/sign_up"
    fill_in "user_username", with: "Bob"
    fill_in "user_email", with: "bob@example.com"
    fill_in "user_password", with: "password1!"
    fill_in "user_password_confirmation", with: "password1!"
    click_button "Sign up"
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    visit "/posts/new"
    fill_in "Message", with: "Hello, again!"
    click_button "Submit"
    expect(current_path).to eq '/posts'
    expect(page.first('div.post_message').text).to have_content 'Hello, again!'
  end
end