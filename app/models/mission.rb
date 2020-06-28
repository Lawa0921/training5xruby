class Mission < ApplicationRecord
  enum status: ["pending", "working","done"]
  enum priority: ["low", "medium", "high"]
  has_many :mission_tags
  has_many :tags, through: :mission_tags, dependent: :destroy
  belongs_to :user
  validates :name, :status, :priority, :start_at, presence: true

  def self.with_order(order_by)
    if order_by == "priority"
      all.order("#{order_by} DESC")
    else
      all.order(order_by)
    end
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |tag|
      Tag.where(name: tag.strip).first_or_create!
    end
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def self.tagged_with(name)
    Tag.find_by!(name: name).posts
  end
end
