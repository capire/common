using { sap.common } from '@sap/cds/common';
namespace sap.common.countries;

extend common.Countries {
  regions   : Composition of many Regions on regions.country = $self;
}

entity Regions : common.CodeList {
  key code  : String(5); // ISO 3166-2 alpha5 codes, e.g. DE-BW
  children  : Composition of many Regions on children.parent = $self;
  cities    : Composition of many Cities on cities.region = $self;
  country   : Association to common.Countries;
  parent    : Association to Regions;
}

entity Cities : common.CodeList {
  key code  : String(11);
  region    : Association to Regions;
  districts : Composition of many Districts on districts.city = $self;
}

entity Districts : common.CodeList {
  key code  : String(11);
  city      : Association to Cities;
}
