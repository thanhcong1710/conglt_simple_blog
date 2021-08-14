<template>
  <div class="suggetion-search">
    <input type="hidden" :v-model="selectedObject" />
    <autocomplete
      url="/api/students/suggest/"
      anchor="label"
      label="title"
      name="search_sugget"
      id="sugget"
      className="search-autocomplete"
      :title="title"
      :classes="{
        wrapper: 'form-wrapper',
        input: 'form-control',
        list: 'data-list',
        item: 'data-list-item',
      }"
      :min="3"
      :options="response"
      :debounce="10"
      :filterByAnchor="true"
      :placeholder="placeholderObject"
      :onShouldGetData="suggestObjects"
      :onSelect="selectItem"
    >
    </autocomplete>
    <div :class="{ active: !isLoading }" class="icon-group search">
      <i title="Nhập thông tin tìm kiếm" class="fa fa-search"></i>
      <div
        :class="displayIcon"
        class="search-suggestion-icon ajax-loading"
      ></div>
    </div>
  </div>
</template>

<script>
import u from "../utilities/utility";
import Autocomplete from "vue2-autocomplete-js";

export default {
  props: {
    title: {
      type: String,
      default: "",
    },
    displayIcon: {
      type: String,
      default: "hidden",
    },
    endpoint: {
      type: Number,
      default: 0,
    },
    placeholderObject: {
      type: String,
      default: "Tìm kiếm theo tên hoặc mã",
    },
    response: {
      type: Array,
      default: () => [],
    },
    suggestObjects: {
      type: Function,
      default: null,
    },
    selectedObject: {
      type: Object,
      default: null,
    },
    onSelectObject: {
      type: Function,
      default: null,
    },
    beforeSearchObject: {
      type: Function,
      default: null,
    },
    afterSearchObject: {
      type: Function,
      default: null,
    },
  },
  data() {
    return {
      name: "",
      isLoading: false
    };
  },
  components: {
    Autocomplete,
  },
  watch: {
    endpoint() {
      console.log(`Endpoint: ${this.endpoint}`);
    },
  },
  methods: {
    selectItem(student) {
      this.$emit("doSelectObject", student);
      this.onSelectObject ? this.onSelectObject(student) : null;
    },
  },
};
</script>

<style language="scss">
.suggetion-search {
  position: relative;
}
.suggetion-search .icon-group {
  position: absolute;
  top: 8px;
  right: 6px;
}
.autocomplete ul {
  position: absolute;
  list-style: none;
  background: #eaeef1;
  padding: 0;
  border-bottom: 1px solid #c2cfd6;
  border-left: 1px solid #c2cfd6;
  border-right: 1px solid #c2cfd6;
  margin: 0;
  width: 100%;
  z-index: 99999;
  display: inline-block;
  min-width: 15%;
}
.autocomplete ul li a {
  text-decoration: none;
  display: block;
  background: #f7f7f7;
  color: #2b2b2b;
  padding: 5px;
  padding-left: 10px;
  border-bottom: 1px solid #d2dbe0;
}
.autocomplete ul li:hover,
.autocomplete ul li.focus-list,
.autocomplete ul li.focus-list a {
  background: #c1d1e0;
}
.autocomplete .autocomplete-anchor-text{
  font-weight: normal;
}
</style>
