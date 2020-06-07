class ApplicationController < ActionController::Base
  layout :set_layout_devise

  def set_layout_devise
    if devise_controller?
      "devise"
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', notice: 'Acesso negado !'
  end

  rescue_from StandardError do |exception|
    redirect_to index_path("#{params[:model_name]}"), notice: "#{exception}"
  end

  rescue_from ActionController::RoutingError do |exception|
    redirect_to '/', notice: "Página não foi encontrada !"
  end
end
