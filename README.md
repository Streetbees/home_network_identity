# Home Network Identity

## Summary

Mobile Country Codes (MCC) are used in wireless telephone networks (GSM, CDMA, UMTS, etc.) in order to identify the country which a mobile subscriber belongs to. In order to uniquely identify a mobile subscribers network the MCC is combined with a Mobile Network Code (MNC). The combination of MCC and MNC is called **HNI (Home network identity)** and is the combination of both in one string (e.g. MCC= 262 and MNC = 01 results in an HNI of 26201). If you combine the HNI with the MSIN (Mobile Subscriber Identification Number) the result is the so called IMSI (integrated mobile subscriber identify). Below you can browse/search the list of countries and their MCCs for free in order to identify any MCC, MNC or HNI of the world.

## About

This gem returns the country basic info based on the Mobile Country Code (MCC).
Also returns the Operator name if you provide the Mobile Network Code (MNC).

## Installation

`$ gem install home_network_identity`

or add it to Gemfile

`gem 'home_network_identity'`

and then

`$ bundle`

## Usage

```
require "home_network_identity"

hni = HomeNetworkIdentity.new(mcc: 268)
hni.country # => "Portugal"
hni.iso_country_code # => "PT"
hni.operator # => "Vodafone Portugal"

To get an Array of hashes with raw data do:
hni.raw_by_plmn

# Get the operator name

hni = HomeNetworkIdentity.new(mcc: 268, mnc: 1)
hni.operator # => "Vodafone Portugal"
```

