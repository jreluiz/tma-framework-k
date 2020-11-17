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
-- Normalized MySQL statements for creating the planner infrastructure
--
-- @author Jorge Luiz <jorgem@unicamp.br>
-- 
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------


USE knowledge;

-- Planner Infrastructure

CREATE TABLE Rule (
   ruleId INT NOT NULL AUTO_INCREMENT,
   compositeRuleId INT NOT NULL,
   name VARCHAR(1024),
   attributeId INT,
   enabled BOOLEAN,
   priority INT,
   activationGroup VARCHAR(1024),
   primary key(ruleId)  
);

CREATE TABLE CompositeRule (
   ruleId INT NOT NULL,
   PRIMARY KEY (ruleId)
);

ALTER TABLE Rule ADD CONSTRAINT FK_Rule_0 FOREIGN KEY (compositeRuleId) REFERENCES CompositeRule (ruleId);
ALTER TABLE Rule ADD CONSTRAINT FK_Rule_1 FOREIGN KEY (attributeId) REFERENCES Attribute (attributeId);

CREATE TABLE LeafRule (
   ruleId INT NOT NULL,
   PRIMARY KEY (ruleId)
);

CREATE TABLE Conditional (
    conditionId INT NOT NULL AUTO_INCREMENT,
    ruleId INT NOT NULL,
    conditionalOperator INT,
    value VARCHAR(1024),
    PRIMARY KEY (conditionId)
);

ALTER TABLE Conditional ADD CONSTRAINT FK_Condition_1 FOREIGN KEY (ruleId) REFERENCES Rule (ruleId);

CREATE TABLE ActionRule (
    actionRuleId INT NOT NULL AUTO_INCREMENT,
    ruleId INT NOT NULL,
    actuatorId INT NOT NULL,
    resourceId INT NOT NULL,
    actionName VARCHAR(128),
    PRIMARY KEY (actionRuleId)
);

ALTER TABLE ActionRule ADD CONSTRAINT FK_ActionRule_1 FOREIGN KEY (ruleId) REFERENCES Rule (ruleId);
ALTER TABLE ActionRule ADD CONSTRAINT FK_Actuator_1 FOREIGN KEY (actuatorId) REFERENCES Actuator (actuatorId);
ALTER TABLE ActionRule ADD CONSTRAINT FK_Resource_1 FOREIGN KEY (resourceId) REFERENCES Resource (resourceId);

CREATE TABLE Plan (
    planId INT NOT NULL AUTO_INCREMENT,
    valueTime TIMESTAMP(6) NOT NULL,
    status INT,
    PRIMARY KEY (planId)
);

CREATE TABLE ActionPlan (
    planId INT NOT NULL,
    actionRuleId INT NOT NULL,
    executionOrder INT,
    status INT,
    PRIMARY KEY (planId, actionRuleId)
);

ALTER TABLE ActionPlan ADD CONSTRAINT FK_ActionPlan_0 FOREIGN KEY (planId) REFERENCES Plan (planId);
ALTER TABLE ActionPlan ADD CONSTRAINT FK_ActionPlan_1 FOREIGN KEY (actionRuleId) REFERENCES ActionRule (actionRuleId);

CREATE TABLE Configuration (
    configurationId INT NOT NULL AUTO_INCREMENT,
    actionRuleId INT NOT NULL,
    keyName VARCHAR(128),
    domain VARCHAR(1024),
    value VARCHAR(1024),
    PRIMARY KEY (configurationId, actionRuleId)
);

ALTER TABLE Configuration ADD CONSTRAINT FK_Configuration_0 FOREIGN KEY (actionRuleId) REFERENCES ActionRule (actionRuleId);

CREATE TABLE ConfigurationData (
    planId INT NOT NULL,
    actionRuleId INT NOT NULL,
    configurationId INT NOT NULL,
    value VARCHAR(1024),
    PRIMARY KEY (planId, actionRuleId, configurationId)
);

ALTER TABLE ConfigurationData ADD CONSTRAINT FK_ConfigurationData_0 FOREIGN KEY (planId, actionRuleId) REFERENCES ActionPlan (planId, actionRuleId);
ALTER TABLE ConfigurationData ADD CONSTRAINT FK_ConfigurationData_1 FOREIGN KEY (actionRuleId, configurationId) REFERENCES Configuration (actionRuleId, configurationId);


