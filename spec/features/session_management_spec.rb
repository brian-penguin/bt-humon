feature 'Session Management' do
  scenario 'user signs in with valid credentials' do
    visit root_path
    click_link 'Sign In'
    sign_in_user

    expect(page).to have_content('Hello')
  end
  xscenario 'user signs in with invalid credentials' do
  end
  xscenario 'user signs out' do
  end
end
