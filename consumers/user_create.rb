# frozen_string_literal: true

class CreateUserConsumer
  include Hutch::Consumer
  consume 'create_user.success'
  queue_name 'create_user.success'
  lazy_queue

  def process(message)
    message.delivery_info.channel.default_exchange.publish(
      { status: 200 }.to_json,
      routing_key: message.properties.reply_to,
      correlation_id: message.properties.correlation_id
    )
  end
end
