package com.test.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.entity.City;

public interface CityRepository extends JpaRepository<City, Integer> {

}
