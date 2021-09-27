require 'csv'
require 'data/mcc_mnc'

class HomeNetworkIdentity
  include MccMnc

  def initialize(mcc:, mnc: nil)
    @mcc, @mnc = mcc.to_i, mnc.to_i
  end

  def country
    find_per_column(:mcc)&.field(:country)
  end

  def country_phone_prefix
    find_per_column(:mcc)&.field(:country_code)
  end

  def iso_country_code
    find_per_column(:mcc)&.field(:iso)
  end

  def network
    row = mcc_mnc_data.find do |row|
      row.field(:mcc) == @mcc && row.field(:mnc) == @mnc
    end
    row&.field(:network)
  end

  private

  def find_per_column(column)
    mcc_mnc_data.find do |row|
      row.field(column) == instance_variable_get("@#{column}")
    end
  end
end