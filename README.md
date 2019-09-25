Workarea Braintree
================================================================================

Braintree plugin for the Workarea platform.

Getting Started
--------------------------------------------------------------------------------

Add the gem to your application's Gemfile:

```ruby
# ...
gem 'workarea-braintree'
# ...
```

Update your application's bundle.

```bash
cd path/to/application
bundle
```

Development Credentials
--------------------------------------------------------------------------------

Developers can sign up for a free developer account at https://www.braintreepayments.com/sandbox to acquire testing credentials and access to a Braintree control panel.

Secrets
--------------------------------------------------------------------------------

Most of the keys below can be found in the Braintree control panel under Account.
Merchant account id can be found under Settings -> Processing under the Merchant Accounts section.

Add secrets to your environemt

      braintree:
        merchant_id:
        public_key:
        private_key:
        merchant_account_id:

Documentation & Methods
--------------------------------------------------------------------------------

Braintree Documentation:

<https://developers.braintreepayments.com/start/hello-server/ruby>

Braintree Active Merchant Ruby Gateway:

<https://github.com/activemerchant/active_merchant/blob/master/lib/active_merchant/billing/gateways/braintree_blue.rb>

Testing
--------------------------------------------------------------------------------

### Refund

A purchase, or captured authorization needs to be settled before it can be refunded.  The
braintree sandbox settles at 7pm to mimic the production environment.  A rake task is provided to
settle a transaction now for testing.

```bash
rake workarea:braintree:settle_test_transaction TRANSACTION_ID
```

Workarea Commerce Documentation
--------------------------------------------------------------------------------

See [https://developer.workarea.com](https://developer.workarea.com) for Workarea Commerce documentation.

License
--------------------------------------------------------------------------------

Workarea Braintree is released under the [Business Software License](LICENSE)
