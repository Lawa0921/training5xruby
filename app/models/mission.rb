class Mission < ApplicationRecord
  enum status: ["pending", "working","done"]
  enum priority: ["low", "medium", "high"]
  has_many :tags, through: :mission_tags
  belongs_to :user
  validates :name, :status, :priority, :start_at, presence: true

  def self.with_order(order_by)
    if order_by == "priority"
      all.order("#{order_by} DESC")
    else
      all.order(order_by)
    end
  end
end
