# frozen_string_literal: true



Dir.glob(File.join('consumers', '*.rb')).sort.each do |consumer|
  require consumer
end

Hutch::Config.set(:uri, 'amqp://rabbitmq:rabbitmq@localhost:5672')

Hutch.connect
