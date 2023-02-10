<!-- <template>
  <swiper-container
    :slides-per-view="3"
    :space-between="spaceBetween"
    :centered-slides="true"
    :pagination="{
      hideOnClick: true,
    }"
    :breakpoints="{
      768: {
        slidesPerView: 3,
      },
    }"
    @progress="onProgress"
    @slidechange="onSlideChange"
  >
    <swiper-slide>
      <ion-card :key="child.id" v-for="child in children">
        <ion-card-header>
          <ion-card-title
            >{{ child.firstName }} {{ child.name }}</ion-card-title
          >
          <ion-card-subtitle>{{ child.birthDate }}</ion-card-subtitle>
        </ion-card-header>

        <ion-card-content>
          Here's a small text description for the card content. Nothing more,
          nothing less.
        </ion-card-content>
      </ion-card>
    </swiper-slide>
  </swiper-container>
</template>

<script lang="ts">

import { useChildren } from '@/composables/useChildren';
import { loadingController } from '@ionic/vue';
const { children, getChildren } = useChildren();

import { register } from 'swiper/element/bundle';

register();

export default function () {
  setup() {
    const spaceBetween = 10;
    const onProgress = (e) => {
      const [swiper, progress] = e.detail;
      console.log(progress)
    };

    const onSlideChange = (e) => {
      console.log('slide changed')
    }

    return {
      spaceBetween,
      onProgress,
      onSlideChange,
    };
  }
}
</script> -->
