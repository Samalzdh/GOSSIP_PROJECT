class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :likes, through: :gossips
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,  uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "entrez une addresse valide" }
  validates :age, presence: true,  numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
end
