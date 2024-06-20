# frozen_string_literal: true

module Hyrax
  module AdminSetPresenterDecorator
    # remove locale url option
    def show_path
      Hyrax::Engine.routes.url_helpers.admin_admin_set_path(id)
    end
  end
end

Hyrax::AdminSetPresenter.prepend(Hyrax::AdminSetPresenterDecorator)