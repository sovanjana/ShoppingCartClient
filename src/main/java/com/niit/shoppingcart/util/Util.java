package com.niit.shoppingcart.util;

public class Util {
	public static String removeComma(String name) {
		return name.replace(",", "");
	}
	public static void main(String[] args) {
		System.out.println(Util.removeComma(",CTG001"));
	}
}
