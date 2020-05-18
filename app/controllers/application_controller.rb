# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def not_authorized(exception)
    if exception.policy.class == ArticlePolicy && exception.query == 'show?'
      redirect_to new_subscription_path(record: exception.record.id), notice: 'You have to purchase a subscrition to read this article'
    else
      redirect_to root_path, notice: 'You are not authorized to do that'
    end
  end
end
