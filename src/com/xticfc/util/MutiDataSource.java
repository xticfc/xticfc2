package com.xticfc.util;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;



public class MutiDataSource extends AbstractRoutingDataSource {

	@Override
	protected Object determineCurrentLookupKey() {
		
		return CustomerContextHolder.getCustomerType();
	}

}
