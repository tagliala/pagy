# See the Pagy documentation: https://ddnexus.github.io/pagy/docs/extras/keyset
# frozen_string_literal: true

require_relative '../keyset'

class Pagy # :nodoc:
  # Add keyset pagination
  module KeysetExtra
    private

    # Return Pagy::Keyset object and paginated records
    def pagy_keyset(set, **vars)
      pagy = Keyset.new(set, **pagy_keyset_get_vars(vars))
      [pagy, pagy.records]
    end

    # Sub-method called only by #pagy_keyset: here for easy customization of variables by overriding
    def pagy_keyset_get_vars(vars)
      vars.tap do |v|
        v[:page]  ||= pagy_get_page(v)
        v[:limit] ||= pagy_get_limit(v)
      end
    end
  end
  Backend.prepend KeysetExtra
end
