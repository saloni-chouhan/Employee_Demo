class Department < ApplicationRecord
  has_many :employees

  validates :name, presence: true
  validates_each :name do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end
end
