package com.$2012.vo;

/*
 * ÐÔ±ð
 */
public enum Gender {
	MAN{public String getName(){return "ÄÐ";}},
	WOMEN{public String getName(){return "Å®";}};
	public abstract String getName();
}