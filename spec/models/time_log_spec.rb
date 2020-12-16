require_relative '../rails_helper.rb'

RSpec.describe TimeLog, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:groups).class_name('Group') }
    it { should belong_to(:user).class_name(User.name) }
  end
end
