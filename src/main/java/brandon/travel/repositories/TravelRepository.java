package brandon.travel.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import brandon.travel.models.Travel;

public interface TravelRepository extends CrudRepository<Travel, Long> {
    List<Travel> findAll();
}