(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[45],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/coreui/src/views/users/EditUser.vue?vue&type=script&lang=js&":
/*!****************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/coreui/src/views/users/EditUser.vue?vue&type=script&lang=js& ***!
  \****************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var axios__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! axios */ "./resources/coreui/node_modules/axios/index.js");
/* harmony import */ var axios__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(axios__WEBPACK_IMPORTED_MODULE_0__);
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

/* harmony default export */ __webpack_exports__["default"] = ({
  name: 'EditUser',
  props: {
    caption: {
      type: String,
      "default": 'User id'
    }
  },
  data: function data() {
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
    };
  },
  methods: {
    goBack: function goBack() {
      this.$router.go(-1); // this.$router.replace({path: '/users'})
    },
    update: function update() {
      var self = this;
      axios__WEBPACK_IMPORTED_MODULE_0___default.a.post('/api/users/' + self.$route.params.id + '?token=' + localStorage.getItem("api_token"), {
        _method: 'PUT',
        name: self.name,
        email: self.email,
        password: self.password,
        roles: self.roles
      }).then(function (response) {
        self.message = 'Successfully updated user.';
        self.showAlert();
      })["catch"](function (error) {
        console.log(error);
        self.$router.push({
          path: '/login'
        });
      });
    },
    countDownChanged: function countDownChanged(dismissCountDown) {
      this.dismissCountDown = dismissCountDown;
    },
    showAlert: function showAlert() {
      this.dismissCountDown = this.dismissSecs;
    },
    getRoles: function getRoles() {
      var self = this;
      axios__WEBPACK_IMPORTED_MODULE_0___default.a.get('/api/roles?token=' + localStorage.getItem("api_token")).then(function (response) {
        self.roles = response.data;
      })["catch"](function (error) {// self.$router.push({ path: '/login' });
      });
    }
  },
  mounted: function mounted() {
    this.getRoles();
    var self = this;
    axios__WEBPACK_IMPORTED_MODULE_0___default.a.get('/api/users/' + self.$route.params.id + '/edit?token=' + localStorage.getItem("api_token")).then(function (response) {
      self.name = response.data.name;
      self.email = response.data.email;
      var arr_role = response.data.roles.split(",");
      self.roles.map(function (item) {
        if (arr_role.indexOf(item.name) != -1) {
          item.checked = true;
        } else {
          item.checked = false;
        }

        return item;
      });
    })["catch"](function (error) {
      console.log(error); // self.$router.push({ path: '/login' });
    });
  }
});

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/coreui/src/views/users/EditUser.vue?vue&type=template&id=5dd48048&":
/*!********************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/coreui/src/views/users/EditUser.vue?vue&type=template&id=5dd48048& ***!
  \********************************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c(
    "CRow",
    [
      _c(
        "CCol",
        { attrs: { col: "12", lg: "6" } },
        [
          _c(
            "CCard",
            { attrs: { "no-header": "" } },
            [
              _c(
                "CCardBody",
                [
                  _c(
                    "CForm",
                    [
                      _c("template", { slot: "header" }, [
                        _vm._v(
                          "\n            Edit User id:  " +
                            _vm._s(_vm.$route.params.id) +
                            "\n          "
                        )
                      ]),
                      _vm._v(" "),
                      _c(
                        "CAlert",
                        {
                          attrs: {
                            show: _vm.dismissCountDown,
                            color: "primary",
                            fade: ""
                          },
                          on: {
                            "update:show": function($event) {
                              _vm.dismissCountDown = $event
                            }
                          }
                        },
                        [
                          _vm._v(
                            "\n            (" +
                              _vm._s(_vm.dismissCountDown) +
                              ") " +
                              _vm._s(_vm.message) +
                              "\n          "
                          )
                        ]
                      ),
                      _vm._v(" "),
                      _c("CInput", {
                        attrs: {
                          type: "text",
                          label: "Name",
                          placeholder: "Name"
                        },
                        model: {
                          value: _vm.name,
                          callback: function($$v) {
                            _vm.name = $$v
                          },
                          expression: "name"
                        }
                      }),
                      _vm._v(" "),
                      _c("CInput", {
                        attrs: {
                          type: "text",
                          label: "Email",
                          placeholder: "Email"
                        },
                        model: {
                          value: _vm.email,
                          callback: function($$v) {
                            _vm.email = $$v
                          },
                          expression: "email"
                        }
                      }),
                      _vm._v(" "),
                      _c("CInput", {
                        attrs: {
                          type: "text",
                          label: "Password (Reset)",
                          placeholder: "Password"
                        },
                        model: {
                          value: _vm.password,
                          callback: function($$v) {
                            _vm.password = $$v
                          },
                          expression: "password"
                        }
                      }),
                      _vm._v(" "),
                      _c("div", { staticClass: "form-row form-group" }, [
                        _c(
                          "label",
                          { staticClass: "col-form-label col-sm-3" },
                          [_vm._v(" Roles ")]
                        ),
                        _vm._v(" "),
                        _c(
                          "div",
                          { staticClass: "col-sm-9" },
                          _vm._l(_vm.roles, function(role, index) {
                            return _c("div", { key: index }, [
                              _c("input", {
                                directives: [
                                  {
                                    name: "model",
                                    rawName: "v-model",
                                    value: role.checked,
                                    expression: "role.checked"
                                  }
                                ],
                                attrs: { type: "checkbox", id: "checkbox" },
                                domProps: {
                                  checked: Array.isArray(role.checked)
                                    ? _vm._i(role.checked, null) > -1
                                    : role.checked
                                },
                                on: {
                                  change: function($event) {
                                    var $$a = role.checked,
                                      $$el = $event.target,
                                      $$c = $$el.checked ? true : false
                                    if (Array.isArray($$a)) {
                                      var $$v = null,
                                        $$i = _vm._i($$a, $$v)
                                      if ($$el.checked) {
                                        $$i < 0 &&
                                          _vm.$set(
                                            role,
                                            "checked",
                                            $$a.concat([$$v])
                                          )
                                      } else {
                                        $$i > -1 &&
                                          _vm.$set(
                                            role,
                                            "checked",
                                            $$a
                                              .slice(0, $$i)
                                              .concat($$a.slice($$i + 1))
                                          )
                                      }
                                    } else {
                                      _vm.$set(role, "checked", $$c)
                                    }
                                  }
                                }
                              }),
                              _vm._v(" "),
                              _c("label", { attrs: { for: "checkbox" } }, [
                                _vm._v(_vm._s(role.name))
                              ])
                            ])
                          }),
                          0
                        )
                      ]),
                      _vm._v(" "),
                      _c(
                        "CButton",
                        {
                          attrs: { color: "primary" },
                          on: {
                            click: function($event) {
                              return _vm.update()
                            }
                          }
                        },
                        [_vm._v("Save")]
                      ),
                      _vm._v(" "),
                      _c(
                        "CButton",
                        {
                          attrs: { color: "primary" },
                          on: { click: _vm.goBack }
                        },
                        [_vm._v("Back")]
                      )
                    ],
                    2
                  )
                ],
                1
              )
            ],
            1
          )
        ],
        1
      )
    ],
    1
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/coreui/src/views/users/EditUser.vue":
/*!*******************************************************!*\
  !*** ./resources/coreui/src/views/users/EditUser.vue ***!
  \*******************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _EditUser_vue_vue_type_template_id_5dd48048___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./EditUser.vue?vue&type=template&id=5dd48048& */ "./resources/coreui/src/views/users/EditUser.vue?vue&type=template&id=5dd48048&");
