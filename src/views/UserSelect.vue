<template>
  <div>
    <h5>Basic</h5>
    <Dropdown
      v-model="selectedCity1"
      :options="cities"
      optionLabel="name"
      optionValue="code"
      placeholder="Select a City"
    />
    <p>Selected: {{ selectedCity1 }}</p>

    <h5>Editable</h5>
    <Dropdown
      v-model="selectedCity2"
      :options="cities"
      optionLabel="name"
      :editable="true"
    />
  </div>
  <p>Selected: {{ selectedCity2 }}</p>
</template>

<script lang="ts">
import { ref } from "vue";
// test
export default {
  // eslint-disable-next-line
  setup() {
    const selectedCity1 = ref();
    const selectedCity2 = ref();
    const selectedCountry = ref();
    const selectedGroupedCity = ref();
    const selectedItem1 = ref();
    const selectedItem2 = ref();
    const loading = ref(false);
    const cities = ref([
      { name: "New York", code: "NY" },
      { name: "Rome", code: "RM" },
      { name: "London", code: "LDN" },
      { name: "Istanbul", code: "IST" },
      { name: "Paris", code: "PRS" },
    ]);

    return {
      selectedCity1,
      selectedCity2,
      selectedCountry,
      selectedGroupedCity,
      cities,
      selectedItem1,
      selectedItem2,
      loading,
    };
  },
};
</script>

<style lang="scss" scoped>
.p-dropdown {
  width: 14rem;
}

.country-item {
  img {
    width: 17px;
    margin-right: 0.5rem;
  }
}
</style>
