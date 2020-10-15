class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :portfolio

  validates :message, presence: true
end
