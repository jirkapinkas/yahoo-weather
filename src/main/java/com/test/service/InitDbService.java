package com.test.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.entity.City;
import com.test.repository.CityRepository;

@Transactional
@Service
public class InitDbService {

	@Autowired
	private CityRepository cityRepository;

	@PostConstruct
	public void init() throws Exception {
		HashMap<String, City> map = new HashMap<String, City>();
		System.out.println("START INIT DATABASE");
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				getClass().getResourceAsStream("/woeid.txt")));
		String line = null;
		// read header and ignore
		reader.readLine();
		while ((line = reader.readLine()) != null) {
			line = line.trim();
			String[] t = line.split(",");
			City city = new City();
			city.setName(t[0]);
			city.setWoeid(Integer.parseInt(t[3]));
			map.put(city.getName(), city);
		}
		for (City city : map.values()) {
			cityRepository.save(city);
		}
		reader.close();
		System.out.println("FINISH INIT DATABASE");
	}
}
