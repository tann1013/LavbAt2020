(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-701138c0"],{"677a":function(e,r,t){"use strict";t.d(r,"k",(function(){return i})),t.d(r,"b",(function(){return o})),t.d(r,"f",(function(){return s})),t.d(r,"d",(function(){return l})),t.d(r,"a",(function(){return u})),t.d(r,"e",(function(){return c})),t.d(r,"c",(function(){return d})),t.d(r,"i",(function(){return m})),t.d(r,"m",(function(){return f})),t.d(r,"l",(function(){return p})),t.d(r,"j",(function(){return v})),t.d(r,"h",(function(){return b})),t.d(r,"g",(function(){return g}));var a=t("b775"),n={roles:"admin/rbac/roles",create_role:"admin/rbac/create-role",edit_role:"admin/rbac/edit-role",delete_role:"admin/rbac/delete-role",create_permission:"admin/rbac/create-permission",edit_permission:"admin/rbac/edit-permission",permissions:"admin/rbac/permissions",delete_permission:"admin/rbac/delete-permission",give_role_permission:"admin/rbac/give-role-permission",give_admin_permission:"admin/rbac/give-admin-permission",get_role_permission:"admin/rbac/get-role-permission",get_admin_permission:"admin/rbac/get-admin-permission",get_admin_bill:"admin/bill/getList"};function i(e){return Object(a["a"])(n.roles,e)}function o(e){return Object(a["b"])(n.create_role,e)}function s(e){return Object(a["b"])(n.edit_role,e)}function l(e){return Object(a["b"])(n.delete_role,e)}function u(e){return Object(a["b"])(n.create_permission,e)}function c(e){return Object(a["b"])(n.edit_permission,e)}function d(e){return Object(a["b"])(n.delete_permission,e)}function m(e){return Object(a["a"])(n.permissions,e)}function f(e){return Object(a["b"])(n.give_role_permission,e)}function p(e){return Object(a["b"])(n.give_admin_permission,e)}function v(e){return Object(a["a"])(n.get_role_permission,e)}function b(e){return Object(a["a"])(n.get_admin_permission,e)}function g(e){return Object(a["b"])(n.get_admin_bill,e)}},"88bc":function(e,r,t){(function(r){var t=1/0,a=9007199254740991,n="[object Arguments]",i="[object Function]",o="[object GeneratorFunction]",s="[object Symbol]",l="object"==typeof r&&r&&r.Object===Object&&r,u="object"==typeof self&&self&&self.Object===Object&&self,c=l||u||Function("return this")();function d(e,r,t){switch(t.length){case 0:return e.call(r);case 1:return e.call(r,t[0]);case 2:return e.call(r,t[0],t[1]);case 3:return e.call(r,t[0],t[1],t[2])}return e.apply(r,t)}function m(e,r){var t=-1,a=e?e.length:0,n=Array(a);while(++t<a)n[t]=r(e[t],t,e);return n}function f(e,r){var t=-1,a=r.length,n=e.length;while(++t<a)e[n+t]=r[t];return e}var p=Object.prototype,v=p.hasOwnProperty,b=p.toString,g=c.Symbol,h=p.propertyIsEnumerable,_=g?g.isConcatSpreadable:void 0,y=Math.max;function w(e,r,t,a,n){var i=-1,o=e.length;t||(t=F),n||(n=[]);while(++i<o){var s=e[i];r>0&&t(s)?r>1?w(s,r-1,t,a,n):f(n,s):a||(n[n.length]=s)}return n}function j(e,r){return e=Object(e),V(e,r,(function(r,t){return t in e}))}function V(e,r,t){var a=-1,n=r.length,i={};while(++a<n){var o=r[a],s=e[o];t(s,o)&&(i[o]=s)}return i}function x(e,r){return r=y(void 0===r?e.length-1:r,0),function(){var t=arguments,a=-1,n=y(t.length-r,0),i=Array(n);while(++a<n)i[a]=t[r+a];a=-1;var o=Array(r+1);while(++a<r)o[a]=t[a];return o[r]=i,d(e,this,o)}}function F(e){return q(e)||N(e)||!!(_&&e&&e[_])}function O(e){if("string"==typeof e||B(e))return e;var r=e+"";return"0"==r&&1/e==-t?"-0":r}function N(e){return k(e)&&v.call(e,"callee")&&(!h.call(e,"callee")||b.call(e)==n)}var q=Array.isArray;function $(e){return null!=e&&C(e.length)&&!A(e)}function k(e){return L(e)&&$(e)}function A(e){var r=S(e)?b.call(e):"";return r==i||r==o}function C(e){return"number"==typeof e&&e>-1&&e%1==0&&e<=a}function S(e){var r=typeof e;return!!e&&("object"==r||"function"==r)}function L(e){return!!e&&"object"==typeof e}function B(e){return"symbol"==typeof e||L(e)&&b.call(e)==s}var E=x((function(e,r){return null==e?{}:j(e,m(w(r,1),O))}));e.exports=E}).call(this,t("c8ba"))},d5be:function(e,r,t){"use strict";t.r(r);var a=function(){var e=this,r=e.$createElement,t=e._self._c||r;return t("a-modal",{attrs:{title:e.model?"编辑权限":"添加权限",width:550,visible:e.visible,confirmLoading:e.loading,okText:e.model?"立即编辑":"立即添加",cancelText:"取消"},on:{ok:e.submit,cancel:e.cancel}},[t("a-spin",{attrs:{spinning:e.loading}},[t("a-form",e._b({attrs:{form:e.form},on:{submit:e.submit}},"a-form",e.formLayout,!1),[t("a-form-item",{directives:[{name:"show",rawName:"v-show",value:!1,expression:"false"}]},[t("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["id",{initialValue:"0"}],expression:"['id', { initialValue: '0' }]"}]})],1),t("a-form-item",{attrs:{label:"父级菜单"}},[t("a-tree-select",{directives:[{name:"decorator",rawName:"v-decorator",value:["parent_id"],expression:"['parent_id']"}],attrs:{"dropdown-style":{maxHeight:"500px",overflow:"auto"},placeholder:"默认为顶级栏目","allow-clear":"","tree-default-expand-all":"","tree-data":e.tree,replaceFields:{children:"children",title:"title",key:"key",value:"id"}}})],1),t("a-form-item",{attrs:{label:"菜单类型"}},[t("a-radio-group",{directives:[{name:"decorator",rawName:"v-decorator",value:["type",{initialValue:"0",rules:[{required:!0,message:"权限类型必选！"}]}],expression:"['type', { initialValue: '0', rules: [{ required: true, message: '权限类型必选！' }] }]"}]},[t("a-radio-button",{attrs:{value:"0"}},[e._v("目录")]),t("a-radio-button",{attrs:{value:"1"}},[e._v("菜单")]),t("a-radio-button",{attrs:{value:"2"}},[e._v("权限")])],1)],1),t("a-form-item",{directives:[{name:"show",rawName:"v-show",value:1==e.form.getFieldValue("type"),expression:"form.getFieldValue('type') == 1"}],attrs:{label:"是否外链"}},[t("a-radio-group",{directives:[{name:"decorator",rawName:"v-decorator",value:["is_frame",{initialValue:"0",rules:[{required:!0,message:"是否外链必选！"}]}],expression:"['is_frame', { initialValue: '0', rules: [{ required: true, message: '是否外链必选！' }] }]"}]},[t("a-radio-button",{attrs:{value:"0"}},[e._v("否")]),t("a-radio-button",{attrs:{value:"1"}},[e._v("是")])],1)],1),t("a-form-item",{attrs:{label:"是否隐藏"}},[t("a-radio-group",{directives:[{name:"decorator",rawName:"v-decorator",value:["hidden",{initialValue:"0",rules:[{required:!0,message:"是否隐藏必选！"}]}],expression:"['hidden', { initialValue: '0', rules: [{ required: true, message: '是否隐藏必选！' }] }]"}]},[t("a-radio-button",{attrs:{value:"0"}},[e._v("否")]),t("a-radio-button",{attrs:{value:"1"}},[e._v("是")])],1)],1),t("a-form-item",{attrs:{label:"菜单标题"}},[t("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["title",{rules:[{required:!0,message:"菜单标题不能为空！"}]}],expression:"['title', { rules: [{ required: true, message: '菜单标题不能为空！' }] }]"}],attrs:{placeholder:"请填写菜单标题"}})],1),t("a-form-item",{directives:[{name:"show",rawName:"v-show",value:2==e.form.getFieldValue("type"),expression:"form.getFieldValue('type') == 2"}],attrs:{label:"权限标识"}},[t("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["perms",{rules:[{required:2==e.form.getFieldValue("type"),message:"请填写权限标识"}]}],expression:"[\n            'perms',\n            { rules: [{ required: form.getFieldValue('type') == 2, message: '请填写权限标识' }] }\n          ]"}],attrs:{placeholder:"请填写权限标识"}})],1),t("a-form-item",{directives:[{name:"show",rawName:"v-show",value:2!=e.form.getFieldValue("type"),expression:"form.getFieldValue('type') != 2"}],attrs:{label:"路由地址"}},[t("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["path",{rules:[{required:2!=e.form.getFieldValue("type"),message:"请填写路由地址"}]}],expression:"[\n            'path',\n            { rules: [{ required: form.getFieldValue('type') != 2, message: '请填写路由地址' }] }\n          ]"}],attrs:{placeholder:"请填写路由地址"}})],1),t("a-form-item",{directives:[{name:"show",rawName:"v-show",value:1==e.form.getFieldValue("type")&&0==e.form.getFieldValue("is_frame"),expression:"form.getFieldValue('type') == 1 && form.getFieldValue('is_frame') == 0"}],attrs:{label:"组件地址"}},[t("a-select",{directives:[{name:"decorator",rawName:"v-decorator",value:["component",{rules:[{required:1==e.form.getFieldValue("type")&&0==e.form.getFieldValue("is_frame"),message:"请选择组件地址"}]}],expression:"[\n            'component',\n            {\n              rules: [\n                {\n                  required: form.getFieldValue('type') == 1 && form.getFieldValue('is_frame') == 0,\n                  message: '请选择组件地址'\n                }\n              ]\n            }\n          ]"}],attrs:{allowClear:"",placeholder:"请选择组件地址"}},e._l(e.routers,(function(r,a){return t("a-select-option",{key:a},[e._v(" "+e._s(a)+" ")])})),1)],1),t("a-form-item",{attrs:{label:"菜单排序"}},[t("a-input-number",{directives:[{name:"decorator",rawName:"v-decorator",value:["sort"],expression:"['sort']"}],staticStyle:{width:"100%"},attrs:{placeholder:"非必填项",min:0,max:9999}})],1),t("a-form-item",{directives:[{name:"show",rawName:"v-show",value:2!=e.form.getFieldValue("type"),expression:"form.getFieldValue('type') != 2"}],attrs:{label:"菜单图标"}},[t("a-input-search",{directives:[{name:"decorator",rawName:"v-decorator",value:["icon"],expression:"['icon']"}],attrs:{placeholder:"非必填项"}},[t("a-button",{attrs:{slot:"enterButton",type:"primary"},slot:"enterButton"},[t("a-icon",{attrs:{type:"search"}})],1)],1)],1),t("a-button",{directives:[{name:"show",rawName:"v-show",value:!1,expression:"false"}],attrs:{htmlType:"submit"}},[e._v("确定")])],1)],1)],1)},n=[],i=(t("4160"),t("d3b7"),t("8bbf"),t("88bc")),o=t.n(i),s=t("677a"),l=t("aa0f"),u=["id","parent_id","type","title","path","component","perms","icon","sort","hidden","is_frame"],c={name:"RuleForm",props:{visible:{type:Boolean,required:!0},model:{type:Object,default:null},tree:{type:Array,default:[]}},data:function(){return{formLayout:{labelCol:{xs:{span:24},sm:{span:7}},wrapperCol:{xs:{span:24},sm:{span:13}}},loading:!1,form:this.$form.createForm(this,{name:"rule_from",onValuesChange:function(e,r){}}),routers:l["a"]}},watch:{model:function(){this.model&&this.form.setFieldsValue(o()(this.model,u))}},created:function(){var e=this;u.forEach((function(r){return e.form.getFieldDecorator(r)}))},methods:{submit:function(e){var r=this;e.preventDefault(),this.form.validateFields((function(e,t){e?r.loading=!1:(t.parent_id=void 0==t.parent_id?0:t.parent_id,t.icon=void 0==t.icon?"":t.icon,t.sort=void 0==t.sort?"0":t.sort,t.component=void 0==t.component?"":t.component,t.perms=void 0==t.perms?"":t.perms,t.path=void 0==t.path?"":t.path,r.loading=!0,t.id>0?r.edit(t):r.add(t))}))},cancel:function(){this.$emit("cancel")},add:function(e){var r=this;Object(s["a"])(e).then((function(e){200==e.code?(r.$message.success("菜单添加成功..."),r.$emit("success")):r.$message.info("菜单添加失败...")})).catch((function(e){r.$message.error("网络异常,请稍后再试...")})).finally((function(){r.loading=!1}))},edit:function(e){var r=this;Object(s["e"])(e).then((function(e){200==e.code?(r.$message.success("菜单编辑成功..."),r.$emit("success")):r.$message.info("菜单编辑失败...")})).catch((function(e){r.$message.error("网络异常,请稍后再试...")})).finally((function(){r.loading=!1}))}}},d=c,m=t("2877"),f=Object(m["a"])(d,a,n,!1,null,null,null);r["default"]=f.exports}}]);