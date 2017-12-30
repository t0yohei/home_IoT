class Co2

  def self.get_co2
    begin
      @co2, error, status = Open3.capture3('rake index_switch:co2_get')
      @co2 = @co2.match(%r{"(.+?)\\n"})[1]
    rescue => e
      @co2 = "CO2濃度を取得できませんでした"
    end
  end
end
