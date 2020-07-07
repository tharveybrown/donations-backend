class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :entity
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :entity


end
