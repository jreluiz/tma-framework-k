-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- ATMOSPHERE - http://www.atmosphere-eubrazil.eu/
-- 
-- 
-- Trustworthiness Monitoring & Assessment Framework
-- Component: Knowledge - database
-- 
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
--
-- Normalized MySQL statements for creating the quality metamodel
--
-- @author Jorge Luiz <jorgem@unicamp.br>
-- 
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------


USE knowledge;

-- -- Quality Metamodel -- --

DROP TABLE IF EXISTS HistoricalData;
DROP TABLE IF EXISTS Preference;
DROP TABLE IF EXISTS ConfigurationData;
DROP TABLE IF EXISTS Conditional;
DROP TABLE IF EXISTS LeafRule;
DROP TABLE IF EXISTS Data;
DROP TABLE IF EXISTS ActionPlan;
DROP TABLE IF EXISTS Plan;
DROP TABLE IF EXISTS Configuration;
DROP TABLE IF EXISTS ActionRule;
DROP TABLE IF EXISTS Rule;
DROP TABLE IF EXISTS CompositeRule;
DROP TABLE IF EXISTS Attribute;
DROP TABLE IF EXISTS Metric;
DROP TABLE IF EXISTS LeafAttribute;
DROP TABLE IF EXISTS CompositeAttribute;
DROP TABLE IF EXISTS ConfigurationProfile;
DROP TABLE IF EXISTS Probe;
DROP TABLE IF EXISTS Resource;
DROP TABLE IF EXISTS Description;
DROP TABLE IF EXISTS LeafAttribute;
DROP TABLE IF EXISTS Configuration;
DROP TABLE IF EXISTS Actuator;

CREATE TABLE Attribute (
   attributeId INT NOT NULL AUTO_INCREMENT,
   compositeattributeId INT NOT NULL,
   name VARCHAR(1024),
   primary key(attributeId)  
);

CREATE TABLE CompositeAttribute (
   attributeId INT NOT NULL,
   operator INT,
   PRIMARY KEY (attributeId)
);

ALTER TABLE Attribute ADD CONSTRAINT FK_Attribute_0 FOREIGN KEY (compositeattributeId) REFERENCES CompositeAttribute (attributeId);

CREATE TABLE LeafAttribute (
   attributeId INT NOT NULL,
   normalizationMin DOUBLE PRECISION,
   normalizationMax DOUBLE PRECISION,
   operator INT,
   numSamples INT,
   normalizationKind INT,
   PRIMARY KEY (attributeId)
);

CREATE TABLE HistoricalData (
   historicalDataId INT NOT NULL AUTO_INCREMENT,
   instant TIMESTAMP(6) NOT NULL,
   value DOUBLE PRECISION,
   attributeId INT NOT NULL,
   PRIMARY KEY (historicalDataId, instant)
);

ALTER TABLE HistoricalData ADD CONSTRAINT FK_HistoricalData_0 FOREIGN KEY (attributeId) REFERENCES Attribute (attributeId);

CREATE TABLE ConfigurationProfile (
   configurationprofileId INT NOT NULL AUTO_INCREMENT,
   active BOOLEAN,
   PRIMARY KEY (configurationprofileId)
);

CREATE TABLE Preference (
   preferenceId INT NOT NULL,
   attributeId INT NOT NULL,
   configurationprofileId INT NOT NULL,
   weight DOUBLE PRECISION,
   threshold DOUBLE PRECISION,
   PRIMARY KEY (preferenceId)
);

ALTER TABLE Preference ADD CONSTRAINT FK_Preference_0 FOREIGN KEY (ConfigurationProfileId) REFERENCES ConfigurationProfile (configurationprofileId);
ALTER TABLE Preference ADD CONSTRAINT FK_Preference_1 FOREIGN KEY (AttributeId) REFERENCES Attribute (attributeId);

CREATE TABLE Actuator (
    actuatorId INT NOT NULL AUTO_INCREMENT,
    address VARCHAR(1024),
    pubKey VARCHAR(1024),
    PRIMARY KEY (actuatorId)
);

CREATE TABLE Resource (
    resourceId INT NOT NULL AUTO_INCREMENT,
    resourceName VARCHAR(128),
    resourceType VARCHAR(16),
    resourceAddress VARCHAR(1024),
    PRIMARY KEY (resourceId)
);

CREATE TABLE Probe (
    probeId INT NOT NULL AUTO_INCREMENT,
    probeName VARCHAR(128),
    password VARCHAR(128),
    salt VARCHAR(128) NOT NULL,
    token VARCHAR(256),
    tokenExpiration TIMESTAMP(6),
    PRIMARY KEY (probeId)
);

CREATE TABLE Description (
    descriptionId INT NOT NULL AUTO_INCREMENT,
    dataType VARCHAR(128),
    descriptionName VARCHAR(128),
    unit VARCHAR(128),
    PRIMARY KEY (descriptionId)
);

CREATE TABLE Metric (
   attributeId INT NOT NULL,
   configurationprofileId INT NOT NULL,
   descriptionId INT NOT NULL,
   probeId INT NOT NULL,
   resourceId INT NOT NULL,
   probeName VARCHAR(1024),
   descriptionName VARCHAR(1024),
   resourceName VARCHAR(1024),
   lastTimestampDataInserted TIMESTAMP(6),
   PRIMARY KEY (attributeId)
);

ALTER TABLE Metric ADD CONSTRAINT FK_Metric_0 FOREIGN KEY (configurationprofileId) REFERENCES ConfigurationProfile (configurationprofileId);
ALTER TABLE Metric ADD CONSTRAINT FK_Metric_1 FOREIGN KEY (attributeId) REFERENCES LeafAttribute (attributeId);
ALTER TABLE Metric ADD CONSTRAINT FK_Metric_2 FOREIGN KEY (descriptionId) REFERENCES Description (descriptionId);
ALTER TABLE Metric ADD CONSTRAINT FK_Metric_3 FOREIGN KEY (probeId) REFERENCES Probe (probeId);
ALTER TABLE Metric ADD CONSTRAINT FK_Metric_4 FOREIGN KEY (resourceId) REFERENCES Resource (resourceId);

CREATE TABLE Data (
    probeId INT NOT NULL,
    descriptionId INT NOT NULL,
    resourceId INT NOT NULL,
    metricId INT NOT NULL,
    valueTime TIMESTAMP(6) NOT NULL,
    value DOUBLE PRECISION,
    PRIMARY KEY (probeId,descriptionId,resourceId,valueTime)
);

ALTER TABLE Data ADD CONSTRAINT FK_Data_0 FOREIGN KEY (probeId) REFERENCES Probe (probeId);
ALTER TABLE Data ADD CONSTRAINT FK_Data_1 FOREIGN KEY (descriptionId) REFERENCES Description (descriptionId);
ALTER TABLE Data ADD CONSTRAINT FK_Data_2 FOREIGN KEY (resourceId) REFERENCES Resource (resourceId);


