require 'minitest/autorun'
require 'home_network_identity'

class HomeNetworkIdentityTest < Minitest::Test
  def test_country
    plmn = 60301
    home_network_identity = HomeNetworkIdentity.new(plmn: plmn)
    assert_equal "Algeria", home_network_identity.country
  end

  def test_iso_country_code
    plmn = 23403
    home_network_identity = HomeNetworkIdentity.new(plmn: plmn)
    assert_equal "GG", home_network_identity.iso_country_code
  end

  def test_operator
    plmn = 26801
    home_network_identity = HomeNetworkIdentity.new(plmn: plmn)
    assert_equal "Vodafone Portugal", home_network_identity.operator
  end

  def test_raw_by_plmn
    plmn = 26801
    home_network_identity = HomeNetworkIdentity.new(plmn: plmn)
    assert_equal(
      [{"plmn"=>"26801", "nibbledPlmn"=>"62F810", "mcc"=>"268", "mnc"=>"01", "region"=>"Europe", "type"=>"National", "countryName"=>"Portugal", "countryCode"=>"PT", "lat"=>"39.5", "long"=>"-8", "brand"=>"Vodafone", "operator"=>"Vodafone Portugal", "status"=>"Operational", "bands"=>"GSM 900 / UMTS 900 / UMTS 2100 / LTE 800 / LTE 1800 / LTE 2600", "notes"=>"formerly Telecel (2001)"}],
      home_network_identity.raw_by_plmn
    )
  end

  def test_operator_with_strings
    plmn = "26801"
    home_network_identity = HomeNetworkIdentity.new(plmn: plmn)
    assert_equal "Vodafone Portugal", home_network_identity.operator
  end

  def test_mcc_not_found
    plmn = 268234
    home_network_identity = HomeNetworkIdentity.new(plmn: plmn)
    assert_nil home_network_identity.iso_country_code
  end

  def test_operator_with_mcc_mnc_pair_not_found
    plmn = 268111
    home_network_identity = HomeNetworkIdentity.new(plmn: plmn)
    assert_nil home_network_identity.operator
  end

  def test_raw_by_plmn_with_mcc_mnc_pair_not_found
    plmn = 268111
    home_network_identity = HomeNetworkIdentity.new(plmn: plmn)
    assert_equal [], home_network_identity.raw_by_plmn
  end

end
