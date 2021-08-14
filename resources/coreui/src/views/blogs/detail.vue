<template>
  <div class="animated fadeIn">
    <div class="row">
      <div class="col-lg-12">
        <h1>{{post.title}}</h1>
        <div class="card">
          <loader :active="loading.processing" :text="loading.text" />
          <div class="card-header">
            <i>{{post.creator_name}} - {{post.published_at}}</i>
          </div>
          <div class="card-body" v-html="post.description">
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import paging from "../../components/Pagination";
import u from "../../utilities/utility";
import loader from "../../components/Loading";
export default {
  components: {
    loader: loader,
    paging: paging,
  },
  name: "List-Parent",
  data() {
    return {
      loading: {
        text: "Đang tải dữ liệu...",
        processing: false,
      },
      post: {
        title: "",
        intro_text: "",
        description: "",
      },
    };
  },
  created() {
    this.loading.processing = true;
    u.g(`/api/blogs/detail/${this.$route.params.id}`)
      .then(response => {
      this.loading.processing = false;
      this.post = response.data
    })
  },
  methods: {
  },
};
</script>