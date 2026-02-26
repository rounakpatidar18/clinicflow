class User < ApplicationRecord
  belongs_to :clinic

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: { scope: :clinic_id }
end
