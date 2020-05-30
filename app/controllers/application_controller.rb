class ApplicationController < ActionController::Base
  layout :set_layout_devise

  def set_layout_devise
    if devise_controller?
      "devise"
    end
  end
end
