feature 'Session Management' do
  scenario 'user signs in with valid credentials' do
    user = create :user
    visit root_path
    click_link "Sign in"

    within('form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password_digest
    end

    click_button "Sign in"

    expect(page).to have_content("You have successfully logged in!")
  end

  scenario 'user signs in with invalid credentials' do
    user = build :user
    visit root_path
    click_link "Sign in"

    within('form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password_digest
    end

    click_button "Sign in"

    expect(page).to have_content("Sign in")
  end

  scenario 'user signs out' do
    user = create :user
    visit root_path(as: user)

    click_link "Sign out"

    expect(page).to have_content("Sign in")
    expect(page).to have_content("You have successfully signed out!")
  end
end
