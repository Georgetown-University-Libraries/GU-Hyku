# frozen_string_literal: true
module Hyrax
  module Renderers
    class FacetedAttributeRenderer < AttributeRenderer
      private

      def li_value(value)
        link_to(ERB::Util.h(value), search_path(value))
      end

      # remove locale url option
      def search_path(value)
        Rails.application.routes.url_helpers.search_catalog_path("f[#{search_field}][]": value)
      end

      def search_field
        ERB::Util.h(options.fetch(:search_field, field).to_s + "_sim")
      end
    end
  end
end