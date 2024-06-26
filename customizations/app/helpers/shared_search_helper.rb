# frozen_string_literal: true

module SharedSearchHelper
  def generate_work_url(model, request)
    # needed because some attributes eg id is a symbol 7 others are string
    model = model.to_h.with_indifferent_access

    cname = model["account_cname_tesim"]
    account_cname = Array.wrap(cname).first

    has_model = model["has_model_ssim"].first.underscore.pluralize
    id = model["id"]

    #needed for handle URLs
    handle = model["handle_tesim"].first unless model["handle_tesim"].blank?

    request_params = %i[protocol host port].map { |method| ["request_#{method}".to_sym, request.send(method)] }.to_h

    url = get_url(id: id, request: request_params, account_cname: account_cname, handle: handle, has_model: has_model)

    # pass search query params to work show page
    params[:q].present? ? "#{url}?q=#{params[:q]}" : url
  end

  private

    def get_url(id:, request:, account_cname:, handle:, has_model:)
      new_url = "#{request[:request_protocol]}#{account_cname || request[:request_host]}"
      new_url += ":#{request[:request_port]}" if Rails.env.development? || Rails.env.test?
      new_url += case has_model
                 when "collections"
                   "/#{has_model}/#{id}"
                 else
                  #handle URL
                  "/handle/#{ENV.fetch('HANDLE_PREFIX', '10822')}/#{handle}"
                  #"/concern/#{has_model}/#{id}"
                 end
      new_url
    end
end
