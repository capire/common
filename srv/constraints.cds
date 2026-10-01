using { CommonService } from './service';

// ========================================
// INPUT VALIDATION CONSTRAINTS
// ========================================

// Currencies: code, symbol, and name are mandatory
annotate CommonService.Currencies with {
  code @mandatory;
  name @mandatory;
}

// Countries: code and name are mandatory
annotate CommonService.Countries with {
  code @mandatory;
  name @mandatory;
}

// Regions: code, name, and country reference are mandatory
annotate CommonService.Regions with {
  code @mandatory;
  name @mandatory;
  parent @mandatory;
}

// Cities: name and region reference are mandatory
annotate CommonService.Cities with {
  name @mandatory;
  region @mandatory;
}

// Districts: name and city reference are mandatory
annotate CommonService.Districts with {
  name @mandatory;
  city @mandatory;
}

// ========================================
// BUSINESS LOGIC CONSTRAINTS WITH CASE WHEN
// ========================================

// Currencies: Assert valid code format and values
annotate CommonService.Currencies with {
  code @assert: (case
    when code is null then 'Currency code must be specified'
    when length(trim(code)) < 3 then 'Currency code must be at least 3 characters'
  end);

  symbol @assert: (case
    when symbol is null then 'Currency symbol must be specified'
    when trim(symbol) = '' then 'Currency symbol must not be empty'
  end);

  name @assert: (case
    when trim(name) = '' then 'Currency name must not be empty'
  end);

  exponent @assert: (case
    when exponent < 0 or exponent > 3 then 'Exponent must be between 0 and 3'
  end);

  numcode @assert: (case
    when numcode is null then 'Numeric code must be specified'
    when length(numcode) != 3 then 'Numeric code must be exactly 3 digits'
  end);

  minor @assert: (case
    when minor is null then 'Minor unit must be specified'
    when trim(minor) = '' then 'Minor unit must not be empty'
  end);
}

// Countries: Assert code format and name validity
annotate CommonService.Countries with {
  code @assert: (case
    when code is null then 'Country code must be specified'
    when length(code) < 2 or length(code) > 3 then 'Country code must be 2-3 characters'
  end);

  name @assert: (case
    when trim(name) = '' then 'Country name must not be empty'
  end);

  descr @assert: (case
    when descr is not null and trim(descr) = '' then 'Description must not be empty if specified'
  end);
}

// Regions: Assert hierarchical structure and code patterns
annotate CommonService.Regions with {
  code @assert: (case
    when code is null then 'Region code must be specified'
    when length(code) < 2 then 'Region code is too short'
    when code = parent then 'Region cannot be its own parent'
  end);

  name @assert: (case
    when trim(name) = '' then 'Region name must not be empty'
  end);

  parent @assert: (case
    when parent is null then 'Region must be linked to a parent country'
    when not exists parent then 'Referenced parent country does not exist'
  end);
}

// Cities: Assert proper region reference and code patterns
annotate CommonService.Cities with {
  code @assert: (case
    when code is null then 'City code must be specified'
    when length(code) < 4 then 'City code is too short'
    when length(code) > 11 then 'City code exceeds maximum length'
  end);

  name @assert: (case
    when trim(name) = '' then 'City name must not be empty'
  end);

  region @assert: (case
    when region is null then 'City must be linked to a region'
    when not exists region then 'Referenced region does not exist'
  end);

  descr @assert: (case
    when descr is not null and trim(descr) = '' then 'Description must not be empty if specified'
  end);
}

// Districts: Assert proper city reference and structure
annotate CommonService.Districts with {
  code @assert: (case
    when code is null then 'District code must be specified'
    when length(code) < 5 then 'District code is too short'
    when length(code) > 11 then 'District code exceeds maximum length'
  end);

  name @assert: (case
    when trim(name) = '' then 'District name must not be empty'
  end);

  city @assert: (case
    when city is null then 'District must be linked to a city'
    when not exists city then 'Referenced city does not exist'
  end);

  descr @assert: (case
    when descr is not null and trim(descr) = '' then 'Description must not be empty if specified'
  end);
}