/* harmony import */ var _EditUser_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./EditUser.vue?vue&type=script&lang=js& */ "./resources/coreui/src/views/users/EditUser.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _EditUser_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _EditUser_vue_vue_type_template_id_5dd48048___WEBPACK_IMPORTED_MODULE_0__["render"],
  _EditUser_vue_vue_type_template_id_5dd48048___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/coreui/src/views/users/EditUser.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/coreui/src/views/users/EditUser.vue?vue&type=script&lang=js&":
/*!********************************************************************************!*\
  !*** ./resources/coreui/src/views/users/EditUser.vue?vue&type=script&lang=js& ***!
  \********************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_EditUser_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./EditUser.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/coreui/src/views/users/EditUser.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_EditUser_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/coreui/src/views/users/EditUser.vue?vue&type=template&id=5dd48048&":
/*!**************************************************************************************!*\
  !*** ./resources/coreui/src/views/users/EditUser.vue?vue&type=template&id=5dd48048& ***!
  \**************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_EditUser_vue_vue_type_template_id_5dd48048___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./EditUser.vue?vue&type=template&id=5dd48048& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/coreui/src/views/users/EditUser.vue?vue&type=template&id=5dd48048&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_EditUser_vue_vue_type_template_id_5dd48048___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_EditUser_vue_vue_type_template_id_5dd48048___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);