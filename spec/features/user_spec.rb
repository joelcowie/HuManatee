require 'rails_helper'

describe 'index page' do
  it 'has an index page' do
    visit "/users"
    expect(page.status_code).to eq(200)
  end

  it 'shows all users' do
    visit "/users"
    expect(page).to have_content("All Users")
  end
end

describe 'Show page' do
  before do
    @user = User.create!(first_name: "Jon", last_name: "Z", email: "jon@jon.com", password:"joel", password_confirmation:"joel")
  end

  it 'renders properly' do
    visit user_path(@user)
    expect(page.status_code).to eq(200)
  end

  it 'renders the full name in a h2 tag' do
    visit user_path(@user)
    expect(page).to have_css("h2", text: "Jon Z")
  end

  it 'renders the email in a p tag' do
    visit user_path(@user)
    expect(page).to have_css("p", text: "jon@jon.com")
  end

  it 'displays ongoing events' do
    visit user_path(@user)
    expect(page).to have_css("h5", text: "Ongoing Volunteer Events")
  end

  it 'displays upcoming events' do
    visit user_path(@user)
    expect(page).to have_css("h5", text: "Upcoming Volunteer Events")
  end

  it 'displays past events' do
    visit user_path(@user)
    expect(page).to have_css("h5", text: "Past Volunteer Events")
  end
end
