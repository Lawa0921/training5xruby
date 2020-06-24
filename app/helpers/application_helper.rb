module ApplicationHelper
  def mission_status_i18n(status)
    I18n.t("mission.#{status}")
  end
  
  def mission_priority_i18n(priority)
    I18n.t("mission.#{priority}")
  end

  def status_with_i18n
    Mission.statuses.map {|status| mission_status_i18n(status[0])}
  end
end
