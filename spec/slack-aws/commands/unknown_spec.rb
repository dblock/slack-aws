require 'spec_helper'

describe SlackRubyBot::Commands::Unknown do
  def app
    SlackAws::App.new
  end
  let(:client) { app.send(:client) }
  it 'invalid command' do
    expect(message: 'aws foobar').to respond_with_slack_message("Sorry <@user>, I don't understand that command!")
  end
  it 'does not respond to sad face' do
    expect(SlackRubyBot::Commands::Base).to_not receive(:send_message)
    SlackAws::App.new.send(:message, client, text: ':((')
  end
end
