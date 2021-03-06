module ApplicationHelper
  def mission_status_i18n(status)
    I18n.t("mission.statuses.#{status}")
  end
  
  def mission_priority_i18n(priority)
    I18n.t("mission.priorities.#{priority}")
  end

  def i18n_enum(model_name, enum_name, enum_value)
    I18n.t("#{model_name}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end

  def enum_collection(model_name, enum_name)
    @model = model_name.capitalize.constantize
    @model.send(enum_name.to_s.pluralize).keys.collect { |val| [i18n_enum(model_name, enum_name, val), val] }
  end

  def ransack_search_enum(model_name, enum_name)
    enum_collection(model_name, enum_name).map{|enum| [enum[0], @model.send(enum_name.to_s.pluralize)[enum[1]]]}
  end
end
