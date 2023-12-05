# frozen_string_literal: true
module Hyrax
  # Provide select options for the copyright status (edm:rights) field
  class LangsService < QaSelectService
    def initialize(_authority_name = nil)
      super('langs')
    end
  end
end