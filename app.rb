require "sinatra"
require 'datadog/statsd'
statsd = Datadog::Statsd.new('localhost', 8125)

get "/" do
  statsd.increment('page.views', tags: ['index'])

  render :html, :index
end
