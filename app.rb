require "sinatra"
require 'datadog/statsd'
require 'ddtrace'
require 'ddtrace/contrib/sinatra/tracer'

statsd = Datadog::Statsd.new('localhost', 8125)

Datadog.configure do |c|
  c.use :sinatra, service_name: 'hello-datadog-cf-ruby'
end

get "/" do
  statsd.increment('page.views', tags: ['page:index'])

  render :html, :index
end

get "/new-page" do
  statsd.increment('page.views', tags: ['page:new-page'])

  render :html, :index
end

get "/error" do
  statsd.increment('page.views', tags: ['page:error-page'])

  raise "error"
end

error do
  "Error"
end
