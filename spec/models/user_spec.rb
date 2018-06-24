require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:profile).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to accept_nested_attributes_for(:profile) }
    it { is_expected.to validate_length_of(:password) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:encrypted_password) }
    it { is_expected.to allow_value('email@email.com').for(:email) }
    it { is_expected.to allow_value('Password12345678').for(:password) }
    it { is_expected.to_not allow_value('email.com').for(:email) }
    it { is_expected.to_not allow_value('email@email').for(:email) }
    it { is_expected.to_not allow_value('password').for(:password) }
    it { is_expected.to_not allow_value('password12345678').for(:password) }
  end
end
