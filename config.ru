require 'bundler/setup'
require 'sinatra/base'

# The project root directory
$root = ::File.dirname(__FILE__)

case ENV['APP_NAME']
  when 'production'
    $env = 'prod'
when 'development'
    $env = 'dev'
  else
    $env = 'local'
end

module Rack
  class DeflaterWithExclusions < Deflater
    def initialize(app, options = {})
      @app = app
      @exclude = options[:exclude]
    end
    def call(env)
      if @exclude && @exclude.call(env)
        @app.call(env)
      else
        super(env)
      end
    end
  end
end

class StarGazerServer < Sinatra::Base
  disable :static
  
  # gzip everything, except files with extensions below (images)
  use Rack::DeflaterWithExclusions, :exclude => proc { |env|
    [ ".jpg", ".png", ".ico" ].include? File.extname(env['PATH_INFO'])
  }
    
  # 60 min expiry for most things except anything in assets (which have md5'ed filenames)
  before do
    if $env != 'dev'
      expires 3600, :public, :must_revalidate
      unless request.path_info[1].nil?
        if request.path_info.split('/')[1].include? 'assets'
          expires 21120000, :public, :must_revalidate
        end
      end
    end
  end

  get(/.+/) do
    send_sinatra_file(request.path) {404}
  end

  not_found do
    send_file(File.join(File.dirname(__FILE__), 'public', '404.html'), {:status => 404})
  end

  def send_sinatra_file(path, &missing_file_block)
    file_path = File.join(File.dirname(__FILE__), 'deploy',  path)
    file_path = File.join(file_path, 'index.html') unless file_path =~ /\.[a-z]+$/i
    File.exist?(file_path) ? send_file(file_path) : missing_file_block.call
  end

end

run StarGazerServer