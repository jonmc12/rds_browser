class HomeController < ApplicationController
  layout "home", :except => []
  # before_filter :set_domain

  # before_filter :login_required, :only =>[:customer_info]
  
  def index
    # if logged_in?
    #   @address=self.current_user.to_json
    # end
    # @spec = build_spec
    @address = ""
    @spec = {}
  end
  
  private
  
  def build_spec
    @spec = {}
    @spec[:object_header_spec] = Albino.colorize(AppConstants.header_spec, :yaml)
    @spec[:feature_login_spec] = Albino.colorize(AppConstants.header_features.login_spec, :yaml)
    @spec[:feature_chat_spec] = Albino.colorize(AppConstants.header_features.chat_spec, :yaml)
    @spec[:feature_create_account_spec] = Albino.colorize(AppConstants.header_features.create_account_spec, :yaml)
    @spec[:feature_restaurants_by_address] = Albino.colorize(AppConstants.header_features.restaurants_by_address, :yaml)
    @spec[:feature_restaurants_by_franchise] = Albino.colorize(AppConstants.header_features.restaurants_by_franchise, :yaml)
    @spec[:feature_order_history] = Albino.colorize(AppConstants.header_features.order_history, :yaml)
    @spec[:object_address_form_spec] = Albino.colorize(AppConstants.address_form_spec, :yaml) 
    return @spec
  end
end
