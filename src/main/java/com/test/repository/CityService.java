package com.test.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.entity.City;

@Service
public class CityService {

	@Autowired
	private CityRepository cityRepository;

	public City findByName(String name) {
		return cityRepository.findByName(name);
	}
}
