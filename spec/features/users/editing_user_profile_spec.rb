require 'rails_helper'

feature 'Changing profile details' do
  scenario 'User can change details and it appears on the profile' do
    user_sign_up
    click_link 'Profile'
    find('.edit-profile').click
    expect(page).to have_content 'Bio'
    fill_in 'user[username]', with: 'This is not Bob'
    fill_in 'user[bio]', with: 'This is my first bio'
    attach_file("user[avatar]", './spec/files/zuckerberg.jpeg')
    click_button('Submit')
    expect(page).to have_content 'This is not Bob'
    expect(page).to have_content 'This is my first bio'
    expect(page).to have_css("img[src*='zuckerberg.jpeg']")
  end
 
end