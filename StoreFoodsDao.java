package com.onlinepizza.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.onlinepizza.model.StoreFoods;

@Repository
public interface StoreFoodsDao extends JpaRepository<StoreFoods, Integer> {

}
