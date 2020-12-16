require 'application_system_test_case'

class TimeLogsTest < ApplicationSystemTestCase
  setup do
    @time_log = time_logs(:one)
  end

  test 'visiting the index' do
    visit time_logs_url
    assert_selector 'h1', text: 'Time Logs'
  end

  test 'creating a Time log' do
    visit time_logs_url
    click_on 'New Time Log'

    fill_in 'Author', with: @time_log.author_id
    fill_in 'Minutes', with: @time_log.minutes
    fill_in 'Name', with: @time_log.name
    click_on 'Create Time log'

    assert_text 'Time log was successfully created'
    click_on 'Back'
  end

  test 'updating a Time log' do
    visit time_logs_url
    click_on 'Edit', match: :first

    fill_in 'Author', with: @time_log.author_id
    fill_in 'Minutes', with: @time_log.minutes
    fill_in 'Name', with: @time_log.name
    click_on 'Update Time log'

    assert_text 'Time log was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Time log' do
    visit time_logs_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Time log was successfully destroyed'
  end
end
