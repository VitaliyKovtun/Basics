class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, :last_name, presence: true

  def full_name
    [first_name, last_name].join(' ')
  end

  def age
    now = Time.now.utc
    now.year - birth_date.year
  end
end
