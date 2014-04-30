package org.likelist.type;

/**
 * Error Codes SUCCESS(0), NOT_FOUND(7), UNSUCCESSFUL(-1), UNAUTHORIZED(8),
 * DAO_FAIL(9), ACCESS_DENIED(3)
 * 
 * @author j1shen
 * 
 */
public enum EC {
	SUCCESS(0), NOT_FOUND(7), UNSUCCESSFUL(-1), UNAUTHORIZED(8), DAO_FAIL(9), ACCESS_DENIED(
			3), EXISTED(5);
	private int code;

	EC(int code) {
		this.code = code;
	}

	/**
	 * @return error code in int as defined, NOT as ordinal()
	 */
	public int toInt() {
		return this.code;
	}
}
