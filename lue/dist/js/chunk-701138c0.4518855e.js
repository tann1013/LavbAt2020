(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-701138c0"],{"677a":function(e,t,r){"use strict";r.d(t,"m",(function(){return i})),r.d(t,"b",(function(){return o})),r.d(t,"g",(function(){return s})),r.d(t,"e",(function(){return l})),r.d(t,"a",(function(){return u})),r.d(t,"f",(function(){return c})),r.d(t,"d",(function(){return d})),r.d(t,"k",(function(){return m})),r.d(t,"o",(function(){return f})),r.d(t,"n",(function(){return p})),r.d(t,"l",(function(){return v})),r.d(t,"i",(function(){return b})),r.d(t,"h",(function(){return g})),r.d(t,"j",(function(){return h})),r.d(t,"c",(function(){return _}));var a=r("b775"),n={roles:"admin/rbac/roles",create_role:"admin/rbac/create-role",edit_role:"admin/rbac/edit-role",delete_role:"admin/rbac/delete-role",create_permission:"admin/rbac/create-permission",edit_permission:"admin/rbac/edit-permission",permissions:"admin/rbac/permissions",delete_permission:"admin/rbac/delete-permission",give_role_permission:"admin/rbac/give-role-permission",give_admin_permission:"admin/rbac/give-admin-permission",get_role_permission:"admin/rbac/get-role-permission",get_admin_permission:"admin/rbac/get-admin-permission",get_admin_bill:"admin/bill/getList",admin_task_get:"admin/bill/getTaskList",admin_task_create:"admin/bill/addTask",admin_task_edit:"admin/bill/editTask"};function i(e){return Object(a["a"])(n.roles,e)}function o(e){return Object(a["b"])(n.create_role,e)}function s(e){return Object(a["b"])(n.edit_role,e)}function l(e){return Object(a["b"])(n.delete_role,e)}function u(e){return Object(a["b"])(n.create_permission,e)}function c(e){return Object(a["b"])(n.edit_permission,e)}function d(e){return Object(a["b"])(n.delete_permission,e)}function m(e){return Object(a["a"])(n.permissions,e)}function f(e){return Object(a["b"])(n.give_role_permission,e)}function p(e){return Object(a["b"])(n.give_admin_permission,e)}function v(e){return Object(a["a"])(n.get_role_permission,e)}function b(e){return Object(a["a"])(n.get_admin_permission,e)}function g(e){return Object(a["b"])(n.get_admin_bill,e)}function h(e){return Object(a["b"])(n.admin_task_get,e)}function _(e){return Object(a["b"])(n.admin_task_create,e)}},"88bc":function(e,t,r){(function(t){var r=1/0,a=9007199254740991,n="[object Arguments]",i="[object Function]",o="[object GeneratorFunction]",s="[object Symbol]",l="object"==typeof t&&t&&t.Object===Object&&t,u="object"==typeof self&&self&&self.Object===Object&&self,c=l||u||Function("return this")();function d(e,t,r){switch(r.length){case 0:return e.call(t);case 1:return e.call(t,r[0]);case 2:return e.call(t,r[0],r[1]);case 3:return e.call(t,r[0],r[1],r[2])}return e.apply(t,r)}function m(e,t){var r=-1,a=e?e.length:0,n=Array(a);while(++r<a)n[r]=t(e[r],r,e);return n}function f(e,t){var r=-1,a=t.length,n=e.length;while(++r<a)e[n+r]=t[r];return e}var p=Object.prototype,v=p.hasOwnProperty,b=p.toString,g=c.Symbol,h=p.propertyIsEnumerable,_=g?g.isConcatSpreadable:void 0,y=Math.max;function w(e,t,r,a,n){var i=-1,o=e.length;r||(r=F),n||(n=[]);while(++i<o){var s=e[i];t>0&&r(s)?t>1?w(s,t-1,r,a,n):f(n,s):a||(n[n.length]=s)}return n}function j(e,t){return e=Object(e),V(e,t,(function(t,r){return r in e}))}function V(e,t,r){var a=-1,n=t.length,i={};while(++a<n){var o=t[a],s=e[o];r(s,o)&&(i[o]=s)}return i}function x(e,t){return t=y(void 0===t?e.length-1:t,0),function(){var r=arguments,a=-1,n=y(r.length-t,0),i=Array(n);while(++a<n)i[a]=r[t+a];a=-1;var o=Array(t+1);while(++a<t)o[a]=r[a];return o[t]=i,d(e,this,o)}}function F(e){return k(e)||N(e)||!!(_&&e&&e[_])}function O(e){if("string"==typeof e||S(e))return e;var t=e+"";return"0"==t&&1/e==-r?"-0":t}function N(e){return $(e)&&v.call(e,"callee")&&(!h.call(e,"callee")||b.call(e)==n)}var k=Array.isArray;function q(e){return null!=e&&T(e.length)&&!A(e)}function $(e){return L(e)&&q(e)}function A(e){var t=C(e)?b.call(e):"";return t==i||t==o}function T(e){return"number"==typeof e&&e>-1&&e%1==0&&e<=a}function C(e){var t=typeof e;return!!e&&("object"==t||"function"==t)}function L(e){return!!e&&"object"==typeof e}function S(e){return"symbol"==typeof e||L(e)&&b.call(e)==s}var B=x((function(e,t){return null==e?{}:j(e,m(w(t,1),O))}));e.exports=B}).call(this,r("c8ba"))},d5be:function(e,t,r){"use strict";r.r(t);var a=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("a-modal",{attrs:{title:e.model?"编辑权限":"添加权限",width:550,visible:e.visible,confirmLoading:e.loading,okText:e.model?"立即编辑":"立即添加",cancelText:"取消"},on:{ok:e.submit,cancel:e.cancel}},[r("a-spin",{attrs:{spinning:e.loading}},[r("a-form",e._b({attrs:{form:e.form},on:{submit:e.submit}},"a-form",e.formLayout,!1),[r("a-form-item",{directives:[{name:"show",rawName:"v-show",value:!1,expression:"false"}]},[r("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["id",{initialValue:"0"}],expression:"['id', { initialValue: '0' }]"}]})],1),r("a-form-item",{attrs:{label:"父级菜单"}},[r("a-tree-select",{directives:[{name:"decorator",rawName:"v-decorator",value:["parent_id"],expression:"['parent_id']"}],attrs:{"dropdown-style":{maxHeight:"500px",overflow:"auto"},placeholder:"默认为顶级栏目","allow-clear":"","tree-default-expand-all":"","tree-data":e.tree,replaceFields:{children:"children",title:"title",key:"key",value:"id"}}})],1),r("a-form-item",{attrs:{label:"菜单类型"}},[r("a-radio-group",{directives:[{name:"decorator",rawName:"v-decorator",value:["type",{initialValue:"0",rules:[{required:!0,message:"权限类型必选！"}]}],expression:"['type', { initialValue: '0', rules: [{ required: true, message: '权限类型必选！' }] }]"}]},[r("a-radio-button",{attrs:{value:"0"}},[e._v("目录")]),r("a-radio-button",{attrs:{value:"1"}},[e._v("菜单")]),r("a-radio-button",{attrs:{value:"2"}},[e._v("权限")])],1)],1),r("a-form-item",{directives:[{name:"show",rawName:"v-show",value:1==e.form.getFieldValue("type"),expression:"form.getFieldValue('type') == 1"}],attrs:{label:"是否外链"}},[r("a-radio-group",{directives:[{name:"decorator",rawName:"v-decorator",value:["is_frame",{initialValue:"0",rules:[{required:!0,message:"是否外链必选！"}]}],expression:"['is_frame', { initialValue: '0', rules: [{ required: true, message: '是否外链必选！' }] }]"}]},[r("a-radio-button",{attrs:{value:"0"}},[e._v("否")]),r("a-radio-button",{attrs:{value:"1"}},[e._v("是")])],1)],1),r("a-form-item",{attrs:{label:"是否隐藏"}},[r("a-radio-group",{directives:[{name:"decorator",rawName:"v-decorator",value:["hidden",{initialValue:"0",rules:[{required:!0,message:"是否隐藏必选！"}]}],expression:"['hidden', { initialValue: '0', rules: [{ required: true, message: '是否隐藏必选！' }] }]"}]},[r("a-radio-button",{attrs:{value:"0"}},[e._v("否")]),r("a-radio-button",{attrs:{value:"1"}},[e._v("是")])],1)],1),r("a-form-item",{attrs:{label:"菜单标题"}},[r("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["title",{rules:[{required:!0,message:"菜单标题不能为空！"}]}],expression:"['title', { rules: [{ required: true, message: '菜单标题不能为空！' }] }]"}],attrs:{placeholder:"请填写菜单标题"}})],1),r("a-form-item",{directives:[{name:"show",rawName:"v-show",value:2==e.form.getFieldValue("type"),expression:"form.getFieldValue('type') == 2"}],attrs:{label:"权限标识"}},[r("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["perms",{rules:[{required:2==e.form.getFieldValue("type"),message:"请填写权限标识"}]}],expression:"[\n            'perms',\n            { rules: [{ required: form.getFieldValue('type') == 2, message: '请填写权限标识' }] }\n          ]"}],attrs:{placeholder:"请填写权限标识"}})],1),r("a-form-item",{directives:[{name:"show",rawName:"v-show",value:2!=e.form.getFieldValue("type"),expression:"form.getFieldValue('type') != 2"}],attrs:{label:"路由地址"}},[r("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["path",{rules:[{required:2!=e.form.getFieldValue("type"),message:"请填写路由地址"}]}],expression:"[\n            'path',\n            { rules: [{ required: form.getFieldValue('type') != 2, message: '请填写路由地址' }] }\n          ]"}],attrs:{placeholder:"请填写路由地址"}})],1),r("a-form-item",{directives:[{name:"show",rawName:"v-show",value:1==e.form.getFieldValue("type")&&0==e.form.getFieldValue("is_frame"),expression:"form.getFieldValue('type') == 1 && form.getFieldValue('is_frame') == 0"}],attrs:{label:"组件地址"}},[r("a-select",{directives:[{name:"decorator",rawName:"v-decorator",value:["component",{rules:[{required:1==e.form.getFieldValue("type")&&0==e.form.getFieldValue("is_frame"),message:"请选择组件地址"}]}],expression:"[\n            'component',\n            {\n              rules: [\n                {\n                  required: form.getFieldValue('type') == 1 && form.getFieldValue('is_frame') == 0,\n                  message: '请选择组件地址'\n                }\n              ]\n            }\n          ]"}],attrs:{allowClear:"",placeholder:"请选择组件地址"}},e._l(e.routers,(function(t,a){return r("a-select-option",{key:a},[e._v(" "+e._s(a)+" ")])})),1)],1),r("a-form-item",{attrs:{label:"菜单排序"}},[r("a-input-number",{directives:[{name:"decorator",rawName:"v-decorator",value:["sort"],expression:"['sort']"}],staticStyle:{width:"100%"},attrs:{placeholder:"非必填项",min:0,max:9999}})],1),r("a-form-item",{directives:[{name:"show",rawName:"v-show",value:2!=e.form.getFieldValue("type"),expression:"form.getFieldValue('type') != 2"}],attrs:{label:"菜单图标"}},[r("a-input-search",{directives:[{name:"decorator",rawName:"v-decorator",value:["icon"],expression:"['icon']"}],attrs:{placeholder:"非必填项"}},[r("a-button",{attrs:{slot:"enterButton",type:"primary"},slot:"enterButton"},[r("a-icon",{attrs:{type:"search"}})],1)],1)],1),r("a-button",{directives:[{name:"show",rawName:"v-show",value:!1,expression:"false"}],attrs:{htmlType:"submit"}},[e._v("确定")])],1)],1)],1)},n=[],i=(r("4160"),r("d3b7"),r("8bbf"),r("88bc")),o=r.n(i),s=r("677a"),l=r("aa0f"),u=["id","parent_id","type","title","path","component","perms","icon","sort","hidden","is_frame"],c={name:"RuleForm",props:{visible:{type:Boolean,required:!0},model:{type:Object,default:null},tree:{type:Array,default:[]}},data:function(){return{formLayout:{labelCol:{xs:{span:24},sm:{span:7}},wrapperCol:{xs:{span:24},sm:{span:13}}},loading:!1,form:this.$form.createForm(this,{name:"rule_from",onValuesChange:function(e,t){}}),routers:l["a"]}},watch:{model:function(){this.model&&this.form.setFieldsValue(o()(this.model,u))}},created:function(){var e=this;u.forEach((function(t){return e.form.getFieldDecorator(t)}))},methods:{submit:function(e){var t=this;e.preventDefault(),this.form.validateFields((function(e,r){e?t.loading=!1:(r.parent_id=void 0==r.parent_id?0:r.parent_id,r.icon=void 0==r.icon?"":r.icon,r.sort=void 0==r.sort?"0":r.sort,r.component=void 0==r.component?"":r.component,r.perms=void 0==r.perms?"":r.perms,r.path=void 0==r.path?"":r.path,t.loading=!0,r.id>0?t.edit(r):t.add(r))}))},cancel:function(){this.$emit("cancel")},add:function(e){var t=this;Object(s["a"])(e).then((function(e){200==e.code?(t.$message.success("菜单添加成功..."),t.$emit("success")):t.$message.info("菜单添加失败...")})).catch((function(e){t.$message.error("网络异常,请稍后再试...")})).finally((function(){t.loading=!1}))},edit:function(e){var t=this;Object(s["f"])(e).then((function(e){200==e.code?(t.$message.success("菜单编辑成功..."),t.$emit("success")):t.$message.info("菜单编辑失败...")})).catch((function(e){t.$message.error("网络异常,请稍后再试...")})).finally((function(){t.loading=!1}))}}},d=c,m=r("2877"),f=Object(m["a"])(d,a,n,!1,null,null,null);t["default"]=f.exports}}]);