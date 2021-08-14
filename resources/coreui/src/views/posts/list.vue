<template>
  <div class="animated fadeIn">
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <loader :active="loading.processing" :text="loading.text" />
          <div class="card-header">
            <strong>Danh sách bài viết</strong>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="form-group col-sm-3">
                <label for="name">Từ khóa</label>
                <input
                  class="form-control"
                  v-model="searchData.keyword"
                  type="text"
                  placeholder="Tên bài viết"
                />
              </div>
              <div class="form-group col-sm-3">
                <label for="ccmonth">Trạng thái</label>
                <select class="form-control" v-model="searchData.status">
                  <option value>Chọn trạng thái</option>
                  <option value="0">Chờ duyệt</option>
                  <option value="1">Đã duyệt</option>
                </select>
              </div>
              <div class="form-group  col-sm-3">
                <label for="nf-email">Ngày đăng </label>
                <datepicker
                  class="form-control calendar"
                  v-model="searchData.published_date"
                  placeholder="Chọn ngày đăng"
                  lang="lang"
                  @change="selectDate"
                />
              </div>
              <div class="form-group col-sm-3">
                <label for="ccmonth">Sắp xếp theo</label>
                <select class="form-control" v-model="searchData.order">
                  <option value>Chọn sắp xếp theo</option>
                  <option value="0">Thời gian tạo giảm dần</option>
                  <option value="1">Thời gian tạo tăng dần</option>
                  <option value="2">Thời gian duyệt giảm dần</option>
                  <option value="3">Thời gian duyệt tăng dần</option>
                </select>
              </div>
              <div class="form-group col-sm-12">
                <router-link class="btn btn-success" :to="'/posts/add'">
                  <i class="fa fa-plus"></i> Thêm mới
                </router-link>
                <button class="btn btn-info" type="submit" @click="search()">
                  <i class="fa fa-search"></i> Tìm kiếm
                </button>
                <button
                  class="btn btn-secondary"
                  type="reset"
                  @click="reset()"
                >
                  <i class="fas fa-undo-alt"></i> Reset
                </button>
              </div>
            </div>
            <table class="table table-responsive-sm">
              <thead>
                <tr>
                  <th width="2%">STT</th>
                  <th width="20%">Tên bài viết</th>
                  <th width="10%">Người tạo</th>
                  <th width="10%">Thời gian tạo</th>
                  <th width="10%">Trạng thái</th>
                  <th width="10%">Thời gian đăng</th>
                  <th width="10%">Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(item, index) in posts" :key="index">
                  <td>
                    {{ index + 1 + (pagination.cpage - 1) * pagination.limit }}
                  </td>
                  <td><router-link :to="`/posts/${item.id}/edit`"><a>{{ item.title }}</a></router-link></td>
                  <td>{{ item.creator_name }}</td>
                  <td>{{ item.created_at }}</td>
                  <td>{{ item.status | getStatusName }}</td>
                  <td>{{ item.published_at }}</td>
                  <td>
                    <router-link
                      class="btn btn-sm btn-success"
                      :to="`/posts/${item.id}/edit`"
                      v-if="item.status==0"
                    >
                      <i class="fa fa-edit"></i> </router-link>
                    <button
                      class="btn btn-sm btn-danger"
                      type="button"
                      @click="deleteItem(item.id)"
                      v-if="item.status==0"
                    >
                      <i class="fas fa-times"></i></button>
                    <button
                      class="btn btn-sm btn-info"
                      type="button"
                      @click="showModalActiveItem(item)"
                      v-if="item.status==0 && item.can_published ==1"
                    >
                      <i class="fas fa-check"></i></button>
                  </td>
                </tr>
              </tbody>
            </table>
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
    </div>
    <CModal
      :title="modal.title"
      :show.sync="modal.show"
      :color="modal.color"
      :closeOnBackdrop="modal.closeOnBackdrop"
    >
      {{ modal.body }}
      <template #header>
        <h5 class="modal-title">{{ modal.title }}</h5>
      </template>
      <template #footer>
        <CButton :color="'btn btn-' + modal.color" @click="exit" type="button"
          >Đóng</CButton
        >
      </template>
    </CModal>
    <CModal
      :title="modal_active.title"
      :show.sync="modal_active.show"
      :color="modal_active.color"
      :closeOnBackdrop="modal_active.closeOnBackdrop"
    >
      <div class="form-group col-sm-8">
        <label for="ccmonth">Chọn thời gian đăng bài</label>
        <input class="form-control" type="datetime-local" id="published_date">
      </div>  
      <p style="color:red">{{modal_active.error}}</p>
      <template #header>
        <h5 class="modal-title">{{ modal_active.title }}</h5>
      </template>
      <template #footer>
        <CButton :color="'btn btn-success'" @click="active" type="button"
          >Duyệt</CButton
        >
        <CButton :color="'btn btn-secondary'" @click="exit_active" type="button"
          >Đóng</CButton
        >
      </template>
    </CModal>
  </div>
