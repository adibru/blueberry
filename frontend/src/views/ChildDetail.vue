<template>
  <ion-page>
    <PageDefaultHeader myTitle="Child Details" />
    <ion-content>
      <ion-card-header>
        <ion-card-title>{{ child.firstName }} {{ child.name }}</ion-card-title>
        <ion-card-subtitle>Birthday: {{ child.birthdate }}</ion-card-subtitle>
        <ion-card-subtitle
          >Nationality: {{ child.nationality }}
        </ion-card-subtitle>
        <ion-card-subtitle>Entry Date: {{ child.entryDate }}</ion-card-subtitle>
      </ion-card-header>
      <ion-accordion-group>
        <ion-accordion v-for="category in categories" :key="category">
          <ion-item slot="header" color="light">
            <ion-label>
              <ion-icon slot="start" :icon="star"></ion-icon>
              {{ ` ${category} (${getChildObservationPercent(category)})` }}
            </ion-label>
          </ion-item>
          <ion-item
            v-for="observation in observations.filter(
              (obs) => obs.category === category
            )"
            class="ion-padding"
            slot="content"
          >
            <p>
              <ion-label slot="start" position="stacked"
                >{{
                  `${observation.text} (expexted at ${observation.expectedAtMonths} months)`
                }}
              </ion-label>
            </p>
            <p>
              <ion-button
                size="small"
                @click="updateCompletionId(observation.id)"
                :disabled="observationCompleted(observation)"
              >
                <ion-icon slot="start" :icon="create"></ion-icon>
                Edit
              </ion-button>
            </p>

            <div v-if="completeId === observation.id">
              <ion-item>
                <ion-label position="stacked">Points</ion-label>
                <ion-range
                  v-model="points"
                  :pin="true"
                  :pin-formatter="pinFormatter"
                  :ticks="true"
                  :snaps="true"
                  :min="0"
                  :max="2"
                ></ion-range>
              </ion-item>
              <ion-item>
                <ion-label position="stacked">Comment</ion-label>
                <ion-input
                  v-model="comment"
                  placeholder="write a comment here"
                ></ion-input>
              </ion-item>
              <ion-button
                @click="
                  completeObservation(child, observation, points, comment)
                "
              >
                <ion-icon slot="start" :icon="save"></ion-icon>
                Save
              </ion-button>
            </div>
          </ion-item>
        </ion-accordion>
      </ion-accordion-group>
    </ion-content>
  </ion-page>
</template>

<script setup lang="ts">
import PageDefaultHeader from '../components/PageDefaultHeader.vue';
import { onMounted } from '@vue/runtime-core';
import {
  createChildObservation,
  getChildById,
  getChildObservationsById,
  getObservations,
} from '@/api/backend';
import { Child, ChildObservation, Observation } from '@/model/model';
import { defineComponent } from 'vue';
import { create, save, star } from 'ionicons/icons';
import {
  IonRange,
  IonRadioGroup,
  IonIcon,
  IonGrid,
  IonRow,
  IonCol,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardSubtitle,
  IonCardTitle,
  IonContent,
  IonButton,
  IonPage,
  IonAccordionGroup,
  IonAccordion,
  IonList,
  IonItem,
  IonLabel,
  IonSelect,
  IonSelectOption,
  IonInput,
} from '@ionic/vue';
import { ref } from 'vue';
import { useRoute } from 'vue-router';

let child = ref<Child>({} as Child);
const route = useRoute();

const id = route.params.id;

let observations = ref<Observation[]>([]);
let categories = ref<string[]>([]);
let childObservations = ref<ChildObservation[]>([]);

let completeId = ref<number>();
let points: number;
let comment: string;

onMounted(async () => {
  child.value = await getChildById(+id);
  let allObservations = await getObservations();
  let age = differenceInMonths(new Date(child.value.birthdate), new Date());
  let nextHigherAge = nextHigherNumber(age, allObservations.map(obs => obs.expectedAtMonths));
  console.log(nextHigherAge)
  allObservations = allObservations.filter(
    (obs) => obs.expectedAtMonths <= nextHigherAge
  );

  observations.value = allObservations;
  let categoryStrings = observations.value.map(
    (observation) => observation.category
  );
  categoryStrings = categoryStrings.filter(
    (n, i) => categoryStrings.indexOf(n) === i
  );
  categories.value = categoryStrings;
  childObservations.value = await getChildObservationsById(+id);
});

function differenceInMonths(d1: Date, d2: Date): number {
  let months = (d2.getFullYear() - d1.getFullYear()) * 12;
  months -= d1.getMonth();
  months += d2.getMonth();
  return months <= 0 ? 0 : months;
}

function nextHigherNumber(nr: number, numbers: number[]): number {
  let nextHigher = 9999;
  for (const number of numbers) {
    if(number > nr && number < nextHigher) {
      nextHigher = number;
    }
  }
  return nextHigher;
}

async function completeObservation(
  child: Child,
  observation: Observation,
  point: number,
  comment: string
) {
  await createChildObservation(child, observation, points, comment);
  window.location.reload();
}

function updateCompletionId(observationId: number): void {
  completeId.value !== observationId
    ? (completeId.value = observationId)
    : (completeId.value = 0);
}

function getChildObservationPercent(category: string): string {
  let relevantObservations =
    observations.value.filter((obs) => obs.category === category).length * 2;
  let relevantChildObservations = childObservations.value
    .filter((co) => co?.observation.category === category)
    .reduce((sum, current) => sum + current.points, 0);

  let percent = (relevantChildObservations / relevantObservations) * 100;
  return Math.round(percent * 100) / 100 + '%';
}

function observationCompleted(observation: Observation): boolean {
  let matchingChildObservation = childObservations.value.filter(
    (co) =>
      co?.observation.id === observation.id && co.child.id == child.value.id
  );
  return (
    matchingChildObservation.length > 0 &&
    matchingChildObservation[0].points === 2
  );
}

function pinFormatter(value: number): string {
  return `${value === 0 ? 0 : value === 1 ? 50 : 100}% `;
}
</script>

<style scoped>
/* iOS places the subtitle above the title */
ion-card-header.ios {
  display: flex;
  flex-flow: column-reverse;
}

ion-select {
  --padding-start: -30px;
  --placeholder-color: ;
  --placeholder-opacity: 1;
  --width: 100%;
  justify-content: center;
}

ion-select::part(placeholder),
ion-select::part(text) {
  font-size: 15px;
  font-weight: 400;
  flex: 0 0 auto;
}

ion-select::part(placeholder)::first-letter {
  font-size: 15px;
  font-weight: 400;
}

ion-select::part(text) {
  color: ;
}

ion-select::part(icon) {
  color: #e9dd2f;
  opacity: 1;
}
</style>
