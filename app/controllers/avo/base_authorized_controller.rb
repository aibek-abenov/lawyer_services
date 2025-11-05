class Avo::BaseAuthorizedController < Avo::BaseController
  before_action :restrict_editing_for_non_admins, only: %i[new create edit update destroy]

  private

  def restrict_editing_for_non_admins
    unless current_user&.admin?
      flash[:alert] = "У вас нет прав на изменение данных."
      redirect_back(fallback_location: avo.root_path)
    end
  end
end
