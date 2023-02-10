<template>
  <ion-page>
    <PageDefaultHeader myTitle="Blueberry Blog" />

    <ion-content :fullscreen="true">
      <div class="card-container">
        <ion-card
          class="same-height"
          :style="{ '--background': getCardColorHomePage(childObs) }"
          :key="childObs.id"
          v-for="childObs in childObservations"
        >
          <ion-card-header>
            <ion-card-subtitle
              button
              :router-link="'/tabs/children/' + childObs.child.id"
              ><p class="tinydate">
                {{ `${moment(childObs.createdAt).format('DD.MM.YYYY HH:mm')}` }}

                <ion-chip style="position: end"
                  ><ion-label>
                    {{
                      `${childObs.child.firstName} ${childObs.child.name}`
                    }}</ion-label
                  ><ion-avatar
                    ><img
                      alt="Silhouette of a person's head"
                      src="https://ionicframework.com/docs/img/demos/avatar.svg"
                  /></ion-avatar>
                </ion-chip>
              </p>
            </ion-card-subtitle>
            <ion-card-subtitle>
              {{ `${childObs.observation.category}` }}
              <p class="regularsub">{{ childObs.observation.text }}</p>
            </ion-card-subtitle>
          </ion-card-header>
          <ion-card-content>
            <p class="comment" v-if="childObs.comment">Comment</p>
            {{ childObs.comment }}
          </ion-card-content>
        </ion-card>
      </div>
    </ion-content>
  </ion-page>
</template>

<script setup lang="ts">
import PageDefaultHeader from '@/components/PageDefaultHeader.vue';

import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardSubtitle,
  IonCardTitle,
  IonContent,
  IonPage,
  IonAvatar,
  IonChip,
  IonLabel,
} from '@ionic/vue';
import { ref } from 'vue';
import { ChildObservation } from '@/model/model';
import { onMounted } from '@vue/runtime-core';
import { getChildObservations } from '@/api/backend';
import { getCardColorHomePage } from '@/style/cardColor';
import { defineComponent } from 'vue';
import moment from 'moment';

let childObservations = ref<ChildObservation[]>([]);
onMounted(async () => {
  childObservations.value = await getChildObservations();
});
</script>

<style scoped>
/* iOS places the subtitle above the title */
ion-card-header.ios {
  display: flex;
  flex-flow: column-reverse;
}

ion-card {
  width: 30%;
  display: inline-block;
}

@media (max-width: 768px) {
  ion-card {
    width: 100%;
    display: block;
  }
}

.card-container {
  display: flex;
  flex-wrap: wrap;
}

.same-height {
  flex-basis: calc(33.33% - 20px);
  margin: 10px;
}

.observation {
  font-weight: bold;
}

.comment {
  font-weight: bold;
}

.regularsub {
  font-weight: normal;
  font-style: italic;
}
.tinydate {
  font-weight: normal;
  font-style: normal;
  font-size: x-small;
}

.tinyname {
  font-weight: normal;
  font-style: normal;
  font-size: x-small;
}
</style>
