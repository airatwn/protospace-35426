class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :nickname, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :user, presence: true
  validates :profile, presence: true
  validates :affiliation, presence: true
  validates :job_title  , presence: true

  has_many :prototypes
  has_many :comments
end
