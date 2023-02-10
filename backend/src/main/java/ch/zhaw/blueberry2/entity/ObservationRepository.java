package ch.zhaw.blueberry2.entity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin
public interface ObservationRepository extends JpaRepository<Observation, Long> {
}
