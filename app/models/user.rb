class User < ApplicationRecord
  has_secure_password
  has_many :expenses
  has_many :entities, through: :expenses
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def full_name
    `#{self.first_name} #{self.last_name}`
  end

end
