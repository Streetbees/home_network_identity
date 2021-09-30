require 'csv'
require 'data/mcc_mnc'

class HomeNetworkIdentity
  include MccMnc

  def initialize(mcc:, mnc: nil)
    @mcc = mcc.to_s.rjust(3, "0")
    @mnc = mnc.to_s.rjust(2, "0")
  end

  def country
    easy_find("mcc")&.fetch("countryName", nil)
  end

  def iso_country_code
    easy_find("mcc")&.fetch("countryCode", nil)
  end

  def operator
    raw_by_plmn.first&.fetch("operator", nil)
  end

  def raw_by_plmn
    find_per_column("plmn", @mcc + @mnc)
  end

  private

  def easy_find(column)
    value = instance_variable_get("@#{column}")
    find_per_column(column, value).first
  end

  def find_per_column(column, value)
    mcc_mnc_data.select do |row|
      row[column] == value
    end
  end
end