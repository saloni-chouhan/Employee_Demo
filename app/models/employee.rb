class Employee < ApplicationRecord
  belongs_to :department
  has_many :leaves, class_name: "Leave", dependent: :destroy

  enum gender: { female: "female", male: "male" }

  validates :name, :email, :phone_number, presence: true
  validates :phone_number, length: { is: 10 }, numericality: { only_integer: true }
  validates_each :name do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end
end
