package com.test.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.test.yahoo.weather.Weather;

@RestController
public class YahooWeatherController {

	@RequestMapping("/weather")
	public Weather weather() {
		RestTemplate restTemplate = new RestTemplate();
		return restTemplate.getForObject("http://weather.yahooapis.com/forecastrss?w=2502265&u=c", Weather.class);
	}
	
}
