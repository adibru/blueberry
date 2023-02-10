/* tslint:disable */
/* eslint-disable */
// Generated using typescript-generator version 3.1.1185 on 2023-02-10 11:21:44.

export interface Child {
    id: number;
    name: string;
    firstName: string;
    birthdate: Date;
    nationality: string;
    entryDate: Date;
    gender: Gender;
}

export interface ChildObservation {
    id: ChildObservationKey;
    child: Child;
    observation: Observation;
    createdAt: Date;
    points: number;
    comment: string;
}

export interface ChildObservationKey extends Serializable {
    childId: number;
    observationId: number;
}

export interface ChildObservationRepository extends JpaRepository<ChildObservation, ChildObservationKey> {
}

export interface ChildRepository extends JpaRepository<Child, number> {
}

export interface Observation {
    id: number;
    expectedAtMonths: number;
    category: string;
    text: string;
}

export interface ObservationRepository extends JpaRepository<Observation, number> {
}

export interface Serializable {
}

export interface JpaRepository<T, ID> extends PagingAndSortingRepository<T, ID>, QueryByExampleExecutor<T> {
}

export interface PagingAndSortingRepository<T, ID> extends CrudRepository<T, ID> {
}

export interface QueryByExampleExecutor<T> {
}

export interface CrudRepository<T, ID> extends Repository<T, ID> {
}

export interface Repository<T, ID> {
}

export type Gender = "M" | "W" | "D";
