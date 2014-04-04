require 'action_dispatch/middleware/session/dalli_store'

# - PHP side is 5.3.6 configured with session.save_handler = memcache
# - Requires php-serialize gem for serialization: https://github.com/jqr/php-serialize
module ActionDispatch
  module Session
    class PhpDalliStore < ActionDispatch::Session::DalliStore
      require 'php_serialize'

      class PhpSerializingPoolDecorator < SimpleDelegator

        def set(key, value, ttl = nil, options = nil)
          super(key, PHP.serialize_session(value), 0, :raw => true)
        end

        def get(key, options = nil)
          value = super(key)
          PHP.unserialize(value) if value && value != ''
        end
      end

      def initialize(app, options = {})
        # Default to no namespace and cookie name matching PHP settings
        super(app, options.merge(:namespace => nil, :key => 'PHPSESSID'))
        # Decorate the pool to do some serialization
        @pool = PhpSerializingPoolDecorator.new(@pool)
      end
    end
  end
end