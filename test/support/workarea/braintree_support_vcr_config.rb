module Workarea
  module BraintreeGatewayVCRConfig
    def self.included(test)
      test.setup :setup_gateway
      test.teardown :reset_gateway
    end

    def setup_gateway
      @_old_gateway = Workarea.config.gateways.credit_card
      Workarea.config.gateways.credit_card = ActiveMerchant::Billing::BraintreeGateway.new(
        merchant_account_id: 'a',
        merchant_id:         'b',
        public_key:          'c',
        private_key:         'd',
        environment:         'sandbox'
      )
    end

    def reset_gateway
      Workarea.config.gateways.credit_card = @_old_gateway
    end
  end
end
