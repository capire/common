DELETE from Countries
where code in ('BRA', 'JPN', 'MEX', 'ZAF', 'ESP')


INSERT into Countries {
  code: 'BRA', name: 'Brazil',
  regions: [
    {
      code: 'BRASP', name: 'Sao Paulo',
      cities: [
        { code: 'BRA-SP-01', name: 'Sao Paulo' },
        { code: 'BRA-SP-02', name: 'Campinas' },
        { code: 'BRA-SP-03', name: 'Santos' },
        { code: 'BRA-SP-04', name: 'Ribeirao Preto' },
        { code: 'BRA-SP-05', name: 'Sorocaba' },
        { code: 'BRA-SP-06', name: 'Jundiai' }
      ]
    },
    {
      code: 'BRARJ', name: 'Rio de Janeiro',
      cities: [
        { code: 'BRA-RJ-01', name: 'Rio de Janeiro' },
        { code: 'BRA-RJ-02', name: 'Niteroi' },
        { code: 'BRA-RJ-03', name: 'Petropolis' },
        { code: 'BRA-RJ-04', name: 'Angra dos Reis' },
        { code: 'BRA-RJ-05', name: 'Volta Redonda' }
      ]
    }
  ]
}, {
  code: 'JPN', name: 'Japan',
  regions: [
    {
      code: 'JPNTK', name: 'Tokyo',
      cities: [
        { code: 'JPN-TK-01', name: 'Tokyo' },
        { code: 'JPN-TK-02', name: 'Shinjuku' },
        { code: 'JPN-TK-03', name: 'Shibuya' },
        { code: 'JPN-TK-04', name: 'Taito' },
        { code: 'JPN-TK-05', name: 'Meguro' },
        { code: 'JPN-TK-06', name: 'Setagaya' }
      ]
    },
    {
      code: 'JPNOS', name: 'Osaka',
      cities: [
        { code: 'JPN-OS-01', name: 'Osaka' },
        { code: 'JPN-OS-02', name: 'Sakai' },
        { code: 'JPN-OS-03', name: 'Higashiosaka' },
        { code: 'JPN-OS-04', name: 'Toyonaka' },
        { code: 'JPN-OS-05', name: 'Suita' }
      ]
    }
  ]
}, {
  code: 'MEX', name: 'Mexico',
  regions: [
    {
      code: 'MEXCM', name: 'Mexico City',
      cities: [
        { code: 'MEX-CM-01', name: 'Coyoacan' },
        { code: 'MEX-CM-02', name: 'Iztapalapa' },
        { code: 'MEX-CM-03', name: 'Tlalpan' },
        { code: 'MEX-CM-04', name: 'Xochimilco' },
        { code: 'MEX-CM-05', name: 'Benito Juarez' },
        { code: 'MEX-CM-06', name: 'Cuauhtemoc' }
      ]
    },
    {
      code: 'MEXNL', name: 'Nuevo Leon',
      cities: [
        { code: 'MEX-NL-01', name: 'Monterrey' },
        { code: 'MEX-NL-02', name: 'Guadalupe' },
        { code: 'MEX-NL-03', name: 'San Nicolas' },
        { code: 'MEX-NL-04', name: 'Apodaca' },
        { code: 'MEX-NL-05', name: 'Santa Catarina' }
      ]
    }
  ]
}, {
  code: 'ZAF', name: 'South Africa',
  regions: [
    {
      code: 'ZAFGP', name: 'Gauteng',
      cities: [
        { code: 'ZAF-GP-01', name: 'Johannesburg' },
        { code: 'ZAF-GP-02', name: 'Pretoria' },
        { code: 'ZAF-GP-03', name: 'Soweto' },
        { code: 'ZAF-GP-04', name: 'Midrand' },
        { code: 'ZAF-GP-05', name: 'Sandton' },
        { code: 'ZAF-GP-06', name: 'Centurion' }
      ]
    },
    {
      code: 'ZAFWC', name: 'Western Cape',
      cities: [
        { code: 'ZAF-WC-01', name: 'Cape Town' },
        { code: 'ZAF-WC-02', name: 'Stellenbosch' },
        { code: 'ZAF-WC-03', name: 'George' },
        { code: 'ZAF-WC-04', name: 'Paarl' },
        { code: 'ZAF-WC-05', name: 'Hermanus' }
      ]
    }
  ]
}, {
  code: 'ESP', name: 'Spain',
  regions: [
    {
      code: 'ESPMD', name: 'Madrid',
      cities: [
        { code: 'ESP-MD-01', name: 'Madrid' },
        { code: 'ESP-MD-02', name: 'Alcala de Henares' },
        { code: 'ESP-MD-03', name: 'Getafe' },
        { code: 'ESP-MD-04', name: 'Leganes' },
        { code: 'ESP-MD-05', name: 'Mostoles' },
        { code: 'ESP-MD-06', name: 'Fuenlabrada' }
      ]
    },
    {
      code: 'ESPCT', name: 'Catalonia',
      cities: [
        { code: 'ESP-CT-01', name: 'Barcelona' },
        { code: 'ESP-CT-02', name: 'Tarragona' },
        { code: 'ESP-CT-03', name: 'Girona' },
        { code: 'ESP-CT-04', name: 'Lleida' },
        { code: 'ESP-CT-05', name: 'Badalona' }
      ]
    }
  ]
}
SELECT from Cities { region.country.code as country, count(*) as cities }
where region.country.code in ('BRA', 'JPN', 'MEX', 'ZAF', 'ESP')
group by region.country.code
order by region.country.code
SELECT from Countries {
  code, name,
  regions [order by name] {
    code, name,
    cities [order by name] {
      code, name,
      districts [order by name] { code, name }
    },
    children [order by name] {
      code, name,
      cities [order by name] {
        code, name,
        districts [order by name] { code, name }
      },
      children [order by name] {
        code, name,
        cities [order by name] {
          code, name,
          districts [order by name] { code, name }
        }
      }
    }
  }
}
order by name


SELECT from Authors {
  ID, name,
  books [
    where genre.name != 'Drama'
    group by genre.name
  ] {
    genre.name,
    sum(stock) as total_stock,
    count(*) as num_books
  }
} where exists books [genre.name != 'Drama']
order by name


SELECT from Authors {
  ID, name,
  books [genre.name != 'Drama'] { ID, title, genre.name }
}
where exists books [genre.name != 'Drama']
order by name
