package com.xticfc.test.service;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

@ContextConfiguration(locations = "classpath:app-context.xml")
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback = true)
@Transactional
public class BaseServiceTest extends AbstractTransactionalJUnit4SpringContextTests{

	
}
