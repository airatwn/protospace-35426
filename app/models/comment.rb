class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype

  #validates :カラム名, バリデーションの種類
  validates :comment, presence: true
end
