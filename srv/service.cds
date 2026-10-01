using { sap.common.countries } from '../db/regions';
using { sap.common } from '../db/currencies';

service CommonService @hcql @mcp @agent {
  entity Currencies as projection on common.Currencies;
  entity Countries as projection on common.Countries;
  entity Regions as projection on countries.Regions;
  entity Cities as projection on countries.Cities;
  entity Districts as projection on countries.Districts;
}
