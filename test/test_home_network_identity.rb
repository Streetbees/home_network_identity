require 'minitest/autorun'
require 'home_network_identity'

class HomeNetworkIdentityTest < Minitest::Test
  def test_country
    mcc = 603
    home_network_identity = HomeNetworkIdentity.new(mcc: mcc)
    assert_equal "Algeria", home_network_identity.country
  end

  def test_country_phone_prefix
    mcc = 268
    home_network_identity = HomeNetworkIdentity.new(mcc: mcc)
    assert_equal 351, home_network_identity.country_phone_prefix
  end

  def test_iso_country_code
    mcc = 268
    home_network_identity = HomeNetworkIdentity.new(mcc: mcc)
    assert_equal "pt", home_network_identity.iso_country_code
  end

  def test_network
    mcc = 268
    mnc = 1
    home_network_identity = HomeNetworkIdentity.new(mcc: mcc, mnc: mnc)
    assert_equal "Vodafone", home_network_identity.network
  end

  def test_network
    mcc = "268"
    mnc = "1"
    home_network_identity = HomeNetworkIdentity.new(mcc: mcc, mnc: mnc)
    assert_equal "Vodafone", home_network_identity.network
  end

  def test_mcc_not_found
    mcc = 268234
    home_network_identity = HomeNetworkIdentity.new(mcc: mcc)
    assert_nil home_network_identity.iso_country_code
  end

  def test_mcc_mnc_pair_not_found
    mcc = 268
    mnc = 111
    home_network_identity = HomeNetworkIdentity.new(mcc: mcc, mnc: mnc)
    assert_nil home_network_identity.network
  end

end
