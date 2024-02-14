# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |ex|
    render_json_error(ex.message, :unprocessable_entity)
  end

  rescue_from ActionController::ParameterMissing do |ex|
    render_json_error(ex.message, :bad_request)
  end

  protected

  def update_last_seen_at
    current_user.touch :last_seen_at unless current_user.online? # rubocop:disable Rails/SkipsModelValidations
  end

  def render_json_error(msg, code)
    render json: { ok: false, reason: msg }, status: code
  end

  def render_success(msg, code)
    render json: { ok: true, _message: msg }, status: code
  end

  def raise_if_blank(resource, name)
    return if resource.present?
    raise ActiveRecord::RecordNotFound, I18n.t('not_found', resource: name)
  end
end
