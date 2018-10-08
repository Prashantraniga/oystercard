# In order to use public transport
# As a customer
# I want money on my card


require './lib/oystercard.rb'


describe Oystercard do



it 'has a balance of 0' do
  expect(subject.balance).to eq 0
end

it 'can be topped up' do

  expect(subject).to respond_to(:top_up).with(1).argument
end

it 'increases balance of card' do
  card = Oystercard.new
  card.top_up(20)
  expect(card.balance).to eq 20
end

end
