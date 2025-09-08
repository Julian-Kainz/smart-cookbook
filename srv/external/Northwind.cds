/* checksum : 98ba2dd10906c37480d9ac5ffd22fcb2 */
@cds.external : true
@cds.persistence.skip : true
entity Northwind.FeaturedProduct : Northwind.Products {
  Advertisement : Association to one Northwind.Advertisements {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Customer : Northwind.Persons {
  TotalExpense : Decimal not null;
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Employee : Northwind.Persons {
  EmployeeID : Integer64 not null;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  HireDate : DateTime not null;
  @odata.Type : 'Edm.Single'
  Salary : Double not null;
};

@cds.external : true
type Northwind.Address {
  Street : LargeString;
  City : LargeString;
  State : LargeString;
  ZipCode : LargeString;
  Country : LargeString;
};

@cds.external : true
@Org.OData.Display.V1.Description : 'This is a sample OData service with vocabularies'
service Northwind {};

@cds.external : true
@cds.persistence.skip : true
@open : true
@Org.OData.Display.V1.Description : 'All Products available in the online store'
entity Northwind.Products {
  key ID : Integer not null;
  @Org.OData.Display.V1.DisplayName : 'Product Name'
  Name : LargeString;
  Description : LargeString;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  ReleaseDate : DateTime not null;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  DiscontinuedDate : DateTime;
  Rating : Integer not null;
  Price : Double not null;
  Categories : Association to many Northwind.Categories {  };
  Supplier : Association to one Northwind.Suppliers {  };
  ProductDetail : Association to one Northwind.ProductDetails {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.ProductDetails {
  key ProductID : Integer not null;
  Details : LargeString;
  Product : Association to one Northwind.Products {  };
};

@cds.external : true
@cds.persistence.skip : true
@open : true
entity Northwind.Categories {
  key ID : Integer not null;
  Name : LargeString;
  Products : Association to many Northwind.Products {  };
};

@cds.external : true
@cds.persistence.skip : true
@Org.OData.Publication.V1.PublisherName : 'Microsoft Corp.'
@Org.OData.Publication.V1.PublisherId : 'MSFT'
@Org.OData.Publication.V1.Keywords : 'Inventory, Supplier, Advertisers, Sales, Finance'
@Org.OData.Publication.V1.AttributionUrl : 'http://www.odata.org/'
@Org.OData.Publication.V1.AttributionDescription : 'All rights reserved'
@Org.OData.Publication.V1.![DocumentationUrl ] : 'http://www.odata.org/'
@Org.OData.Publication.V1.TermsOfUseUrl : 'All rights reserved'
@Org.OData.Publication.V1.PrivacyPolicyUrl : 'http://www.odata.org/'
@Org.OData.Publication.V1.LastModified : '4/2/2013'
@Org.OData.Publication.V1.![ImageUrl ] : 'http://www.odata.org/'
entity Northwind.Suppliers {
  key ID : Integer not null;
  Name : LargeString;
  Address : Northwind.Address;
  @odata.Type : 'Edm.GeographyPoint'
  Location : String;
  Concurrency : Integer not null;
  Products : Association to many Northwind.Products {  };
};

@cds.external : true
@cds.persistence.skip : true
@open : true
entity Northwind.Persons {
  key ID : Integer not null;
  Name : LargeString;
  PersonDetail : Association to one Northwind.PersonDetails {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.PersonDetails {
  key PersonID : Integer not null;
  @odata.Type : 'Edm.Byte'
  Age : Integer not null;
  Gender : Boolean not null;
  Phone : LargeString;
  Address : Northwind.Address;
  @Core.MediaType : 'application/octet-stream'
  @odata.Type : 'Edm.Stream'
  Photo : LargeBinary not null;
  Person : Association to one Northwind.Persons {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Advertisements {
  key ID : UUID not null;
  Name : LargeString;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  AirDate : DateTime not null;
  FeaturedProduct : Association to one Northwind.FeaturedProduct {  };
  @Core.MediaType : 'application/octet-stream'
  blob : LargeBinary;
};

