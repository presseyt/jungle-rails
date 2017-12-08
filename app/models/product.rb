class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :ratings

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def average_rating_string
    if (self.ratings.length > 0)
      "#Average Rating: #{self.ratings.average(:rating).to_f.round(1)}/5"
    else
      "Be the first to rate this product!"
    end
  end

end
