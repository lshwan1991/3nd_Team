package DAO;

public class storeVO {
	String STORE_NAME;
	String STORE_TYPE;
	String STORE_LOCATION;
	String STORE_TEL;
	public storeVO(String sTORE_NAME, String sTORE_TYPE, String sTORE_LOCATION, String sTORE_TEL) {
		super();
		STORE_NAME = sTORE_NAME;
		STORE_TYPE = sTORE_TYPE;
		STORE_LOCATION = sTORE_LOCATION;
		STORE_TEL = sTORE_TEL;
	}
	public String getSTORE_NAME() {
		return STORE_NAME;
	}
	public void setSTORE_NAME(String sTORE_NAME) {
		STORE_NAME = sTORE_NAME;
	}
	public String getSTORE_TYPE() {
		return STORE_TYPE;
	}
	public void setSTORE_TYPE(String sTORE_TYPE) {
		STORE_TYPE = sTORE_TYPE;
	}
	public String getSTORE_LOCATION() {
		return STORE_LOCATION;
	}
	public void setSTORE_LOCATION(String sTORE_LOCATION) {
		STORE_LOCATION = sTORE_LOCATION;
	}
	public String getSTORE_TEL() {
		return STORE_TEL;
	}
	public void setSTORE_TEL(String sTORE_TEL) {
		STORE_TEL = sTORE_TEL;
	}
	
	
}
