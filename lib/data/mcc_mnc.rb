require 'json'

module MccMnc

  # This data was downloaded from https://github.com/PodgroupConnectivity/mcc-mnc-list/blob/master/mcc-mnc-list.json
  def mcc_mnc_data
    data_path = File.join( File.dirname(__FILE__), './mcc-mnc-list.json' )

    @mcc_mnc_data ||= JSON.parse(File.read(data_path))
  end
end