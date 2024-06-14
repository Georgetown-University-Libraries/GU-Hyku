# frozen_string_literal: true
module Hyrax
  module Renderers
    class ExternalLinkAttributeRenderer < AttributeRenderer
      private

      def li_value(value)
        value.match(/http/) ? url = value : url = "https://" + value
        link = link_to(value, url) 
        "#{link}&nbsp;<span class='glyphicon glyphicon-new-window'></span>"
      end
    end
  end
end