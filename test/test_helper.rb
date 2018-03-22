ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  require 'factory'

  def api_get route, args={}
    get route, args.merge(headers: {"Authorization" => @auth_token})
  end

  def api_patch route, args={}
    patch route, args.merge(headers: {"Authorization" => @auth_token})
  end

  def api_post route, args={}
    post route, args.merge(headers: {"Authorization" => @auth_token})
  end

  def api_delete route, args={}
    delete route, args.merge(headers: {"Authorization" => @auth_token})
  end

  def auth_in user, password
    post v1_auth_login_url, params: { email: user.email, password: password }
    JSON.parse(response.body)['auth_token']
  end

  def build(object, args={})
    Factory.build(object, args)
  end

  def create(object, args={})
    Factory.create(object, args)
  end
end
