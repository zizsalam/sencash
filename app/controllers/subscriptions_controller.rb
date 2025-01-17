class SubscriptionsController < ApplicationController
  def new
    if Current.family.stripe_customer_id.blank?
      customer = stripe_client.v1.customers.create(
        email: Current.family.primary_user.email,
        metadata: { family_id: Current.family.id }
      )
      Current.family.update(stripe_customer_id: customer.id)
    end

    session = stripe_client.v1.checkout.sessions.create({
      customer: Current.family.stripe_customer_id,
      line_items: [ {
        price: ENV["STRIPE_PLAN_ID"],
        quantity: 1
      } ],
      mode: "subscription",
      allow_promotion_codes: true,
      success_url: success_subscription_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: settings_billing_url
    })

    redirect_to session.url, allow_other_host: true, status: :see_other
  end

  def show
    portal_session = stripe_client.v1.billing_portal.sessions.create(
      customer: Current.family.stripe_customer_id,
      return_url: settings_billing_url
    )

    redirect_to portal_session.url, allow_other_host: true, status: :see_other
  end

  def success
    checkout_session = stripe_client.v1.checkout.sessions.retrieve(params[:session_id])
    Current.session.update(subscribed_at: Time.at(checkout_session.created))
    redirect_to root_path, notice: "You have successfully subscribed to Sencash+."
  rescue Stripe::InvalidRequestError
    redirect_to settings_billing_path, alert: "Something went wrong processing your subscription. Please contact us to get this fixed."
  end

  private
    def stripe_client
      @stripe_client ||= Stripe::StripeClient.new(ENV["STRIPE_SECRET_KEY"])
    end
end
