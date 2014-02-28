require "sinatra"
require "sinatra/activerecord"
require "sinatra/base"
require "sinatra/assetpack"
require "twilio-ruby"

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || "sqlite3:///thrive_garden.db")
register Sinatra::AssetPack

class TextResponse < ActiveRecord::Base
  validates :phone_number, presence: true, length: { minimum: 10 }
  validates :message, presence: true
end

get "/" do
  @text = TextResponse.first
  erb :index
end

get "/survey" do

end

get "/incoming-text" do

end

assets do

  js :foundation, [
    '/js/bower_components/foundation/js/foundation/foundation.js',
    '/js/bower_components/foundation/js/foundation/foundation.*.js'
  ]

  js :application, [
    '/js/bower_components/foundation/js/vendor/*.js',
    '/js/app.js'
  ]

  serve '/css', :from => 'stylesheets'
  css :application, [
    '/css/normalize.css',
    '/css/app.css'
   ]

  js_compression :jsmin
  css_compression :sass
end