module SlackNotifier
    MESSAGE = Slack::Notifier.new ENV['SLACK_WEBHOOK']
  end