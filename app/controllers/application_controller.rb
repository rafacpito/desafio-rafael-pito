class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found(e)
    redirect_to citizens_path, alert: t('activerecord.exceptions.not_found', model_name: e.model.constantize.model_name.human)
  end
end
