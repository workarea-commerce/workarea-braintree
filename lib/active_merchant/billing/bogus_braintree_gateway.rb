module ActiveMerchant
  module Billing
    class BogusBraintreeGateway < BogusGateway
      def initialize(options = {})
        #noop
      end

      def authorize(money, credit_card_or_vault_id, options = {})
        case normalize(credit_card_or_vault_id)
        when /1$/
          succuessful_auth_response
        when /2$/
          Response.new(false, FAILURE_MESSAGE, { authorized_amount: money, error: FAILURE_MESSAGE }, { test: true, error_code: STANDARD_ERROR_CODE[:processing_error] })
        else
          raise Error, error_message(credit_card_or_vault_id)
        end
      end

      def capture(money, authorization, options = {})
        params = {
          "customer_vault_id" => nil,
          "braintree_transaction" => {
            "order_id" => nil,
            "status"   => "submitted_for_settlement",
            "credit_card_details" => {
              "masked_number" => "411111******1111",
              "bin"           => "411111",
              "last_4"        => "1111",
              "card_type"     => "Visa",
              "token"         => nil
            },
            "customer_details" => {
              "id"    => nil,
              "email" => nil
            },
            "billing_details" => {
              "street_address"   => "22 South 3rd St",
              "extended_address" => nil,
              "company"          => nil,
              "locality"         => "Philadelphia",
              "region"           => "PA",
              "postal_code"      => "19106",
              "country_name"     => "United States of America"
            },
            "shipping_details" => {
              "street_address"   => nil,
              "extended_address" => nil,
              "company"          => nil,
              "locality"         => nil,
              "region"           => nil,
              "postal_code"      => nil,
              "country_name"     => nil
            },
            "vault_customer"          => nil,
            "merchant_account_id"     => "a",
            "processor_response_code" => "1000"
          }
        }
        Response.new(true, SUCCESS_MESSAGE, params, test: true)
      end

      def purchase(money, credit_card_or_vault_id, options = {})
        case normalize(credit_card_or_vault_id)
        when /1$/
          succuessful_purchase_response
        when /2$/
          Response.new(false, FAILURE_MESSAGE, { paid_amount: money, error: FAILURE_MESSAGE }, { test: true, error_code: STANDARD_ERROR_CODE[:processing_error] })
        else
          raise Error, error_message(credit_card_or_vault_id)
        end
      end

      def refund(*args)
        params = {
          "braintree_transaction" => {
            "order_id" => nil,
            "status"   => "submitted_for_settlement",
            "credit_card_details" => {
              "masked_number" => "424242******4242",
              "bin"           => "424242",
              "last_4"        => "4242",
              "card_type"     => "Visa",
              "token"         => nil
            },
            "customer_details" => {
              "id"    => nil,
              "email" => nil
            },
            "billing_details" => {
              "street_address"   => nil,
              "extended_address" => nil,
              "company"          => nil,
              "locality"         => "Philadelphia",
              "region"           => nil,
              "postal_code"      => nil,
              "country_name"     => "United States of America"
            },
            "shipping_details" => {
              "street_address" => nil,
              "extended_address" => nil,
              "company" => nil,
              "locality" => nil,
              "region" => nil,
              "postal_code" => nil,
              "country_name" => nil
            },
            "vault_customer"          => nil,
            "merchant_account_id"     => "a",
            "processor_response_code" => "1002"
          }
        }
        Response.new(true, SUCCESS_MESSAGE, params, test: true)
      end

      def store(paysource, options = {})
        params = {
          "braintree_customer" => {
            "email"      => "user@a.com",
            "first_name" => "Bob",
            "last_name"  => "Bobsen",
            "id"         => "65236875",
            "credit_cards" => [
              {
                "bin"             => "424242",
                "expiration_date" => "08/2022",
                "token"           => "f94qx1",
                "last_4"          => "4242",
                "card_type"       => "Visa",
                "masked_number"   => "424242******4242"
              }
            ]
          },
          "customer_vault_id" => "65236875",
          "credit_card_token" => "f94qx1"
        }

        case normalize(paysource)
        when /1$/
          Response.new(true, SUCCESS_MESSAGE, params, test: true)
        when /2$/
          Response.new(false, FAILURE_MESSAGE, { billingid: nil, error: FAILURE_MESSAGE }, { test: true, error_code: STANDARD_ERROR_CODE[:processing_error] })
        else
          raise Error, error_message(paysource)
        end
      end

      def void(authorization, options = {})
        params = {
          "braintree_transaction" => {
            "order_id" => nil,
            "status"   => "voided",
            "credit_card_details" => {
              "masked_number" => "424242******4242",
              "bin"           => "424242",
              "last_4"        => "4242",
              "card_type"     => "Visa",
              "token"         => nil
            },
            "customer_details" => {
              "id" => nil,
              "email" => nil
            },
            "billing_details" => {
              "street_address"   => nil,
              "extended_address" => nil,
              "company"          => nil,
              "locality"         => nil,
              "region"           => nil,
              "postal_code"      => nil,
              "country_name"     => nil
            },
            "shipping_details" => {
              "street_address"   => nil,
              "extended_address" => nil,
              "company"          => nil,
              "locality"         => nil,
              "region"           => nil,
              "postal_code"      => nil,
              "country_name"     => nil
            },
            "vault_customer"          => nil,
            "merchant_account_id"     => "a",
            "processor_response_code" => "1000"
          }
        }
        Response.new(true, SUCCESS_MESSAGE, params, test: true)
      end

      def method_missing(method, *args)
        return Response.new(true, "Bogus Gateway: Forced success", {}, { test: true }) if self.class.supported_methods.include?(method)
        super
      end

      private

        def succuessful_auth_response
          params = {
            "customer_vault_id" => "65236875",
            "braintree_transaction" => {
              "order_id" => nil,
              "status"   => "authorized",
              "credit_card_details" => {
                "masked_number" => "424242******4242",
                "bin"           => "424242",
                "last_4"        => "4242",
                "card_type"     => "Visa",
                "token"         => 1
              },
              "customer_details" => {
                "id"    => nil,
                "email" => nil
              },
              "billing_details" => {
                "street_address"   => "22 South 3rd St",
                "extended_address" => nil,
                "company"          => "WebLinc",
                "locality"         => "Philadelphia",
                "region"           => "PA",
                "postal_code"      => "19106",
                "country_name"     => "United States of America"
              },
              "shipping_details" => {
                "street_address"          => nil,
                "extended_address"        => nil,
                "company"                 => nil,
                "locality"                => nil,
                "region"                  => nil,
                "postal_code"             => nil,
                "country_name"            => nil
              },
              "vault_customer"          => nil,
              "merchant_account_id"     => "a",
              "processor_response_code" => "1000"
            }
          }
          Response.new(true, SUCCESS_MESSAGE, params, test: true)
        end

        def succuessful_purchase_response
          params = {
            "customer_vault_id" => "65236875",
            "braintree_transaction" => {
              "order_id" => nil,
              "status"   => "authorized",
              "credit_card_details" => {
                "masked_number" => "424242******4242",
                "bin"           => "424242",
                "last_4"        => "4242",
                "card_type"     => "Visa",
                "token"         => "1"
              },
              "customer_details" => {
                "id"    => nil,
                "email" => nil
              },
              "billing_details" => {
                "street_address"   => "22 South 3rd St",
                "extended_address" => nil,
                "company"          => "WebLinc",
                "locality"         => "Philadelphia",
                "region"           => "PA",
                "postal_code"      => "19106",
                "country_name"     => "United States of America"
              },
              "shipping_details" => {
                "street_address"   => nil,
                "extended_address" => nil,
                "company"          => nil,
                "locality"         => nil,
                "region"           => nil,
                "postal_code"      => nil,
                "country_name"     => nil
              },
              "vault_customer"          => nil,
              "merchant_account_id"     => "a",
              "processor_response_code" => "1000",
              "submit_for_settlement"   => true
            }
          }
          Response.new(true, SUCCESS_MESSAGE, params, test: true)
        end
    end
  end
end
