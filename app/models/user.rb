class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum kind: [:admin, :supervisor]

  scope :supervisors, -> { where(kind: 1)}

  belongs_to :turn
  belongs_to :team
  
  has_many :occurrencies
end
