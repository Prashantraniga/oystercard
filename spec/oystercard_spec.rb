# In order to use public transport
# As a customer
# I want money on my card


require './lib/oystercard.rb'


describe Oystercard do

it 'has a balance of 0' do
  expect(subject.balance).to eq(0)
end

describe '#top_up' do
  it { is_expected.to respond_to(:top_up).with(1).argument }

it 'can be topped up' do
  expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
end

it 'raises an error when maximum balance is exceeded' do
  maximum_balance = Oystercard::MAXIMUM_BALANCE
  subject.top_up(maximum_balance)
  expect{ subject.top_up(1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end
end

describe "#deduct" do
  it { is_expected.to respond_to(:deduct).with(1).argument }

  it "deducts an amount from the balance" do
    subject.top_up 25
    expect{ subject.deduct 20}.to change{ subject.balance }.by -20
  end

  it "raises an error when the balance cannot cover the fare" do
    subject.top_up 20
    expect{ subject.deduct 21 }.to raise_error "Not enough funds!"
  end
  end
end