</template>

<script>
import paging from "../../components/Pagination";
import u from "../../utilities/utility";
import loader from "../../components/Loading";
import datepicker from "vue2-datepicker";
import moment from 'moment';
export default {
  components: {
    loader: loader,
    paging: paging,
    datepicker,
  },
  name: "List-Parent",
  data() {
    return {
      loading: {
        text: "Đang tải dữ liệu...",
        processing: false,
      },
      searchData: {
        keyword: "",
        status: "",
        published_date:"",
        pagination: this.pagination,
        order:"",
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
      modal: {
        title: "THÔNG BÁO",
        show: false,
        color: "success",
        body: "Cập nhật khách hàng thành công",
        closeOnBackdrop: false,
      },
      modal_active: {
        title: "DUYỆT BÀI VIẾT",
        show: false,
        color: "success",
        closeOnBackdrop: false,
        published_date:"",
        error:"",
        post_id :"",
      },
    };
  },
  created() {
    this.search();
  },
  methods: {
    selectDate(date) {
      if (date) {
        this.searchData.published_date = moment(date).format("YYYY-MM-DD");
      }
    },
    reset() {
      location.reload();
    },
    search(a) {
      const data = {
        keyword: this.searchData.keyword,
        status: this.searchData.status,
        published_date: this.searchData.published_date,
        order: this.searchData.order,
      };
      const link = "/api/posts/list";

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
    deleteItem(id) {
      const delStdConf = confirm("Bạn có chắc rằng muốn bài viết này không?");
      if (delStdConf === true) {
        u.g(`/api/posts/delete/${id}`)
          .then((response) => {
            this.loading.processing = false;
            if (response.status == 200) {
              this.modal.color = "success";
              this.modal.body = "Xóa bài viết thành công";
              this.modal.show = true;
              this.search();
            }
          })
          .catch((e) => {
          });
      }
    },
    exit() {
      this.modal.show = false;
    },
    exit_active(){
      this.modal_active.show = false;
    },
    showModalActiveItem(data){
      this.modal_active.title = "DUYỆT BÀI VIẾT - "+data.title;
      this.modal_active.color = "info";
      this.modal_active.show = true;
      this.modal_active.error = "";
      this.modal_active.post_id = data.id
      document.getElementById('published_date').value=""
    },
    active(){
      if(document.getElementById('published_date').value == ""){
        this.modal_active.error = "Vui lòng chọn thời gian đăng bài";
      }else{
        this.modal_active.show = false;
        const data = {
          published_date: document.getElementById('published_date').value
        };
        this.loading.processing = true;
        u.p(`/api/posts/active/${this.modal_active.post_id}`,data)
          .then((response) => {
            this.loading.processing = false;
            if (response.status == 200) {
              this.modal.color = "success";
              this.modal.body = "Duyệt bài viết thành công";
              this.modal.show = true;
              this.search();
            }
          })
          .catch((e) => {
          });
      }
    }
  },
  filters: {
    getStatusName(value) {
      return value == 1 ? "Đã duyệt" : "Chờ duyệt";
    },
  },
};
</script>