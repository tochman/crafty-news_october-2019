# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def new
    @article = Article.find(params[:record])
  end

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      source: stripe_token(params),
      description: 'Crafty News Subscriber'
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 20_000,
      currency: 'sek',
      description: 'Craft News Subscription Purchase'
    )

    if charge[:paid]
      current_user.update_attribute(:subscriber, true)
      article = Article.find(params[:article_id])
      redirect_to article_path(article), notice: 'Thank you for becoming a subscriber'
    else
      redirect_to root_path, notice: 'No cash, no glory!'
    end
  end


  private 

  def stripe_token(params)
    Rails.env.test? ? StripeMock.create_test_helper.generate_card_token : params[:stripeToken]
  end
end
