class Mission < ApplicationRecord
  enum status: [I18n.t('mission.pending'), I18n.t('mission.working'), I18n.t('mission.done')]
  enum order: [I18n.t("mission.low"), I18n.t("mission.medium"), I18n.t("mission.high")]
  has_many :tags, through: :mission_tag, dependent: :destroy

  validates :name, :status, :order, :status, :start_at, presence: true
end
