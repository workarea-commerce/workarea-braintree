require "workarea/braintree/engine"
require "workarea/braintree/version"

require "active_merchant/billing/bogus_braintree_gateway"

module Workarea
  module Braintree
    def self.auto_configure_gateway
      if Rails.application.secrets.braintree.present?
        self.gateway = ActiveMerchant::Billing::BraintreeGateway.new(
          Rails.application.secrets.braintree.deep_symbolize_keys
        )
      else
        self.gateway = ActiveMerchant::Billing::BogusBraintreeGateway.new
      end
    end

    def self.gateway
      Workarea.config.gateways.credit_card
    end

    def self.gateway=(gateway)
      Workarea.config.gateways.credit_card = gateway
    end
  end
end
