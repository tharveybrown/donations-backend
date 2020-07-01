class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :entity
end
