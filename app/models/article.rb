class Article < ApplicationRecord
  validates :title, presence: true,
                    length: {minimum: 3, maximum: 60}
  validates :description, presence: true,
                          length: {minimum: 10, maximum: 300}

  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
end
