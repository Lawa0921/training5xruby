module ApplicationHelper
  def mission_status_i18n(status)
    I18n.t("mission.statuses.#{status}")
  end
  
  def mission_priority_i18n(priority)
    I18n.t("mission.priorities.#{priority}")
  end

  def human_enum_name(model, attr)
    I18n.t("#{model.model_name.i18n_key}.#{attr.to_s}.#{model.send(attr)}")
  end
end
