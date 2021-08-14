<template>
  <div class="animated fadeIn">
    <div class="row">
      <div class="col-lg-12">
        <h1>Blogs</h1>
        <div class="card"  v-for="(item, index) in posts" :key="index">
          <loader :active="loading.processing" :text="loading.text" />
          <div class="card-header">
            <router-link :to="`/blogs/${item.id}/detail`">
              <strong><a>{{item.title}}</a></strong>
            </router-link>
          </div>
          <div class="card-body">
            <p>{{item.intro_text}}</p>
            <p style="text-align: right"><i>{{item.creator_name}} - {{item.published_at}}</i></p>
          </div>
        </div>
        <div class="text-center">
          <nav aria-label="Page navigation">
            <paging
              :rootLink="pagination.url"
              :id="pagination.id"
              :listStyle="pagination.style"
              :customClass="pagination.class"
              :firstPage="pagination.spage"
              :previousPage="pagination.ppage"
              :nextPage="pagination.npage"
              :lastPage="pagination.lpage"
              :currentPage="pagination.cpage"
              :pagesItems="pagination.total"
              :pagesLimit="pagination.limit"
              :pageList="pagination.pages"
              :routing="changePage"
            ></paging>
          </nav>
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
      posts: [],
      pagination: {
        url: "/api/posts/list",
        id: "",
        style: "line",
        class: "",
        spage: 1,
        ppage: 1,
        npage: 0,
        lpage: 1,
        cpage: 1,
        total: 0,
        limit: 20,
        limitSource: [10, 20, 30, 40, 50],
        pages: [],
      },
    };
  },
  created() {
    this.search();
  },
  methods: {
    search(a) {
      const data = {
      };
      const link = "/api/blogs/list";

      this.loading.processing = true;
      u.p(link, data)
        .then((response) => {
          this.loading.processing = false;
          this.posts = response.data.list;
          this.pagination.spage = response.data.paging.spage;
          this.pagination.ppage = response.data.paging.ppage;
          this.pagination.npage = response.data.paging.npage;
          this.pagination.lpage = response.data.paging.lpage;
          this.pagination.cpage = response.data.paging.cpage;
          this.pagination.total = response.data.paging.total;
          this.pagination.limit = response.data.paging.limit;
        })
        .catch((e) => {
        });
    },
    changePage(link) {
      const info = link
        .toString()
        .substr(this.pagination.url.length)
        .split("/");
      const page = info.length > 1 ? info[1] : 1;
      this.pagination.cpage = parseInt(page);
      this.search();
    },
  },
};
</script>