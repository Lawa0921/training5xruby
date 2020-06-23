module ApplicationHelper
  def mission_status_i18n(status)
    I18n.t("mission.#{status}")
  end
  def mission_priority_i18n(priority)
    I18n.t("mission.#{priority}")
  end
end
