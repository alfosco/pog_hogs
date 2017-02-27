class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  validates :user_id, presence: true

  def total_price
    self.items.reduce(0) do |sum, item|
      sum += item.price
      sum.round(2)
    end
  end

  def count
    self.items.count
  end

  def current_status
    if status == 0
      "Ordered"
    elsif status == 1
      "Paid"
    elsif status == 2
      "Completed"
    else status == 3
      "Cancelled"
    end
  end

  def self.status_ordered
    where("status = '0'").count
  end

  def self.status_paid
    where("status = '1'").count
  end

  def self.status_completed
    where("status = '2'").count
  end

  def self.status_cancelled
    where("status = '3'").count
  end

  def update_at
    if status == 2 || status == 3
       "Order was #{current_status} at #{updated_at.strftime("%l:%M%P, %d %b. %Y")}"
    else
      nil
    end
  end
end
