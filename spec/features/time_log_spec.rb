require_relative '../rails_helper.rb'

describe 'Capybara time logs', type: :feature do
  before :each do
    @bender = User.create({ username: 'Bender',
                            email: 'bender@gmail.com',
                            password: '123456',
                            password_confirmation: '123456' })
    @fry = User.create({ username: 'Fry',
                         email: 'fry@gmail.com',
                         password: '123456',
                         password_confirmation: '123456' })
    @leela = User.create({ username: 'Leela',
                           email: 'leela@gmail.com',
                           password: '123456',
                           password_confirmation: '123456' })
    visit 'splash'
    click_link 'LOG IN'
    fill_in 'Email', with: 'fry@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    visit 'groups/new'
    fill_in 'group_name', with: 'Fry group'
    attach_file('group_image', Rails.root + 'spec/img/bender.jpeg')
    click_button 'commit'
    visit '/'
    click_link 'Logout'
  end

  describe 'Create logs' do
    before :each do
      visit 'splash'
      click_link 'LOG IN'
      fill_in 'Email', with: 'bender@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'Display username on login' do
      visit '/'
      expect(page).to have_content 'Bender'
    end

    it 'View existing groups' do
      visit '/groups'
      expect(page).to have_content 'Fry group'
    end

    it 'Create a new group (upload image)' do
      visit 'groups/new'
      fill_in 'group_name', with: 'Bender group'
      attach_file('group_image', Rails.root + 'spec/img/bender.jpeg')
      click_button 'commit'
      expect(page).to have_content 'Bender group'
    end

    it 'Create a personal log' do
      visit '/time_logs/new'
      fill_in 'time_log_name', with: 'Taking a nap'
      fill_in 'time_log_minutes', with: '15'
      click_button 'commit'
      expect(page).to have_content 'Log Created'
    end

    it 'Create a log in a group' do
      visit '/time_logs/new'
      fill_in 'time_log_name', with: 'Deliver space pizza'
      fill_in 'time_log_minutes', with: '120'
      check 'time_log_groups_1'
      click_button 'commit'
      expect(page).to have_content 'Log Created'
    end
  end
end
