package com.onlinepizza.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.onlinepizza.model.PizzaStore;

@Repository
public interface PizzaStoreDao extends JpaRepository<PizzaStore, Integer> {
	
	List<PizzaStore> findByNameContainingIgnoreCase(String name);
	@Query(value="select count(p) from PizzaStore p")
	Long countOfPizzaStores();

}
