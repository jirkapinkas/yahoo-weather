package com.test.service;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.test.yahoo.weather.Weather;

@Service
public class YahooService {

	@Cacheable("weather")
	public Weather findWeather(int woeid) {
		System.out.println("retrieve current data from Yahoo");
		RestTemplate restTemplate = new RestTemplate();
		return restTemplate.getForObject("http://weather.yahooapis.com/forecastrss?w=" + woeid + "&u=c", Weather.class);
	}
	
	@Scheduled(fixedDelay=60000)
	@CacheEvict(value="weather", allEntries=true)
	public void evict() {
		System.out.println("cache evicted");
	}
}
