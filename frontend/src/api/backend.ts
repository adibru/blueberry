import {Child, ChildObservation, ChildObservationKey, Observation} from '@/model/model';
import axios from 'axios';
import {API_ROOT} from '@/config/development';

export const CHILDREN_API = API_ROOT + '/children';
export const OBSERVATION_API = API_ROOT + '/observations';
export const CHILD_OBSERVATION_SUFFIX = '/childObservations';
export const CHILD_OBSERVATION_API = API_ROOT + '/childObservations';

export async function getChildren(): Promise<Child[]> {
    const response = await axios.get(CHILDREN_API);
    return response.data._embedded.children;
}

export async function getChildById(id: number): Promise<Child> {
    const response = await axios.get(CHILDREN_API + '/' + id);
    return response.data;
}

export async function createChild(child: Child): Promise<Child> {
    const response = await axios.post(CHILDREN_API, child);
    return response.data;
}

export async function getObservations(): Promise<Observation[]> {
    const response = await axios.get(OBSERVATION_API);
    return response.data._embedded.observations;
}

export async function deleteChild(id: number): Promise<Child[]> {
    const response = await axios.delete(CHILDREN_API + '/' + id);
    return response.data;
}

export async function deleteObservation(id: number): Promise<Observation[]> {
    const response = await axios.delete(OBSERVATION_API + '/' + id);
    return response.data;
}

export async function getObservationById(id: number): Promise<Observation> {
    const response = await axios.get(OBSERVATION_API + '/' + id);
    return response.data;
}

export async function createObservation(
    observation: Observation
): Promise<Observation> {
    const response = await axios.post(OBSERVATION_API, observation);
    return response.data;
}

export async function getChildObservations(): Promise<ChildObservation[]> {
    const response = await axios.get(CHILD_OBSERVATION_API);
    if (response.data?.length > 0) {
        return response.data;
    }
    return [];
}

export async function getChildObservationsById(childId: number): Promise<ChildObservation[]> {
    let response = await axios.get(CHILDREN_API + '/' + childId + CHILD_OBSERVATION_SUFFIX);
    let childObservations = response.data._embedded.childObservations;
    for (let i = 0; i < childObservations.length; i++) {
        childObservations[i].child = await getChildById(childObservations[i].id.childId)
        childObservations[i].observation = await getObservationById(childObservations[i].id.observationId)
    }
    return childObservations;
}

export async function createChildObservation(child: Child, observation: Observation, points: number, comment: string): Promise<void> {
    points = points !== 1 && points !== 2 ? 0 : points;
    let url = '';
    if (comment) {
        url = CHILD_OBSERVATION_API + '?points=' + points + '&comment=' + comment;
    } else {
        url = CHILD_OBSERVATION_API + '?points=' + points;
    }

    axios.post(url, {
        childId: child.id,
        observationId: observation.id
    } as ChildObservationKey);
}
