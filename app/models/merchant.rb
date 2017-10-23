class Merchant < ApplicationRecord
  has_many :products

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true

  def join_orderitems
    return Orderitem.joins('join products on orderitems.product_id = products.id').where("products.merchant_id = #{self.id}")
  end
end
