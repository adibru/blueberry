<template>
  <ion-page>
    <ion-tabs>
      <ion-router-outlet></ion-router-outlet>
      <ion-tab-bar slot="bottom">
        <ion-tab-button tab="children" href="/tabs/children">
          <ion-icon :icon="accessibility" />
          <ion-label>Children</ion-label>
        </ion-tab-button>

        <ion-tab-button tab="blog" href="/tabs/blog">
          <ion-icon :icon="clipboard" />
          <ion-label>Blog</ion-label>
        </ion-tab-button>

        <ion-tab-button tab="settings" href="/tabs/settings">
          <ion-icon :icon="cog" />
          <ion-label>Settings</ion-label>
        </ion-tab-button>
      </ion-tab-bar>
    </ion-tabs>
  </ion-page>
</template>

<script setup lang="ts">
import {
  IonTabBar,
  IonTabButton,
  IonTabs,
  IonLabel,
  IonIcon,
  IonPage,
  IonRouterOutlet,
} from '@ionic/vue';
import { accessibility, cog, clipboard } from 'ionicons/icons';
</script>
