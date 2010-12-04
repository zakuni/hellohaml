# -*- coding: utf-8 -*-
# ビューを別ファイルで書いた場合
require 'rubygems'
require 'sinatra'
require 'haml'

helpers do
  include Rack::Utils; alias_method :h, :escape_html
end

get '/' do
  haml :index
end

post '/hello' do
  haml :hello
end

