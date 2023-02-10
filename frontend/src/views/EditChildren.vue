<template>
  <ion-page>
    <PageDefaultHeader myTitle="Blueberry Settings / Edit Children" />
    <ion-content class="ion-padding">
      <ion-list>
        <ion-item
          slot="content"
          v-for="child of existingChildren"
          :key="child.id"
        >
          <ion-label>{{ child.name }} {{ child.firstName }}</ion-label>
          <ion-label>{{ child.birthdate }}</ion-label>
          <div id="editbuttons">
            <ion-label>
              <ion-tab-button tab="edit" @click="editSpecificChild(child)">
                <ion-icon :icon="pencil" />
              </ion-tab-button>
            </ion-label>
            <ion-label>
              <ion-tab-button
                @click="
                  deleteSpecificChild(child.id, child.name, child.firstName)
                "
              >
                <ion-icon :icon="trash" />
              </ion-tab-button>
            </ion-label>
          </div>
        </ion-item>
      </ion-list>

      <ion-button
        class="modalbuttonforchildren"
        id="open-modal-children"
        expand="block"
      >
        Add a new child
      </ion-button>
      <ion-modal ref="modal" trigger="open-modal-children">
        <ion-header>
          <ion-toolbar>
            <ion-buttons slot="start">
              <ion-button @click="cancel()">Cancel</ion-button>
            </ion-buttons>
            <ion-title>Child properties</ion-title>
            <ion-buttons slot="end">
              <ion-button :strong="true" @click="createANewChild">
                Confirm
              </ion-button>
            </ion-buttons>
          </ion-toolbar>
        </ion-header>
        <ion-item>
          <ion-label position="stacked">Surname</ion-label>
          <ion-input v-model="children.name" required="true" />
        </ion-item>

        <ion-item>
          <ion-label position="stacked">Firstname</ion-label>
          <ion-input v-model="children.firstName" required />
        </ion-item>

        <ion-item>
          <ion-label position="stacked">Birthdate</ion-label>
          <ion-input type="date" v-model="children.birthdate" required />
        </ion-item>
        <ion-item>
          <ion-label position="stacked">Gender</ion-label>
          <ion-select
            interface="popover"
            placeholder="Select Gender"
            v-model="children.gender"
            required
          >
            <ion-select-option value="M">Male</ion-select-option>
            <ion-select-option value="W">Female</ion-select-option>
            <ion-select-option value="D">Divers</ion-select-option>
          </ion-select>
        </ion-item>
        <ion-item>
          <ion-label position="stacked">Nationality</ion-label>
          <ion-input v-model="children.nationality" required />
        </ion-item>
        <ion-item>
          <ion-label position="stacked">Entry Date</ion-label>
          <ion-input
            type="date"
            v-model="children.entryDate"
            required
          ></ion-input>
        </ion-item>
      </ion-modal>
    </ion-content>
  </ion-page>
</template>

<script setup lang="ts">
import {
  IonButtons,
  IonModal,
  IonIcon,
  IonButton,
  IonSelect,
  IonAccordionGroup,
  IonAccordion,
  IonList,
  IonItem,
  IonLabel,
  IonInput,
  IonPage,
  IonHeader,
  IonToolbar,
  IonTitle,
  IonContent,
} from "@ionic/vue";
import { pencil, trash } from "ionicons/icons";
import PageDefaultHeader from "@/components/PageDefaultHeader.vue";
import { Child } from "../model/model";
import { createChild } from "../api/backend";
import { ref } from "vue";
import { onMounted } from "@vue/runtime-core";
import { getChildren } from "../api/backend";
import { deleteChild } from "../api/backend";
import { IonSelectOption, alertController } from "@ionic/vue";
import { OverlayEventDetail } from "@ionic/core/components";
import { defineComponent } from "vue";

let children = {} as Child;

function createANewChild() {
  createChild(children);
  document.location.reload();
}

let existingChildren = ref<Child[]>([]);
onMounted(async () => {
  existingChildren.value = await getChildren();
});

const handlerMessage = ref("");

const deleteSpecificChild = async (
  id: number,
  name: string,
  firstname: string
) => {
  const alert = await alertController.create({
    header: "You sure you wanna delete " + name + " " + firstname + " ?",
    buttons: [
      {
        text: "Cancel",
        role: "cancel",
        handler: () => {},
      },
      {
        text: "Delete",
        role: "confirm",
        handler: () => {
          handlerMessage.value = "Alert confirmed";
          deleteChild(id);
          document.location.reload();
        },
      },
    ],
  });

  await alert.present();
};

function editSpecificChild(child: Child) {
  children = child;
  //alert("Value 1: " + children.name + "\nValue 2: " + children.firstName);

  let element: HTMLElement = document.getElementsByClassName(
    "modalbuttonforchildren"
  )[0] as HTMLElement;
  element.click();
}

function cancel() {
  document.location.reload();
}
</script>


<style scoped>
ion-modal {
  --width: fit-content;
  --min-width: 250px;
  --height: fit-content;
  --border-radius: 6px;
  --box-shadow: 0 28px 48px rgba(0, 0, 0, 0.4);
}

#editbuttons ion-label {
  padding: 8px;
}
</style>
