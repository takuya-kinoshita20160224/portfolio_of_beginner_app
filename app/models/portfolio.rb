class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :url
    validates :text, length: { maximum: 200 }
    validates :language
  end
end
