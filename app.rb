require "sinatra"
require 'datadog/statsd'
require 'ddtrace'
require 'ddtrace/contrib/sinatra/tracer'

statsd = Datadog::Statsd.new('localhost', 8125)

get "/" do
  statsd.increment('page.views', tags: ['index'])

  render :html, :index
end

