<template>
  <CRow>
    <CCol col="12" lg="6">
      <CCard no-header>
        <CCardBody>
          <CForm>
            <template slot="header">
              Edit User id:  {{ $route.params.id }}
            </template>
            <CAlert
              :show.sync="dismissCountDown"
              color="primary"
              fade
            >
              ({{dismissCountDown}}) {{ message }}
            </CAlert>
            <CInput type="text" label="Name" placeholder="Name" v-model="name"></CInput>
            <CInput type="text" label="Email" placeholder="Email" v-model="email"></CInput>
            <CInput type="text" label="Password (Reset)" placeholder="Password" v-model="password"></CInput>
            <div class="form-row form-group">
              <label class="col-form-label col-sm-3"> Roles </label>
              <div class="col-sm-9" >
                <div v-for="(role,index) in roles" :key="index">
                  <input type="checkbox" id="checkbox" v-model="role.checked">
                  <label for="checkbox">{{ role.name }}</label>
                </div>
              </div>
            </div>
            <CButton color="primary" @click="update()">Save</CButton>
            <CButton color="primary" @click="goBack">Back</CButton>
          </CForm>
        </CCardBody>
      </CCard>
    </CCol>
  </CRow>
</template>

<script>
import axios from 'axios'
export default {
  name: 'EditUser',
  props: {
    caption: {
      type: String,
      default: 'User id'
    },
  },
  data: () => {
    return {
        roles: [],
        name: '',
        email: '',
        password: '',
        showMessage: false,
        message: '',
        dismissSecs: 7,
        dismissCountDown: 0,
        showDismissibleAlert: false
    }
  },
  methods: {
    goBack() {
      this.$router.go(-1)
      // this.$router.replace({path: '/users'})
    },
    update() {
        let self = this;
        axios.post(  '/api/users/' + self.$route.params.id + '?token=' + localStorage.getItem("api_token"),
        {
            _method: 'PUT',
            name: self.name,
            email: self.email,
            password: self.password,
            roles:self.roles,
        })
        .then(function (response) {
            self.message = 'Successfully updated user.';
            self.showAlert();
        }).catch(function (error) {
            console.log(error);
            self.$router.push({ path: '/login' });
        });
    },
    countDownChanged (dismissCountDown) {
      this.dismissCountDown = dismissCountDown
    },
    showAlert () {
      this.dismissCountDown = this.dismissSecs
    },
    getRoles (){
      let self = this;
      axios.get(  '/api/roles?token=' + localStorage.getItem("api_token") )
      .then(function (response) {
        self.roles = response.data;
      }).catch(function (error) {
        // self.$router.push({ path: '/login' });
      });
    }
  },
  mounted: function(){
    this.getRoles();
    let self = this;
    axios.get(  '/api/users/' + self.$route.params.id + '/edit?token=' + localStorage.getItem("api_token"))
    .then(function (response) {
        self.name = response.data.name;
        self.email = response.data.email;
        let arr_role = response.data.roles.split(",");
        self.roles.map(item => {
          if (arr_role.indexOf(item.name) != -1) {
            item.checked= true
          }else{
            item.checked= false
          }
          return item
        })
    }).catch(function (error) {
        console.log(error);
        // self.$router.push({ path: '/login' });
    });
  }
}


</script>
