require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe '.full_name' do
    let(:profile) { create(:profile) }

    subject { profile.full_name }

    it { is_expected.to eq("#{profile.first_name} #{profile.last_name}") }
  end

  describe '.age' do
    let(:profile) { create(:profile) }

    subject { profile.age }

    it { is_expected.to eq(33) }
  end
end
