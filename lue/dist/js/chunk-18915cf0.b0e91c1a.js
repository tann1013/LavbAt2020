(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-18915cf0"],{"677a":function(e,n,t){"use strict";t.d(n,"m",(function(){return a})),t.d(n,"b",(function(){return o})),t.d(n,"g",(function(){return c})),t.d(n,"e",(function(){return s})),t.d(n,"a",(function(){return u})),t.d(n,"f",(function(){return l})),t.d(n,"d",(function(){return d})),t.d(n,"k",(function(){return m})),t.d(n,"o",(function(){return f})),t.d(n,"n",(function(){return b})),t.d(n,"l",(function(){return p})),t.d(n,"i",(function(){return g})),t.d(n,"h",(function(){return h})),t.d(n,"j",(function(){return v})),t.d(n,"c",(function(){return _}));var r=t("b775"),i={roles:"admin/rbac/roles",create_role:"admin/rbac/create-role",edit_role:"admin/rbac/edit-role",delete_role:"admin/rbac/delete-role",create_permission:"admin/rbac/create-permission",edit_permission:"admin/rbac/edit-permission",permissions:"admin/rbac/permissions",delete_permission:"admin/rbac/delete-permission",give_role_permission:"admin/rbac/give-role-permission",give_admin_permission:"admin/rbac/give-admin-permission",get_role_permission:"admin/rbac/get-role-permission",get_admin_permission:"admin/rbac/get-admin-permission",get_admin_bill:"admin/bill/getList",admin_task_get:"admin/bill/getTaskList",admin_task_create:"admin/bill/addTask",admin_task_edit:"admin/bill/editTask"};function a(e){return Object(r["a"])(i.roles,e)}function o(e){return Object(r["b"])(i.create_role,e)}function c(e){return Object(r["b"])(i.edit_role,e)}function s(e){return Object(r["b"])(i.delete_role,e)}function u(e){return Object(r["b"])(i.create_permission,e)}function l(e){return Object(r["b"])(i.edit_permission,e)}function d(e){return Object(r["b"])(i.delete_permission,e)}function m(e){return Object(r["a"])(i.permissions,e)}function f(e){return Object(r["b"])(i.give_role_permission,e)}function b(e){return Object(r["b"])(i.give_admin_permission,e)}function p(e){return Object(r["a"])(i.get_role_permission,e)}function g(e){return Object(r["a"])(i.get_admin_permission,e)}function h(e){return Object(r["b"])(i.get_admin_bill,e)}function v(e){return Object(r["b"])(i.admin_task_get,e)}function _(e){return Object(r["b"])(i.admin_task_create,e)}},"88bc":function(e,n,t){(function(n){var t=1/0,r=9007199254740991,i="[object Arguments]",a="[object Function]",o="[object GeneratorFunction]",c="[object Symbol]",s="object"==typeof n&&n&&n.Object===Object&&n,u="object"==typeof self&&self&&self.Object===Object&&self,l=s||u||Function("return this")();function d(e,n,t){switch(t.length){case 0:return e.call(n);case 1:return e.call(n,t[0]);case 2:return e.call(n,t[0],t[1]);case 3:return e.call(n,t[0],t[1],t[2])}return e.apply(n,t)}function m(e,n){var t=-1,r=e?e.length:0,i=Array(r);while(++t<r)i[t]=n(e[t],t,e);return i}function f(e,n){var t=-1,r=n.length,i=e.length;while(++t<r)e[i+t]=n[t];return e}var b=Object.prototype,p=b.hasOwnProperty,g=b.toString,h=l.Symbol,v=b.propertyIsEnumerable,_=h?h.isConcatSpreadable:void 0,y=Math.max;function j(e,n,t,r,i){var a=-1,o=e.length;t||(t=x),i||(i=[]);while(++a<o){var c=e[a];n>0&&t(c)?n>1?j(c,n-1,t,r,i):f(i,c):r||(i[i.length]=c)}return i}function O(e,n){return e=Object(e),k(e,n,(function(n,t){return t in e}))}function k(e,n,t){var r=-1,i=n.length,a={};while(++r<i){var o=n[r],c=e[o];t(c,o)&&(a[o]=c)}return a}function w(e,n){return n=y(void 0===n?e.length-1:n,0),function(){var t=arguments,r=-1,i=y(t.length-n,0),a=Array(i);while(++r<i)a[r]=t[n+r];r=-1;var o=Array(n+1);while(++r<n)o[r]=t[r];return o[n]=a,d(e,this,o)}}function x(e){return A(e)||F(e)||!!(_&&e&&e[_])}function $(e){if("string"==typeof e||S(e))return e;var n=e+"";return"0"==n&&1/e==-t?"-0":n}function F(e){return q(e)&&p.call(e,"callee")&&(!v.call(e,"callee")||g.call(e)==i)}var A=Array.isArray;function E(e){return null!=e&&L(e.length)&&!C(e)}function q(e){return T(e)&&E(e)}function C(e){var n=N(e)?g.call(e):"";return n==a||n==o}function L(e){return"number"==typeof e&&e>-1&&e%1==0&&e<=r}function N(e){var n=typeof e;return!!e&&("object"==n||"function"==n)}function T(e){return!!e&&"object"==typeof e}function S(e){return"symbol"==typeof e||T(e)&&g.call(e)==c}var D=w((function(e,n){return null==e?{}:O(e,m(j(n,1),$))}));e.exports=D}).call(this,t("c8ba"))},f99b:function(e,n,t){"use strict";t.r(n);var r=function(){var e=this,n=e.$createElement,t=e._self._c||n;return t("a-modal",{attrs:{title:e.model?"编辑角色":"添加角色",width:550,visible:e.visible,confirmLoading:e.loading,okText:e.model?"立即编辑":"立即添加",cancelText:"取消"},on:{ok:e.ok,cancel:e.cancel}},[t("a-spin",{attrs:{spinning:e.loading}},[t("a-form",e._b({attrs:{form:e.form}},"a-form",e.formLayout,!1),[t("a-form-item",{directives:[{name:"show",rawName:"v-show",value:!1,expression:"false"}]},[t("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["id",{rules:[]}],expression:"['id', { rules: [] }]"}],attrs:{placeholder:"ID"}})],1),t("a-form-item",{attrs:{label:"权限字符"}},[t("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["name",{rules:[{required:!0,message:"权限字符不能为空！"}]}],expression:"['name', { rules: [{ required: true, message: '权限字符不能为空！' }] }]"}],attrs:{placeholder:"请填写权限字符 (建议英文字母)"}})],1),t("a-form-item",{attrs:{label:"角色名称"}},[t("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["display_name",{rules:[{required:!0,message:"角色名称不能为空！"}]}],expression:"['display_name', { rules: [{ required: true, message: '角色名称不能为空！' }] }]"}],attrs:{placeholder:"请填写角色名称"},nativeOn:{keyup:function(n){return!n.type.indexOf("key")&&e._k(n.keyCode,"enter",13,n.key,"Enter")?null:e.ok(n)}}})],1),t("a-form-item",{attrs:{label:"角色描述"}},[t("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["description"],expression:"['description']"}],attrs:{placeholder:"请填写角色描述(非必填)",type:"textarea"},nativeOn:{keyup:function(n){return!n.type.indexOf("key")&&e._k(n.keyCode,"enter",13,n.key,"Enter")?null:e.ok(n)}}})],1)],1)],1)],1)},i=[],a=(t("4160"),t("88bc")),o=t.n(a),c=t("677a"),s=["id","name","display_name","description"],u={name:"EditRole",props:{visible:{type:Boolean,required:!0},model:{type:Object,default:function(){return null}}},data:function(){return{formLayout:{labelCol:{xs:{span:24},sm:{span:7}},wrapperCol:{xs:{span:24},sm:{span:13}}},loading:!1,form:this.$form.createForm(this)}},watch:{model:function(){this.model&&this.form.setFieldsValue(o()(this.model,s))}},created:function(){var e=this;s.forEach((function(n){return e.form.getFieldDecorator(n)}))},methods:{ok:function(){var e=this;this.loading=!0;var n=this;this.form.validateFields((function(t,r){t?e.loading=!1:r.id>0?n.edit(r):n.add(r)}))},cancel:function(){this.$emit("cancel")},add:function(e){var n=this;Object(c["b"])(e).then((function(e){n.loading=!1,200==e.code?(n.$message.success("角色添加成功..."),n.$emit("success")):n.$message.info("角色添加失败...")})).catch((function(e){n.$message.error("网络异常,请稍后再试..."),n.loading=!1}))},edit:function(e){var n=this;e.role_id=e.id,Object(c["g"])(e).then((function(e){n.loading=!1,200==e.code?(n.$message.success("角色编辑成功..."),n.$emit("success")):n.$message.info("角色编辑失败...")})).catch((function(e){n.$message.error("网络异常,请稍后再试..."),n.loading=!1}))}}},l=u,d=t("2877"),m=Object(d["a"])(l,r,i,!1,null,null,null);n["default"]=m.exports}}]);