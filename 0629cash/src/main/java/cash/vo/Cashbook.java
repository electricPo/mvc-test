package cash.vo;

public class Cashbook {
	private int cashbookNo;
	private int price;
	private String category;
	private int cashbookDate;
	private String memo;
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
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}
	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}
	/**
	 * @param category the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}
	/**
	 * @return the cashbookDate
	 */
	public int getCashbookDate() {
		return cashbookDate;
	}
	/**
	 * @param cashbookDate the cashbookDate to set
	 */
	public void setCashbookDate(int cashbookDate) {
		this.cashbookDate = cashbookDate;
	}
	/**
	 * @return the memo
	 */
	public String getMemo() {
		return memo;
	}
	/**
	 * @param memo the memo to set
	 */
	public void setMemo(String memo) {
		this.memo = memo;
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
	public Cashbook() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cashbook(int cashbookNo, int price, String category, int cashbookDate, String memo, int updatedate,
			int createdate) {
		super();
		this.cashbookNo = cashbookNo;
		this.price = price;
		this.category = category;
		this.cashbookDate = cashbookDate;
		this.memo = memo;
		this.updatedate = updatedate;
		this.createdate = createdate;
	}
	@Override
	public String toString() {
		return "Cashbook [cashbookNo=" + cashbookNo + ", price=" + price + ", category=" + category + ", cashbookDate="
				+ cashbookDate + ", memo=" + memo + ", updatedate=" + updatedate + ", createdate=" + createdate + "]";
	}


}
