namespace :workarea do
  namespace :braintree do
    desc "settles a transaction in braintree sandbox"
    task :settle_test_transaction, [:transaction_id] => :environment do |_, args|
      unless Rails.env.development?
        warn "Only permitted in dev"
        exit(1)
      end

      unless args[:transaction_id].present?
        warn "need transaction_id"
        exit(1)
      end

      Braintree::Configuration.environment = :sandbox
      secrets = Rails.application.secrets.braintree.deep_symbolize_keys
      [:merchant_id, :public_key, :private_key].each do |key|
        puts key
        Braintree::Configuration.send("#{key}=", secrets[key])
      end

      Braintree::TestTransaction.settle args[:transaction_id]
    end
  end
end
