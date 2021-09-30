require 'minitest/autorun'
require 'home_network_identity'

class HomeNetworkIdentityTest < Minitest::Test
  def test_country
    mcc = 603
    home_network_identity = HomeNetworkIdentity.new(mcc: mcc)
    assert_equal "Algeria", home_network_identity.country
  end

  def test_iso_country_code
    mcc = 268
    home_network_identity = HomeNetworkIdentity.new(mcc: mcc)
    assert_equal "PT", home_network_identity.iso_country_code
  end

  def test_operator
    mcc = 268
    mnc = 1
    home_network_identity = HomeNetworkIdentity.new(mcc: mcc, mnc: mnc)
    assert_equal "Vodafone Portugal", home_network_identity.operator
  end

  def test_raw_by_plmn
    mcc = 268
    mnc = 1
    home_network_identity = HomeNetworkIdentity.new(mcc: mcc, mnc: mnc)
    assert_equal(
      [{"plmn"=>"26801", "nibbledPlmn"=>"62F810", "mcc"=>"268", "mnc"=>"01", "region"=>"Europe", "type"=>"National", "countryName"=>"Portugal", "countryCode"=>"PT", "lat"=>"39.5", "long"=>"-8", "brand"=>"Vodafone", "operator"=>"Vodafone Portugal", "status"=>"Operational", "bands"=>"GSM 900 / UMTS 900 / UMTS 2100 / LTE 800 / LTE 1800 / LTE 2600", "notes"=>"formerly Telecel (2001)"}],
      home_network_identity.raw_by_plmn
    )
  end

  def test_operator_with_strings
    mcc = "268"
    mnc = "1"
    home_network_identity = HomeNetworkIdentity.new(mcc: mcc, mnc: mnc)
    assert_equal "Vodafone Portugal", home_network_identity.operator
  end

  def test_mcc_not_found
    mcc = 268234
    home_network_identity = HomeNetworkIdentity.new(mcc: mcc)
    assert_nil home_network_identity.iso_country_code
  end

  def test_operator_with_mcc_mnc_pair_not_found
    mcc = 268
    mnc = 111
    home_network_identity = HomeNetworkIdentity.new(mcc: mcc, mnc: mnc)
    assert_nil home_network_identity.operator
  end

  def test_raw_by_plmn_with_mcc_mnc_pair_not_found
    mcc = 268
    mnc = 111
    home_network_identity = HomeNetworkIdentity.new(mcc: mcc, mnc: mnc)
    assert_equal [], home_network_identity.raw_by_plmn
  end

end
