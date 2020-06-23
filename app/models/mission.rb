class Mission < ApplicationRecord
  enum status: [I18n.t('mission.pending'), I18n.t('mission.working'), I18n.t('mission.done')]
  enum order: [I18n.t("mission.low"), I18n.t("mission.medium"), I18n.t("mission.high")]
  has_many :tags, through: :mission_tags

  validates :name, :status, :order, :start_at, presence: true
  scope :with_order, lambda { |order_by| all.order(order_by)}
end
