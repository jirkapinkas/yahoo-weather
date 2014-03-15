package com.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.entity.City;
import com.test.service.CityService;
import com.test.service.YahooService;
import com.test.yahoo.weather.Weather;

@Controller
public class YahooWeatherController {
	
	@Autowired
	private CityService cityService;
	
	@Autowired
	private YahooService yahooService;

	@RequestMapping("/weather")
	@ResponseBody
	public Weather weather(@RequestParam String city) {
		City cityWithWoeid = cityService.findByName(city);
		if(cityWithWoeid == null) {
			return null;
		} else {
			return yahooService.findWeather(cityWithWoeid.getWoeid());
		}
		
	}
	
	@RequestMapping("/")
	public String index( ) {
		return "index";
	}
	
}
