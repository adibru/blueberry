package ch.zhaw.blueberry2.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import java.io.Serializable;

@Embeddable
public class ChildObservationKey implements Serializable {
    @Column(name = "child_id")
    long childId;

    @Column(name = "observation_id")
    long observationId;

    public long getChildId() {
        return childId;
    }

    public void setChildId(long childId) {
        this.childId = childId;
    }

    public long getObservationId() {
        return observationId;
    }

    public void setObservationId(long observationId) {
        this.observationId = observationId;
    }
}
