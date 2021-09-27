module MccMnc

  # This data was grabed from https://www.mcc-mnc.com/
  def mcc_mnc_data
    @mcc_mnc_data ||= CSV.table("lib/data/mcc_mnc.csv")
  end
end