require_relative '../rails_helper.rb'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:time_logs) }
  end
end
