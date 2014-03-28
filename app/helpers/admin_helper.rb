module AdminHelper
  def li_admin_url_active?
    if params[:controller] == "admin" && params[:action] == "index"
      "active"
    end
  end

  def li_admin_phone_numbers_url_active?
    if params[:controller] == "admin" && params[:action] == "phone_numbers"
      "active"
    end
  end

  def li_admin_survey_items_url_active?
    if params[:controller] == "admin" && params[:action] == "survey_items"
      "active"
    end
  end

  def a_admin_url_active?
    if params[:controller] == "admin" && params[:action] == "index"
      "#"
    else
      admin_url
    end
  end

  def a_admin_phone_numbers_url_active?
    if params[:controller] == "admin" && params[:action] == "phone_numbers"
      "#"
    else
      admin_phone_numbers_url
    end
  end

  def a_admin_survey_items_url_active?
    if params[:controller] == "admin" && params[:action] == "survey_items"
      "#"
    else
      admin_survey_items_url
    end
  end
end
