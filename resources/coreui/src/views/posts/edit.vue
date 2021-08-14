<template>
  <div class="animated fadeIn">
    <div class="row">
      <div class="col-sm-12">
        <div class="card">
          <loader :active="loading.processing" :text="loading.text" />
          <div class="card-header">
            <strong>Cập nhật bài viết </strong>
          </div>
          <div class="card-body">
            <form action method="post">
              <div class="row">
                <div class="form-group col-sm-8">
                  <label for="nf-email">Tên bài viết <span class="text-danger"> (*)</span></label>
                  <input
                    class="form-control"
                    type="text"
                    name="title"
                    v-model="post.title"
                  />
                </div>
                <div class="form-group col-sm-12">
                  <label for="nf-email" >Mô tả <span class="text-danger"> (*)</span></label>
                  <textarea
                    class="form-control"
                    type="text"
                    name="title"
                    v-model="post.intro_text"
                  /></textarea>
                </div>
                <div class="form-group col-sm-12">
                  <label for="nf-email">Nội dung <span class="text-danger"> (*)</span></label>
                  <editor
                    :api-key="tinymce.key"
                    :init="tinymce.init"
                    id="input_tinymce"
                    :value="post.description"
                  />
                </div>
              </div>
            </form>
          </div>
          <div class="card-footer">
            <router-link class="btn btn-danger" :to="`/posts`">
              <i class="fas fa-undo-alt"></i> Hủy
            </router-link>
            <button class="btn btn-success" type="button" @click="save">
              <i class="fas fa-save"></i> Lưu
            </button>
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
      <div v-html="modal.body"></div>
      <template #header>
        <h5 class="modal-title">{{ modal.title }}</h5>
      </template>
      <template #footer>
        <CButton :color="'btn btn-' + modal.color" @click="exit" type="button"
          >Đóng</CButton
        >
      </template>
    </CModal>
  </div>
</template>

<script>
import axios from "axios";
import u from "../../utilities/utility";
import loader from "../../components/Loading";
import Editor from "@tinymce/tinymce-vue";
import datepicker from "vue2-datepicker";
import moment from 'moment';
import select from 'vue-select'

export default {
  components: {
    loader: loader,
    editor: Editor,
    datepicker,
    "vue-select": select
  },
  name: "Add-Product",
  data() {
    return {
      tinymce: {
        key: "68xdyo8hz3oyr5p47zv3jyvj3h6xg0hc0khthuj123tnskcx",
        init: {
          entity_encoding: "raw",
          height: 240,
          menubar: true,
          plugins: [
            "advlist autolink lists link image charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table paste code help wordcount",
          ],
          toolbar:
            "undo redo | bold italic backcolor | image| media |\
           alignleft aligncenter alignright alignjustify | \
           bullist numlist outdent indent | removeformat | help",
          images_upload_url:
            "/api/upload/upload_file?token=" +
            localStorage.getItem("api_token"),
          images_upload_base_path: "",
        },
      },
      loading: {
        text: "Đang tải dữ liệu...",
        processing: false,
      },
      modal: {
        title: "THÔNG BÁO",
        show: false,
        color: "success",
        body: "Thêm mới bài viết thành công",
        closeOnBackdrop: false,
        action_exit: "exit",
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
    u.g(`/api/posts/detail/${this.$route.params.id}`)
      .then(response => {
      this.loading.processing = false;
      this.post = response.data
    })
  },
  methods: {
    save() {
      let mess = "";
      let resp = true;
      this.post.description = tinymce.get("input_tinymce").getContent();
      if (this.post.title == "") {
        mess += " - Tên bài viết không được để trống<br/>";
        resp = false;
      }
      if (this.post.intro_text == "") {
        mess += " - Mô tả bài viết không được để trống<br/>";
        resp = false;
      }
      if (this.post.description == "") {
        mess += " - Nội dung bài viết không được để trống<br/>";
        resp = false;
      }
      if (!resp) {
        this.modal.color = "warning";
        this.modal.body = mess;
        this.modal.show = true;
        this.modal.action_exit = "close";
        return false;
      }
      this.loading.processing = true;
      u.p(`/api/posts/update/${this.$route.params.id}`,this.post)
        .then((response) => {
          this.loading.processing = false;
          if (response.status == 200) {
            this.modal.color = "success";
            this.modal.body = "Cập nhật bài viết thành công";
            this.modal.show = true;
            this.modal.action_exit = "exit";
          }
        })
        .catch((e) => {
        });
    },
    exit() {
      if (this.modal.action_exit == "exit") {
        this.$router.push({ path: "/posts" });
      } else {
        this.modal.show = false;
      }
    },
  },
};
</script>