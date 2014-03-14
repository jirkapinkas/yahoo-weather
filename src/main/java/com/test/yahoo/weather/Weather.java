package com.test.yahoo.weather;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="rss")
public class Weather {

	private Channel channel;

	public Channel getChannel() {
		return channel;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}
	
}
