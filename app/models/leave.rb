class Leave < ApplicationRecord
  belongs_to :employee

  validates :from_date, :to_date, :reason, presence: true
end
