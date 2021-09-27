module MccMnc

  # This data was grabed from https://www.mcc-mnc.com/
  def mcc_mnc_data
    data_csv_path = File.join( File.dirname(__FILE__), './mcc_mnc.csv' )
    @mcc_mnc_data ||= CSV.table(data_csv_path)
  end
end