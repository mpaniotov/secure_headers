# frozen_string_literal: true
module SecureHeaders
  class ReportToConfigError < StandardError; end
  class ReportTo
    HEADER_NAME = "Report-To".freeze
    DEFAULT_VALUE = "none"
    VALID_POLICIES = %w(
      group
      max_age
      endpoints
    )

    class << self
      # Public: generate an Referrer Policy header.
      #
      # Returns a default header if no configuration is provided, or a
      # header name and value based on the config.
      def make_header(config = nil, user_agent = nil)
        return if config == OPT_OUT
        config ||= DEFAULT_VALUE
        [HEADER_NAME, config.to_json]
      end

      def validate_config!(config)
        # case config
        # when nil, OPT_OUT
        #   # valid
        # when String, Array
        #   config = Array(config)
        #   unless config.all? { |t| t.is_a?(String) && VALID_POLICIES.include?(t.downcase) }
        #     raise ReferrerPolicyConfigError.new("Value can only be one or more of #{VALID_POLICIES.join(", ")}")
        #   end
        # else
        #   raise TypeError.new("Must be a string or array of strings. Found #{config.class}: #{config}")
        # end
      end
    end
  end
end
