# -*- coding: utf-8 -*-
# ビューを使わずに１ファイルにまとめた場合
require 'rubygems'
require 'sinatra'
require 'haml'

helpers do
  include Rack::Utils; alias_method :h, :escape_html
end

template :layout do "
%html
 %body
  %h1 Hello World
  =yield
"
end

get '/' do
haml '
%p あなたの名前は？
%form{:action=>"/hello", :method=>"POST"}
 %input{:type=>"text", :name=>"name"}
 %input{:type=>"submit", :value=>"送信"}
'
end

post '/hello' do
haml '
%p== こんにちは、#{h params[:name]}さん！
%a{:href=> "/"} 戻る
'
end

