package org.likelist.admin;

public class OnlineCounter {
	private static long online = 0;

	public static long getOnline() {
		return online;
	}

	public static void raise() {
		online++;
	}

	public static void reduce() {
		online--;
		if (online < 0)
			online = 0;
	}
}
