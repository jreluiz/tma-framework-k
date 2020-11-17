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
-- Normalized MySQL statements for creating the rules of performance quality model
--
-- @author Jorge Luiz <jorgem@unicamp.br>
-- 
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------


USE knowledge;

-- Rules of performance QM

insert into CompositeRule (ruleId) values (10);
insert into CompositeRule (ruleId) values (11);

insert into Rule (ruleId, compositeRuleId, name, attributeId, enabled, priority, activationGroup) values (10, 10, "Increase memory", 7, true, 1, "Performance Group");
insert into Rule (ruleId, compositeRuleId, name, attributeId, enabled, priority, activationGroup) values (11, 11, "Increase cpu", 6, true, 1, "Performance Group");

insert into Conditional (conditionId, ruleId, conditionalOperator, value) values (10, 10, 4, "threshold"); -- LESS_THAN
insert into Conditional (conditionId, ruleId, conditionalOperator, value) values (11, 11, 4, "threshold"); -- LESS_THAN

insert into Actuator (actuatorId, address, pubKey) values (2, "http://0.0.0.0:8081/docker/", "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCA...");

-- increase mem
insert into ActionRule (actionRuleId, ruleId, actuatorId, resourceId, actionName) values (10, 10, 2, 102, "increase_mem");
-- increase cpu
insert into ActionRule (actionRuleId, ruleId, actuatorId, resourceId, actionName) values (11, 11, 2, 102, "increase_cpu");

insert into Configuration (configurationId, actionRuleId, keyName, domain, value) values (10, 10, "mem", "str", "increase_mem");
insert into Configuration (configurationId, actionRuleId, keyName, domain, value) values (11, 11, "cpu", "str", "increase_cpu");


