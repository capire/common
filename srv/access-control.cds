using { CodeListsService } from './service';

// ========================================
// ACCESS CONTROL CONSTRAINTS
// ========================================

// Currencies: Read-only for public, create/update/delete for admin
annotate CodeListsService.Currencies with @restrict:[
  { grant:'READ', to:'any' },
  { grant:['CREATE','UPDATE','DELETE'], to:'admin' }
];

// Countries: Read-only for public, create/update/delete for admin
annotate CodeListsService.Countries with @restrict:[
  { grant:'READ', to:'any' },
  { grant:['CREATE','UPDATE','DELETE'], to:'admin' }
];

// Regions: Read-only for public, create/update/delete for admin
annotate CodeListsService.Regions with @restrict:[
  { grant:'READ', to:'any' },
  { grant:['CREATE','UPDATE','DELETE'], to:'admin' }
];

// Cities: Read-only for public, create/update/delete for admin
annotate CodeListsService.Cities with @restrict:[
  { grant:'READ', to:'any' },
  { grant:['CREATE','UPDATE','DELETE'], to:'admin' }
];

// Districts: Read-only for public, create/update/delete for admin
annotate CodeListsService.Districts with @restrict:[
  { grant:'READ', to:'any' },
  { grant:['CREATE','UPDATE','DELETE'], to:'admin' }
];
