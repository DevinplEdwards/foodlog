module LanguageServer
  module Protocol
    module Interface
      class SemanticTokensClientCapabilities
        def initialize(dynamic_registration: nil, requests:, token_types:, token_modifiers:, formats:, overlapping_token_support: nil, multiline_token_support: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration if dynamic_registration
          @attributes[:requests] = requests
          @attributes[:tokenTypes] = token_types
          @attributes[:tokenModifiers] = token_modifiers
          @attributes[:formats] = formats
          @attributes[:overlappingTokenSupport] = overlapping_token_support if overlapping_token_support
          @attributes[:multilineTokenSupport] = multiline_token_support if multiline_token_support

          @attributes.freeze
        end

        #
        # Whether implementation supports dynamic registration. If this is set to
        # `true` the client supports the new `(TextDocumentRegistrationOptions &
        # StaticRegistrationOptions)` return value for the corresponding server
        # capability as well.
        #
        # @return [boolean]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
        end

        #
        # Which requests the client supports and might send to the server
        # depending on the server's capability. Please note that clients might not
        # show semantic tokens or degrade some of the user experience if a range
        # or full request is advertised by the client but not provided by the
        # server. If for example the client capability `requests.full` and
        # `request.range` are both set to true but the server only provides a
        # range provider the client might not render a minimap correctly or might
        # even decide to not show any semantic tokens at all.
        #
        # @return [{ range?: boolean | {}; full?: boolean | { delta?: boolean; }; }]
        def requests
          attributes.fetch(:requests)
        end

        #
        # The token types that the client supports.
        #
        # @return [string[]]
        def token_types
          attributes.fetch(:tokenTypes)
        end

        #
        # The token modifiers that the client supports.
        #
        # @return [string[]]
        def token_modifiers
          attributes.fetch(:tokenModifiers)
        end

        #
        # The formats the clients supports.
        #
        # @return ["relative"[]]
        def formats
          attributes.fetch(:formats)
        end

        #
        # Whether the client supports tokens that can overlap each other.
        #
        # @return [boolean]
        def overlapping_token_support
          attributes.fetch(:overlappingTokenSupport)
        end

        #
        # Whether the client supports tokens that can span multiple lines.
        #
        # @return [boolean]
        def multiline_token_support
          attributes.fetch(:multilineTokenSupport)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
