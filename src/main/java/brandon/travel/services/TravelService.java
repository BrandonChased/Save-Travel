package brandon.travel.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import brandon.travel.models.Travel;
import brandon.travel.repositories.TravelRepository;

@Service
public class TravelService {

    @Autowired
    TravelRepository travelRepository;

    // Create Travel
    public void createTravel(@Valid Travel travel) {
        travelRepository.save(travel);
    }

    // Real All Travels
    public List<Travel> allTravels() {
        return travelRepository.findAll();
    }

    // Read one
    public Travel getOneTravel(Long id) {
        Optional<Travel> optionalTravel = travelRepository.findById(id);
        return optionalTravel.orElse(null);
    }

    // Update
    public void updateTravel(Travel travel) {
        travelRepository.save(travel);
    }

    public void deleteBurger(Travel travel) {
        travelRepository.delete(travel);
    }
}
