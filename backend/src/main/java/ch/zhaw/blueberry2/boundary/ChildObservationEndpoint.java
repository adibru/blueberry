package ch.zhaw.blueberry2.boundary;

import ch.zhaw.blueberry2.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@CrossOrigin
public class ChildObservationEndpoint {

    @Autowired
    private ChildObservationRepository childObservationRepository;
    @Autowired
    private ChildRepository childRepository;
    @Autowired
    private ObservationRepository observationRepository;

    @GetMapping(path = "/api/childObservations")
    public List<ChildObservation> getAllChildObservation() {
        return childObservationRepository.findAll(Sort.by(Sort.Direction.DESC, "createdAt"));
    }

    @PostMapping(path = "/api/childObservations")
    public void createChildObservation(@RequestBody ChildObservationKey childObservationKey, @RequestParam int points, @RequestParam(required = false) String comment) {
        ChildObservation childObservation = new ChildObservation();
        Child child = childRepository.getReferenceById(childObservationKey.getChildId());
        Observation observation = observationRepository.getReferenceById(childObservationKey.getObservationId());
        childObservation.setId(childObservationKey);
        childObservation.setChild(child);
        childObservation.setObservation(observation);
        childObservation.setCreatedAt(LocalDateTime.now());
        childObservation.setPoints(points);
        childObservation.setComment(comment);
        childObservationRepository.save(childObservation);
        child.getChildObservations().add(childObservation);
        childRepository.save(child);
        observation.getChildObservations().add(childObservation);
        observationRepository.save(observation);
    }
}