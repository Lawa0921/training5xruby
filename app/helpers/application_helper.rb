module ApplicationHelper
  def mission_status_i18n(status)
    I18n.t("mission.statuses.#{status}")
  end
  
  def mission_priority_i18n(priority)
    I18n.t("mission.priorities.#{priority}")
  end

  def status_with_i18n
    Mission.statuses.map {|status| mission_status_i18n(status[0])}
  end

  def priority_with_i18n
    Mission.priorities.map {|priority| mission_priority_i18n(priority[0])}
  end

  def mission_status_with_i18n
    Mission.statuses.keys.collect { |status| [Mission.human_enum_name(:status, status), status] }
  end

  def mission_priority_with_i18n
    Mission.priorities.keys.collect { |priority| [Mission.human_enum_name(:priority, priority), priority] }
  end
end
