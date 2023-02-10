import { Observation } from "@/model/model";

export function getObservationsCategories(observations: Observation[]): string[] {

    let categoryStrings = observations.map(
        (observation) => observation.category
    );
    categoryStrings = categoryStrings.filter(
        (n, i) => categoryStrings.indexOf(n) === i
    );
    return categoryStrings;
}
