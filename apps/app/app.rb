require 'rubygems'
require 'sinatra'

get '/get_xml/:file_name' do
  folder_root = 'projects/'
  file_name = params[:file_name]
  halt unless Dir.entries(folder_root).include?(file_name)
  headers( "Access-Control-Allow-Origin" => "*" )
  File.read(folder_root + file_name)
end
