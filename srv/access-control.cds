using { CommonService } from './service';

// ========================================
// ACCESS CONTROL CONSTRAINTS
// ========================================

// Currencies: Read-only for public, create/update/delete for admin
annotate CommonService.Currencies with @restrict:[
  { grant:'READ', to:'any' },
  { grant:'CREATE,UPDATE,DELETE', to:'admin' }
];

// Countries: Read-only for public, create/update/delete for admin
annotate CommonService.Countries with @restrict:[
  { grant:'READ', to:'any' },
  { grant:'CREATE,UPDATE,DELETE', to:'admin' }
];

// Regions: Read-only for public, create/update/delete for admin
annotate CommonService.Regions with @restrict:[
  { grant:'READ', to:'any' },
  { grant:'CREATE,UPDATE,DELETE', to:'admin' }
];

// Cities: Read-only for public, create/update/delete for admin
annotate CommonService.Cities with @restrict:[
  { grant:'READ', to:'any' },
  { grant:'CREATE,UPDATE,DELETE', to:'admin' }
];

// Districts: Read-only for public, create/update/delete for admin
annotate CommonService.Districts with @restrict:[
  { grant:'READ', to:'any' },
  { grant:'CREATE,UPDATE,DELETE', to:'admin' }
];
