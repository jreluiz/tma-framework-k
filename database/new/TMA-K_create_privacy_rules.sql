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
-- Normalized MySQL statements for creating the rules of privacy quality model
--
-- @author Jorge Luiz <jorgem@unicamp.br>
-- 
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------


USE knowledge;

-- Rules of privacy QM

insert into CompositeRule (ruleId) values (1);
insert into CompositeRule (ruleId) values (4);

insert into Rule (ruleId, compositeRuleId, name, attributeId, enabled, priority, activationGroup) values (1, 1, "Score less than Threshold", 2, true, 1, "Privacy Group");
insert into Rule (ruleId, compositeRuleId, name, attributeId, enabled, priority, activationGroup) values (2, 1, "Increase k-anonimity by 1", 2, true, 2, "Privacy Group");
insert into Rule (ruleId, compositeRuleId, name, attributeId, enabled, priority, activationGroup) values (3, 1, "Multiply k-anonimity by 2", 2, true, 2, "Privacy Group");

insert into Rule (ruleId, compositeRuleId, name, attributeId, enabled, priority, activationGroup) values (4, 4, "Score greater than or equal to Threshold", 2, true, 2, "Privacy Group");

insert into LeafRule (ruleId) values (2);
insert into LeafRule (ruleId) values (3);

insert into Conditional (conditionId, ruleId, conditionalOperator, value) values (1, 1, 4, "threshold"); -- LESS_THAN
insert into Conditional (conditionId, ruleId, conditionalOperator, value) values (2, 2, 3, "previousScore"); -- GREATER_THAN
insert into Conditional (conditionId, ruleId, conditionalOperator, value) values (3, 3, 1, "previousScore"); -- EQUAL_TO
insert into Conditional (conditionId, ruleId, conditionalOperator, value) values (4, 4, 5, "threshold"); -- GREATER_THAN_OR_EQUAL_TO

insert into Actuator (actuatorId, address, pubKey) values (1, "http://0.0.0.0:8080/privaaas/", "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA...");

-- Increase k-anonimity by 1
insert into ActionRule (actionRuleId, ruleId, actuatorId, resourceId, actionName) values (1, 1, 1, 8, "update");
-- Increase k-anonimity by 1
insert into ActionRule (actionRuleId, ruleId, actuatorId, resourceId, actionName) values (2, 2, 1, 8, "update");
-- Multiply k-anonimity by 2
insert into ActionRule (actionRuleId, ruleId, actuatorId, resourceId, actionName) values (3, 3, 1, 8, "multiply");
-- none
insert into ActionRule (actionRuleId, ruleId, actuatorId, resourceId, actionName) values (4, 4, 1, 8, "none");

-- increase_by_1
insert into Configuration (configurationId, actionRuleId, keyName, domain, value) values (1, 1, "k", "str", "update");
-- increase_by_1 
insert into Configuration (configurationId, actionRuleId, keyName, domain, value) values (2, 2, "k", "str", "update");
-- multiply_by_2
insert into Configuration (configurationId, actionRuleId, keyName, domain, value) values (3, 3, "k", "str", "multiply");
-- none
insert into Configuration (configurationId, actionRuleId, keyName, domain, value) values (4, 4, "k", "str", "none");


