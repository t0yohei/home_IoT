# frozen_string_literal: true

namespace :air_controll do
  desc 'do dry_on'
  task dry_on: :environment do
    system('irsend SEND_ONCE room dry_on')
  end

  desc 'do cool_on'
  task cool_on: :environment do
    system('irsend SEND_ONCE room cool_on')
  end

  desc 'do hot_on'
  task hot_on: :environment do
    system('irsend SEND_ONCE room hot_on')
  end

  desc 'do air_off'
  task air_off: :environment do
    system('irsend SEND_ONCE room air_off')
  end
end
