# Workarea Braintree

Braintree plugin for the Workarea platform.

## Control Panel Login Information

To access the control panel when testing login with the credentials below:

    email: balexander@weblinc.com
    password: w3bl1nc!

## Secrets

Most of the keys below can be found in the Braintree control panel under Account.
Merchant account id can be found under Settings -> Processing under the Merchant Accounts section.

Add secrets to your environemt

      braintree:
        merchant_id:
        public_key:
        private_key:
        merchant_account_id:

## Documentation & Methods

Braintree Documentation:

<https://developers.braintreepayments.com/start/hello-server/ruby>

Braintree Active Merchant Ruby Gateway:

<https://github.com/activemerchant/active_merchant/blob/master/lib/active_merchant/billing/gateways/braintree_blue.rb>

## Testing

### Refund

A purchase, or captured authorization needs to be settled before it can be refunded.  The
braintree sandbox settles at 7pm to mimic the production environment.  A rake task is provided to
settle a transaction now for testing.

    rake workarea:braintree:settle_test_transaction TRANSACTION_ID
