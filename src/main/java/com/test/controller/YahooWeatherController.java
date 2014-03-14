package com.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.test.entity.City;
import com.test.repository.CityService;
import com.test.yahoo.weather.Weather;

@Controller
public class YahooWeatherController {
	
	@Autowired
	private CityService cityService;

	@RequestMapping("/weather")
	@ResponseBody
	public Weather weather(@RequestParam String city) {
		City cityWithWoid = cityService.findByName(city);
		if(cityWithWoid == null) {
			return null;
		} else {
			RestTemplate restTemplate = new RestTemplate();
			return restTemplate.getForObject("http://weather.yahooapis.com/forecastrss?w=" + cityWithWoid.getWoeid() + "&u=c", Weather.class);
		}
		
	}
	
	@RequestMapping("/")
	public String index( ) {
		return "index";
	}
	
}
