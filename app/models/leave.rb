class Leave < ApplicationRecord
  belongs_to :employee

  validates :from_date, :to_date, :reason, presence: true

  validate :validate_date

  def validate_date
    if to_date < from_date
      self.errors.add(:to_date, 'must be less than or equal to from date!')
    end
  end
end
