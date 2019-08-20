module Workarea
  module Braintree
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::Braintree
    end
  end
end
