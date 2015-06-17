class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates_presence_of :title, :price, :description
  validates :price, format: { with: /\A\d+\.*\d{0,2}\z/ }

  def average_rating
    reviews.pluck(:rating).sum.to_f / reviews.count
  end
end
