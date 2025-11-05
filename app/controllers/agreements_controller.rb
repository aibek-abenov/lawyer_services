class AgreementsController < ApplicationController
  def index
    @agreements ||= Agreement.all.order(created_at: :desc)
  end
end
