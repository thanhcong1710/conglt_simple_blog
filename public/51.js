(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[51],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/coreui/src/views/menu/MenuIndex.vue?vue&type=script&lang=js&":
/*!****************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/coreui/src/views/menu/MenuIndex.vue?vue&type=script&lang=js& ***!
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
//
//
//
//
//
//
//
//

/* harmony default export */ __webpack_exports__["default"] = ({
  name: 'MenuIndex',
  data: function data() {
    return {
      fields: ['name', 'menu_elements', 'edit', 'delete'],
      items: []
    };
  },
  methods: {
    menuElements: function menuElements(id) {
      this.$router.push({
        path: "menuelement/".concat(id.toString(), "/menuelement")
      });
    },
    addMenu: function addMenu() {
      this.$router.push({
        path: 'create'
      });
    },
    editMenu: function editMenu(id) {
      this.$router.push({
        path: "menu/".concat(id.toString(), "/edit")
      });
    },
    deleteMenu: function deleteMenu(id) {
      this.$router.push({
        path: "menu/".concat(id.toString(), "/delete")
      });
    },
    getMenus: function getMenus() {
      var self = this;
      axios__WEBPACK_IMPORTED_MODULE_0___default.a.get('/api/menu/menu?token=' + localStorage.getItem("api_token")).then(function (response) {
        self.items = response.data.menulist;
      })["catch"](function (error) {
        console.log(error);
        self.$router.push({
          path: '/login'
        });
      });
    }
  },
  mounted: function mounted() {
    this.getMenus();
  }
});

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/coreui/src/views/menu/MenuIndex.vue?vue&type=template&id=db68ddfa&":
/*!********************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/coreui/src/views/menu/MenuIndex.vue?vue&type=template&id=db68ddfa& ***!
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
        { attrs: { col: "12", xl: "12" } },
        [
          _c(
            "transition",
            { attrs: { name: "slide" } },
            [
              _c(
                "CCard",
                [
                  _c(
                    "CCardBody",
                    [
                      _c("h4", [
                        _vm._v(
                          "\n            Menus " +
                            _vm._s(_vm.$t("passwords.reset")) +
                            "\n          "
                        )
                      ]),
                      _vm._v(" "),
                      _c(
                        "CButton",
                        {
                          staticClass: "mb-3",
                          attrs: { color: "primary" },
                          on: {
                            click: function($event) {
                              return _vm.addMenu()
                            }
                          }
                        },
                        [_vm._v("Add Menu")]
                      ),
                      _vm._v(" "),
                      _c("CDataTable", {
                        attrs: {
                          hover: "",
                          items: _vm.items,
                          fields: _vm.fields,
                          "items-per-page": 10,
                          pagination: ""
                        },
                        scopedSlots: _vm._u([
                          {
                            key: "name",
                            fn: function(ref) {
                              var item = ref.item
                              return [
                                _c("td", [
                                  _c("strong", [_vm._v(_vm._s(item.name))])
                                ])
                              ]
                            }
                          },
                          {
                            key: "menu_elements",
                            fn: function(ref) {
                              var item = ref.item
                              return [
                                _c(
                                  "td",
                                  [
                                    _c(
                                      "CButton",
                                      {
                                        attrs: { color: "primary" },
                                        on: {
                                          click: function($event) {
                                            return _vm.menuElements(item.id)
                                          }
                                        }
                                      },
                                      [_vm._v("Menu Elements")]
                                    )
                                  ],
                                  1
                                )
                              ]
                            }
                          },
                          {
                            key: "edit",
                            fn: function(ref) {
                              var item = ref.item
                              return [
                                _c(
                                  "td",
                                  [
                                    _c(
                                      "CButton",
                                      {
                                        attrs: { color: "primary" },
                                        on: {
                                          click: function($event) {
                                            return _vm.editMenu(item.id)
                                          }
                                        }
                                      },
                                      [_vm._v("Edit")]
                                    )
                                  ],
                                  1
                                )
                              ]
                            }
                          },
                          {
                            key: "delete",
                            fn: function(ref) {
                              var item = ref.item
                              return [
                                _c(
                                  "td",
                                  [
                                    _c(
                                      "CButton",
                                      {
                                        attrs: { color: "danger" },
                                        on: {
                                          click: function($event) {
                                            return _vm.deleteMenu(item.id)
                                          }
                                        }
                                      },
                                      [_vm._v("Delete")]
                                    )
                                  ],
                                  1
                                )
                              ]
                            }
                          }
                        ])
                      })
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
    ],
    1
  )
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/coreui/src/views/menu/MenuIndex.vue":
/*!*******************************************************!*\
  !*** ./resources/coreui/src/views/menu/MenuIndex.vue ***!
  \*******************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _MenuIndex_vue_vue_type_template_id_db68ddfa___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./MenuIndex.vue?vue&type=template&id=db68ddfa& */ "./resources/coreui/src/views/menu/MenuIndex.vue?vue&type=template&id=db68ddfa&");
/* harmony import */ var _MenuIndex_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./MenuIndex.vue?vue&type=script&lang=js& */ "./resources/coreui/src/views/menu/MenuIndex.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _MenuIndex_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _MenuIndex_vue_vue_type_template_id_db68ddfa___WEBPACK_IMPORTED_MODULE_0__["render"],
  _MenuIndex_vue_vue_type_template_id_db68ddfa___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/coreui/src/views/menu/MenuIndex.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/coreui/src/views/menu/MenuIndex.vue?vue&type=script&lang=js&":
/*!********************************************************************************!*\
  !*** ./resources/coreui/src/views/menu/MenuIndex.vue?vue&type=script&lang=js& ***!
  \********************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_MenuIndex_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./MenuIndex.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/coreui/src/views/menu/MenuIndex.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_MenuIndex_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/coreui/src/views/menu/MenuIndex.vue?vue&type=template&id=db68ddfa&":
/*!**************************************************************************************!*\
  !*** ./resources/coreui/src/views/menu/MenuIndex.vue?vue&type=template&id=db68ddfa& ***!
  \**************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_MenuIndex_vue_vue_type_template_id_db68ddfa___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./MenuIndex.vue?vue&type=template&id=db68ddfa& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/coreui/src/views/menu/MenuIndex.vue?vue&type=template&id=db68ddfa&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_MenuIndex_vue_vue_type_template_id_db68ddfa___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_MenuIndex_vue_vue_type_template_id_db68ddfa___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);