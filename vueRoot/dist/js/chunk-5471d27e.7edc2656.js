(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-5471d27e"],{"1e55":function(e,t,n){},"2b00":function(e,t,n){"use strict";n.r(t);var r=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("a-modal",{attrs:{title:"分配角色权限",visible:e.visible,confirmLoading:e.loading,okText:"立即分配",cancelText:"取消"},on:{ok:e.submit,cancel:e.cancel}},[n("a-spin",{attrs:{spinning:e.loading,tip:"权限信息加载中..."}},[n("a-form",e._b({attrs:{form:e.form}},"a-form",e.formLayout,!1),[n("a-form-item",{directives:[{name:"show",rawName:"v-show",value:!1,expression:"false"}]},[n("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["id"],expression:"['id']"}]})],1),n("a-form-item",{attrs:{label:"角色名称"}},[n("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["display_name"],expression:"['display_name']"}],staticStyle:{background:"none"},attrs:{disabled:""}})],1),n("a-form-item",{attrs:{label:"角色权限"}},[e.treeData?n("div",{staticClass:"tree-box"},[n("a-tree",{attrs:{checkable:"","tree-data":e.treeData,blockNode:!0,checkStrictly:!1,replaceFields:{children:"children",title:"title",key:"id",value:"id"}},on:{check:e.onCheck},model:{value:e.checkedKeys,callback:function(t){e.checkedKeys=t},expression:"checkedKeys"}})],1):e._e()])],1)],1)],1)},i=[],o=(n("99af"),n("4160"),n("c975"),n("a15b"),n("d3b7"),n("159b"),n("2909")),c=n("88bc"),a=n.n(c),s=n("677a"),u=n("ca002"),l=["id","display_name"],d={name:"GiveRolePrems",props:{visible:{type:Boolean,required:!0},model:{type:Object,default:function(){return null}}},data:function(){return{formLayout:{labelCol:{xs:{span:24},sm:{span:7}},wrapperCol:{xs:{span:24},sm:{span:13}}},loading:!1,form:this.$form.createForm(this),checkedKeys:[],halfCheckedKeys:[],treeData:[]}},watch:{model:function(){this.model&&this.form.setFieldsValue(a()(this.model,l)),this.resetTree(),this.loadTree()}},created:function(){var e=this;l.forEach((function(t){return e.form.getFieldDecorator(t)}))},methods:{submit:function(){var e=this;this.form.validateFields((function(t,n){t||e.toSubmit(n.id)}))},cancel:function(){this.loading=!1,this.resetTree(),this.$emit("close")},toSubmit:function(e){var t=this,n=[].concat(Object(o["a"])(this.checkedKeys),[this.halfCheckedKeys]).join(",");this.loading=!0,Object(s["m"])({role_id:e,permissions:n}).then((function(e){200==e.code?(t.$message.success("角色分配权限成功..."),t.$emit("close")):t.$message.error("角色分配权限失败...")})).catch((function(e){t.$message.error("网络异常,请稍后再试...")})).finally((function(){t.loading=!1}))},resetTree:function(){this.checkedKeys=[],this.treeData=[]},onCheck:function(e,t){this.halfCheckedKeys=t.halfCheckedKeys},loadTree:function(){var e=this;Object(s["j"])({role_id:this.model.id}).then((function(t){if(200==t.code){var n=t.data,r=n.permissions,i=n.role_perms,o=Object(u["d"])(Object(u["b"])(r));e.treeData=r,i.forEach((function(t){o.indexOf(t)>=0?e.halfCheckedKeys.push(t):e.checkedKeys.push(t)}))}}))}}},f=d,m=(n("93d8"),n("2877")),b=Object(m["a"])(f,r,i,!1,null,"6a64efca",null);t["default"]=b.exports},"677a":function(e,t,n){"use strict";n.d(t,"k",(function(){return o})),n.d(t,"b",(function(){return c})),n.d(t,"f",(function(){return a})),n.d(t,"d",(function(){return s})),n.d(t,"a",(function(){return u})),n.d(t,"e",(function(){return l})),n.d(t,"c",(function(){return d})),n.d(t,"i",(function(){return f})),n.d(t,"m",(function(){return m})),n.d(t,"l",(function(){return b})),n.d(t,"j",(function(){return h})),n.d(t,"h",(function(){return p})),n.d(t,"g",(function(){return v}));var r=n("b775"),i={roles:"admin/rbac/roles",create_role:"admin/rbac/create-role",edit_role:"admin/rbac/edit-role",delete_role:"admin/rbac/delete-role",create_permission:"admin/rbac/create-permission",edit_permission:"admin/rbac/edit-permission",permissions:"admin/rbac/permissions",delete_permission:"admin/rbac/delete-permission",give_role_permission:"admin/rbac/give-role-permission",give_admin_permission:"admin/rbac/give-admin-permission",get_role_permission:"admin/rbac/get-role-permission",get_admin_permission:"admin/rbac/get-admin-permission",get_admin_bill:"admin/bill/getList"};function o(e){return Object(r["a"])(i.roles,e)}function c(e){return Object(r["b"])(i.create_role,e)}function a(e){return Object(r["b"])(i.edit_role,e)}function s(e){return Object(r["b"])(i.delete_role,e)}function u(e){return Object(r["b"])(i.create_permission,e)}function l(e){return Object(r["b"])(i.edit_permission,e)}function d(e){return Object(r["b"])(i.delete_permission,e)}function f(e){return Object(r["a"])(i.permissions,e)}function m(e){return Object(r["b"])(i.give_role_permission,e)}function b(e){return Object(r["b"])(i.give_admin_permission,e)}function h(e){return Object(r["a"])(i.get_role_permission,e)}function p(e){return Object(r["a"])(i.get_admin_permission,e)}function v(e){return Object(r["b"])(i.get_admin_bill,e)}},"88bc":function(e,t,n){(function(t){var n=1/0,r=9007199254740991,i="[object Arguments]",o="[object Function]",c="[object GeneratorFunction]",a="[object Symbol]",s="object"==typeof t&&t&&t.Object===Object&&t,u="object"==typeof self&&self&&self.Object===Object&&self,l=s||u||Function("return this")();function d(e,t,n){switch(n.length){case 0:return e.call(t);case 1:return e.call(t,n[0]);case 2:return e.call(t,n[0],n[1]);case 3:return e.call(t,n[0],n[1],n[2])}return e.apply(t,n)}function f(e,t){var n=-1,r=e?e.length:0,i=Array(r);while(++n<r)i[n]=t(e[n],n,e);return i}function m(e,t){var n=-1,r=t.length,i=e.length;while(++n<r)e[i+n]=t[n];return e}var b=Object.prototype,h=b.hasOwnProperty,p=b.toString,v=l.Symbol,y=b.propertyIsEnumerable,g=v?v.isConcatSpreadable:void 0,_=Math.max;function j(e,t,n,r,i){var o=-1,c=e.length;n||(n=x),i||(i=[]);while(++o<c){var a=e[o];t>0&&n(a)?t>1?j(a,t-1,n,r,i):m(i,a):r||(i[i.length]=a)}return i}function O(e,t){return e=Object(e),k(e,t,(function(t,n){return n in e}))}function k(e,t,n){var r=-1,i=t.length,o={};while(++r<i){var c=t[r],a=e[c];n(a,c)&&(o[c]=a)}return o}function w(e,t){return t=_(void 0===t?e.length-1:t,0),function(){var n=arguments,r=-1,i=_(n.length-t,0),o=Array(i);while(++r<i)o[r]=n[t+r];r=-1;var c=Array(t+1);while(++r<t)c[r]=n[r];return c[t]=o,d(e,this,c)}}function x(e){return S(e)||C(e)||!!(g&&e&&e[g])}function K(e){if("string"==typeof e||E(e))return e;var t=e+"";return"0"==t&&1/e==-n?"-0":t}function C(e){return F(e)&&h.call(e,"callee")&&(!y.call(e,"callee")||p.call(e)==i)}var S=Array.isArray;function A(e){return null!=e&&T(e.length)&&!D(e)}function F(e){return N(e)&&A(e)}function D(e){var t=$(e)?p.call(e):"";return t==o||t==c}function T(e){return"number"==typeof e&&e>-1&&e%1==0&&e<=r}function $(e){var t=typeof e;return!!e&&("object"==t||"function"==t)}function N(e){return!!e&&"object"==typeof e}function E(e){return"symbol"==typeof e||N(e)&&p.call(e)==a}var J=w((function(e,t){return null==e?{}:O(e,f(j(t,1),K))}));e.exports=J}).call(this,n("c8ba"))},"93d8":function(e,t,n){"use strict";n("1e55")},ca002:function(e,t,n){"use strict";n.d(t,"c",(function(){return i})),n.d(t,"a",(function(){return o})),n.d(t,"b",(function(){return c})),n.d(t,"d",(function(){return a}));n("4de4"),n("4160"),n("a630"),n("c975"),n("d3b7"),n("6062"),n("3ca3"),n("159b"),n("ddb0");var r=n("2909");function i(){var e=new Date,t=e.getHours();return t<9?"早上好":t<=11?"上午好":t<=13?"中午好":t<20?"下午好":"晚上好"}function o(e){var t=JSON.parse(JSON.stringify(e)),n=t.filter((function(e){var n=t.filter((function(t){return e.id==t.pid}));return n.length>0&&(e.children=n),0==e.pid}));return n}var c=function e(t){var n=[];return t.forEach((function(t){t.parent_id>0&&n.push(t.parent_id),t.children&&n.push.apply(n,Object(r["a"])(e(t.children)))})),n},a=function(e){if(Array.hasOwnProperty("from"))return Array.from(new Set(e));for(var t={},n=[],r=0;r<e.length;r++)t[e[r]]||(t[e[r]]=!0,n.push(e[r]));return n}}}]);