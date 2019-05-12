# frozen_string_literal: true

class Co2
  require 'open3'

  def self.get_co2
    'この機能は未実装です'
    # co2, error, status = Open3.capture3('rake index_switch:co2_get')
    # co2.match(/"(.+?)\\n"/)[1]
  end
end
