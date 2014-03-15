package com.test.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.test.entity.City;

public interface CityRepository extends JpaRepository<City, Integer> {

	@Query("select c from City c where lower(c.name) = lower(:name)")
	City findByName(@Param("name") String name);

}
