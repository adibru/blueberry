package ch.zhaw.blueberry2.entity;

import javax.persistence.*;

import java.time.LocalDateTime;

@Entity
public class ChildObservation {

    @EmbeddedId
    private ChildObservationKey id;

    @ManyToOne
    @MapsId("childId")
    @JoinColumn(name = "child_id")
    private Child child;

    @ManyToOne
    @MapsId("observationId")
    @JoinColumn(name = "observation_id")
    private Observation observation;

    private LocalDateTime createdAt;

    private int points;

    private String comment;

    public ChildObservationKey getId() {
        return id;
    }

    public void setId(ChildObservationKey id) {
        this.id = id;
    }

    public Child getChild() {
        return child;
    }

    public void setChild(Child child) {
        this.child = child;
    }

    public Observation getObservation() {
        return observation;
    }

    public void setObservation(Observation observation) {
        this.observation = observation;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
