CREATE TABLE district (
    id serial PRIMARY KEY,
	province_name VARCHAR (50),
	province_code VARCHAR (50),
	district_code VARCHAR (50) UNIQUE NOT NULL,
	district_name VARCHAR (50)
);

CREATE TABLE subdistrict (
    id serial PRIMARY KEY,
	district_code VARCHAR (50),
	subdistrict_code VARCHAR (50) UNIQUE NOT NULL,
	subdistrict_name VARCHAR (50),
    CONSTRAINT subdistrict_pkey_district_code FOREIGN KEY (district_code) REFERENCES district (district_code) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE oxygen_center (
    id serial PRIMARY KEY,
    oxygen_center_name  VARCHAR (100),
    subdistrict_code VARCHAR (100),
    item_type VARCHAR (100),
    phones VARCHAR ARRAY,
    address VARCHAR (255),
    status VARCHAR (30),
    CONSTRAINT subdistrict_pkey_oxygen_center FOREIGN KEY (subdistrict_code) REFERENCES subdistrict (subdistrict_code) ON DELETE SET NULL ON UPDATE CASCADE
);
