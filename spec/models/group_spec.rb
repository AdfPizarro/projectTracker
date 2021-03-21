require_relative '../rails_helper.rb'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it { should have_one_attached(:image) }
    it { should have_and_belong_to_many(:time_logs).class_name('TimeLog') }
    it { should belong_to(:creator) }
  end
end
