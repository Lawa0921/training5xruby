class Mission < ApplicationRecord
  enum status: [I18n.t('mission.pending'), I18n.t('mission.working'), I18n.t('mission.done')]
  enum priority: [I18n.t("mission.low"), I18n.t("mission.medium"), I18n.t("mission.high")]
  has_many :tags, through: :mission_tags
  validates :name, :status, :order, :start_at, presence: true

  def self.with_order(order_by)
    if order_by == "priority"
      all.order("#{order_by} DESC")
    else
      all.order(order_by)
    end
  end
end
