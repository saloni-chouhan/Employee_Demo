class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :department
  has_many :leaves, class_name: "Leave", dependent: :destroy

  enum gender: { female: "female", male: "male" }

  enum role: [:employee, :admin]

  validates :name, :email, :phone_number, presence: true
  validates :phone_number, length: { is: 10 }, numericality: { only_integer: true }
  validates_each :name do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end

    def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "date_of_joining", "department_id", "designation", "dob", "email", "gender", "id", "name", "phone_number", "role", "updated_at"]
    end
    def self.ransackable_associations(auth_object = nil)
      ["department", "leaves"]
    end
end
