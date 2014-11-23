require 'bundler/setup'
require 'sinatra/base'

# The project root directory
$root = ::File.dirname(__FILE__)

class StarGazerServer < Sinatra::Base
  disable :static
  
  # 60 min expiry for most things except anything in assets (which have md5'ed filenames)
  before do
    expires 3600, :public, :must_revalidate
    unless request.path_info[1].nil?
      if request.path_info.split('/')[1].include? 'assets'
        expires 21120000, :public, :must_revalidate
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