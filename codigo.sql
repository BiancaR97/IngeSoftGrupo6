CREATE TABLE Store
(
  ID_store INT NOT NULL,
  brandName VARCHAR(60) NOT NULL,
  URI VARCHAR(256) NOT NULL,
  mail VARCHAR(256) NOT NULL,
  password VARCHAR(256) NOT NULL,
  logo VARCHAR(256) NOT NULL,
  PRIMARY KEY (ID_store)
);

CREATE TABLE Country
(
  ID_country INT NOT NULL,
  name VARCHAR(60) NOT NULL,
  PRIMARY KEY (ID_country)
);

CREATE TABLE Prov
(
  ID_prov INT NOT NULL,
  name VARCHAR(60) NOT NULL,
  PRIMARY KEY (ID_prov)
);

CREATE TABLE City
(
  ID_city INT NOT NULL,
  name VARCHAR(60) NOT NULL,
  PRIMARY KEY (ID_city)
);

CREATE TABLE Products
(
  ID_product INT NOT NULL,
  name VARCHAR(128) NOT NULL,
  cantPhotos INT NOT NULL,
  sale INT NOT NULL,
  price INT NOT NULL,
  description VARCHAR(4096) NOT NULL,
  haveSizes INT NOT NULL,
  ID_store INT NOT NULL,
  PRIMARY KEY (ID_product),
  FOREIGN KEY (ID_store) REFERENCES Store(ID_store)
);

CREATE TABLE Categories
(
  ID_category INT NOT NULL,
  name VARCHAR(60) NOT NULL,
  description VARCHAR(2048) NOT NULL,
  photo VARCHAR(256) NOT NULL,
  PRIMARY KEY (ID_category)
);

CREATE TABLE products_categories
(
  ID_product INT NOT NULL,
  ID_category INT NOT NULL,
  FOREIGN KEY (ID_product) REFERENCES Products(ID_product),
  FOREIGN KEY (ID_category) REFERENCES Categories(ID_category)
);

CREATE TABLE Subcategories
(
  ID_subcategory INT NOT NULL,
  name VARCHAR(60) NOT NULL,
  PRIMARY KEY (ID_subcategory)
);

CREATE TABLE Sizes
(
  type1 VARCHAR(12) NOT NULL,
  type2 VARCHAR(12) NOT NULL,
  type3 VARCHAR(12) NOT NULL,
  type4 VARCHAR(12) NOT NULL,
  type5 VARCHAR(12) NOT NULL,
  type6 VARCHAR(12) NOT NULL,
  type7 VARCHAR(12) NOT NULL,
  ID_size INT NOT NULL,
  PRIMARY KEY (ID_size)
);

CREATE TABLE products_sizes
(
  ID_product INT NOT NULL,
  ID_size INT NOT NULL,
  FOREIGN KEY (ID_product) REFERENCES Products(ID_product),
  FOREIGN KEY (ID_size) REFERENCES Sizes(ID_size)
);

CREATE TABLE Stock
(
  ID_stock INT NOT NULL,
  sizeType1 INT NOT NULL,
  sizeType2 INT NOT NULL,
  sizeType3 INT NOT NULL,
  sizeType4 INT NOT NULL,
  sizeType5 INT NOT NULL,
  sizeType6 INT NOT NULL,
  sizeType7 INT NOT NULL,
  PRIMARY KEY (ID_stock)
);

CREATE TABLE products_stock
(
  ID_product INT NOT NULL,
  ID_stock INT NOT NULL,
  FOREIGN KEY (ID_product) REFERENCES Products(ID_product),
  FOREIGN KEY (ID_stock) REFERENCES Stock(ID_stock)
);

CREATE TABLE Address
(
  streetNum INT NOT NULL,
  ID_address INT NOT NULL,
  ID_country INT NOT NULL,
  ID_prov INT NOT NULL,
  ID_city INT NOT NULL,
  PRIMARY KEY (ID_address),
  FOREIGN KEY (ID_country) REFERENCES Country(ID_country),
  FOREIGN KEY (ID_prov) REFERENCES Prov(ID_prov),
  FOREIGN KEY (ID_city) REFERENCES City(ID_city)
);

CREATE TABLE products_subcategories
(
  ID_product INT NOT NULL,
  ID_subcategory INT NOT NULL,
  FOREIGN KEY (ID_product) REFERENCES Products(ID_product),
  FOREIGN KEY (ID_subcategory) REFERENCES Subcategories(ID_subcategory)
);

CREATE TABLE Customers
(
  ID_customer INT NOT NULL,
  name INT NOT NULL,
  phone INT NOT NULL,
  cellphone INT NOT NULL,
  mail INT NOT NULL,
  ID_store INT NOT NULL,
  ID_address1 INT NOT NULL,
  ID_address2 INT NOT NULL,
  PRIMARY KEY (ID_customer),
  FOREIGN KEY (ID_store) REFERENCES Store(ID_store),
  FOREIGN KEY (ID_address1) REFERENCES Address(ID_address),
  FOREIGN KEY (ID_address2) REFERENCES Address(ID_address)
);

CREATE TABLE Buys
(
  ID_buy INT NOT NULL,
  payState INT NOT NULL,
  shipState INT NOT NULL,
  payMethod INT NOT NULL,
  shipMethod INT NOT NULL,
  date DATE NOT NULL,
  ID_customer INT NOT NULL,
  PRIMARY KEY (ID_buy),
  FOREIGN KEY (ID_customer) REFERENCES Customers(ID_customer)
);

CREATE TABLE product_buys
(
  ID_product INT NOT NULL,
  ID_buy INT NOT NULL,
  FOREIGN KEY (ID_product) REFERENCES Products(ID_product),
  FOREIGN KEY (ID_buy) REFERENCES Buys(ID_buy)
);