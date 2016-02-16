class Article < ActiveRecord::Base

  belongs_to :category
  has_many :order_items

  default_scope { where(active: true)}

  enum colour: [:black, :white, :red]
  enum size: [:S, :M, :L, :XL, :XXL]

  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
      :with => %r{\.(gif|jpg|png)}i,
      :message => 'must be a URL for GIF, JPG or PNG image'
  }

end
