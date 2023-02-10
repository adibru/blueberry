<template>
  <ion-page>
    <PageDefaultHeader myTitle="Blueberry Settings" />
    <ion-content :fullscreen="true">
      <ion-header collapse="condense">
        <ion-toolbar>
          <ion-title size="large">Admin Page</ion-title>
        </ion-toolbar>
      </ion-header>

      <ion-grid :fixed="true">
        <ion-row class="center">
          <ion-col>
            <ion-button expand="block" router-link="editchildren">
              <ion-icon :icon="people" style="font-size: 5em" />Edit
              Children</ion-button
            ></ion-col
          >
          <ion-col>
            <ion-button expand="block" router-link="editobservation"
              ><ion-icon :icon="barbell" style="font-size: 5em" />Edit
              Obseravation</ion-button
            >
          </ion-col>
        </ion-row>
      </ion-grid>
    </ion-content>
  </ion-page>
</template>

<script setup lang="ts">
import PageDefaultHeader from "@/components/PageDefaultHeader.vue";
import {
  IonIcon,
  IonGrid,
  IonRow,
  IonCol,
  IonButton,
  IonPage,
  IonHeader,
  IonToolbar,
  IonTitle,
  IonContent,
} from "@ionic/vue";
import { barbell, people } from "ionicons/icons";

import { defineComponent } from "vue";
</script>

<style scoped>
ion-col {
  color: #fff;
  text-align: center;
}
ion-button {
  width: 100%;
  height: 200px;
  margin: auto;
}
.center {
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
