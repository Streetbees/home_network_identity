require 'csv'
require 'data/mcc_mnc'

class HomeNetworkIdentity
  include MccMnc

  def initialize(plmn:)
    @plmn = plmn.to_s
  end

  def country
    raw_by_plmn.first&.fetch("countryName", nil)
  end

  def iso_country_code
    raw_by_plmn.first&.fetch("countryCode", nil)
  end

  def operator
    raw_by_plmn.first&.fetch("operator", nil)
  end

  def raw_by_plmn
    find_per_column("plmn", @plmn)
  end

  private

  def find_per_column(column, value)
    mcc_mnc_data.select do |row|
      row[column] == value
    end
  end
end