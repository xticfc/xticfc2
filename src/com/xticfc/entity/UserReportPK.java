package com.xticfc.entity;

import java.io.Serializable;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

public class UserReportPK implements Serializable {

	private static final long serialVersionUID = -2676997445754266724L;
	
	private String userId;
	private String tableId;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getTableId() {
		return tableId;
	}
	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public boolean equals(Object obj) {
        if(obj == this) {
            return true;
        }
        if(!(obj instanceof UserReportPK)) {
            return false;
        }

        UserReportPK userReportPK = (UserReportPK) obj;

        return new EqualsBuilder().append(this.userId, userReportPK.getUserId()).
        		append(this.tableId, userReportPK.getTableId()).isEquals();

    }

    public int hashCode() {
        return new HashCodeBuilder().append(this.userId).append(this.tableId).toHashCode();
    }
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
}
