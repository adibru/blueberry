import {Child, ChildObservation} from '@/model/model';

export function getCardColor(child: Child): string {
  return child.gender === 'M'
    ? '#e4ffde'
    : child.gender === 'W'
    ? '#ffd3fd'
    : '#fffddb';
}
export function getCardColorHomePage(childObs: ChildObservation): string {
  return childObs.points === 0 ? '#ffd3fd' : childObs.points === 1 ? '#fffddb' :'#e4ffde';
}
