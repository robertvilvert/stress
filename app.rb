require 'sinatra'
require 'json'

set :port, 4567
set :bind, '0.0.0.0'

get '/' do
  "Usage: /cpu?s=5 ou /memory?s=10"
end

get '/memory' do
  duration = params['s'].to_i
  end_time = Time.now + duration

  memory_hog = []
  while Time.now < end_time
    # 100MB cada iteração
    memory_hog << ' ' * 100 * 1024 * 1024
    sleep 1
  end

  memory_hog = nil
  GC.start

  "Memory allocation completed for #{duration} seconds."
end

get '/cpu' do
  duration = params['s'].to_i
  end_time = Time.now + duration

  while Time.now < end_time
    10000.times do
      Math.sqrt(rand)
    end
  end

  "CPU stress completed for #{duration} seconds."
end


