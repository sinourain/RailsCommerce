# == Schema Information
#
# Table name: order_histories
#
#  id             :integer          not null, primary key
#  order_id       :integer
#  attribute_name :string(255)
#  from_name      :string(255)
#  to_name        :string(255)
#  note           :text
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer
#

require 'spec_helper'

describe OrderHistory do
  let(:order) { create(:order) }
  it '#log_transition should log log order state transitions' do
    OrderHistory.log_transition(order.id, 'transition name', 'from state', 'to state', order.user)
    order_history = OrderHistory.last
    expect(order_history.order_id).to eq(order.id)
    expect(order_history.from_name).to eq('from state')
    expect(order_history.to_name).to eq('to state')
  end
end
