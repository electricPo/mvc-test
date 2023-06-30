package cash.vo;

public class Hashtag {
	private int cashbookNo;
	private String cashword;
	private int updatedate;
	private int createdate;
	/**
	 * @return the cashbookNo
	 */
	public int getCashbookNo() {
		return cashbookNo;
	}
	/**
	 * @param cashbookNo the cashbookNo to set
	 */
	public void setCashbookNo(int cashbookNo) {
		this.cashbookNo = cashbookNo;
	}
	/**
	 * @return the cashword
	 */
	public String getCashword() {
		return cashword;
	}
	/**
	 * @param cashword the cashword to set
	 */
	public void setCashword(String cashword) {
		this.cashword = cashword;
	}
	/**
	 * @return the updatedate
	 */
	public int getUpdatedate() {
		return updatedate;
	}
	/**
	 * @param updatedate the updatedate to set
	 */
	public void setUpdatedate(int updatedate) {
		this.updatedate = updatedate;
	}
	/**
	 * @return the createdate
	 */
	public int getCreatedate() {
		return createdate;
	}
	/**
	 * @param createdate the createdate to set
	 */
	public void setCreatedate(int createdate) {
		this.createdate = createdate;
	}
	public Hashtag() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Hashtag(int cashbookNo, String cashword, int updatedate, int createdate) {
		super();
		this.cashbookNo = cashbookNo;
		this.cashword = cashword;
		this.updatedate = updatedate;
		this.createdate = createdate;
	}
	@Override
	public String toString() {
		return "Hashtag [cashbookNo=" + cashbookNo + ", cashword=" + cashword + ", updatedate=" + updatedate
				+ ", createdate=" + createdate + "]";
	}
	
}
