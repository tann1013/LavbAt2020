(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-539e8213","chunk-5471d27e","chunk-18915cf0"],{1055:function(e,t,r){"use strict";r.r(t);var n=function(){var e=this,t=this,r=t.$createElement,n=t._self._c||r;return n("page-header-wrapper",{attrs:{title:!1}},[n("a-card",{attrs:{bordered:!1}},[n("div",{staticClass:"table-page-search-wrapper"},[n("a-form",{attrs:{layout:"inline"}},[n("a-row",{attrs:{gutter:48}},[n("a-col",{attrs:{md:6,sm:24}},[n("a-form-item",{attrs:{label:"角色名称"}},[n("a-input",{attrs:{placeholder:"模糊查询"},model:{value:t.queryParam.rolename,callback:function(e){t.$set(t.queryParam,"rolename",e)},expression:"queryParam.rolename"}})],1)],1),n("a-col",{attrs:{md:6,sm:24}},[n("a-form-item",{attrs:{label:"状态"}},[n("a-select",{attrs:{placeholder:"请选择","default-value":"0"},model:{value:t.queryParam.status,callback:function(e){t.$set(t.queryParam,"status",e)},expression:"queryParam.status"}},[n("a-select-option",{attrs:{value:"0"}},[t._v("全部")]),n("a-select-option",{attrs:{value:"1"}},[t._v("正常")]),n("a-select-option",{attrs:{value:"2"}},[t._v("已禁用")])],1)],1)],1),n("a-col",{attrs:{md:6,sm:24}},[n("span",{staticClass:"table-page-search-submitButtons"},[n("a-button",{attrs:{type:"primary"},on:{click:function(e){return t.$refs.table.refresh(!0)}}},[t._v("查询")]),n("a-button",{staticStyle:{"margin-left":"8px"},on:{click:function(){return e.queryParam={}}}},[t._v("重置")])],1)])],1)],1)],1),n("div",{staticClass:"table-operator"},[n("a-button",{attrs:{type:"primary",icon:"sync"},on:{click:t.handleRefresh}}),n("a-button",{attrs:{type:"primary",icon:"plus"},on:{click:t.handleAddRole}},[t._v("添加")])],1),n("s-table",{ref:"table",attrs:{size:"default",rowKey:"id",columns:t.columns,data:t.loadData,showPagination:!0,scroll:{x:1200}},scopedSlots:t._u([{key:"action",fn:function(e,r){return n("span",{},[n("a",{directives:[{name:"action",rawName:"v-action:system:role:edit",arg:"system:role:edit"}],on:{click:function(e){return t.handleEditRole(r)}}},[t._v("编辑")]),n("a-divider",{attrs:{type:"vertical"}}),n("a",{directives:[{name:"action",rawName:"v-action:system:role:give-perms",arg:"system:role:give-perms"}],on:{click:function(e){return t.handleRolePrems(r)}}},[t._v("分配权限")]),n("a-divider",{attrs:{type:"vertical"}}),n("a",{directives:[{name:"action",rawName:"v-action:system:role:delete",arg:"system:role:delete"}],on:{click:function(e){return t.deleteConfirm(r)}}},[t._v("删除")])],1)}}])}),n("create-form",{ref:"createModal",attrs:{visible:t.createModal.visible,model:t.createModal.model},on:{cancel:t.handleCancel,success:t.addSuccessCallback}}),n("give-role-prems",{ref:"giveRoleModal",attrs:{visible:t.giveRolePremsModal.visible,model:t.giveRolePremsModal.model},on:{close:function(){return e.giveRolePremsModal.visible=!1}}})],1)],1)},a=[],i=(r("a4d3"),r("e01a"),r("b0c0"),r("677a")),o=r("f99b"),s=r("2b00"),c={name:"SystemRolePage",components:{CreateForm:o["default"],GiveRolePrems:s["default"]},data:function(){var e=this;return{columns:[{title:"角色名称",dataIndex:"display_name"},{title:"权限字符",dataIndex:"name"},{title:"角色描述",dataIndex:"description"},{title:"创建时间",dataIndex:"created_at",align:"center"},{title:"修改时间",dataIndex:"updated_at",sorter:!0,align:"center"},{title:"操作",dataIndex:"action",width:"180px",align:"center",scopedSlots:{customRender:"action"}}],queryParam:{},loadData:function(t){var r=Object.assign({},t,e.queryParam);return Object(i["l"])(r).then((function(e){return e.data}))},createModal:{model:null,visible:!1},giveRolePremsModal:{model:null,visible:!1}}},methods:{handleRefresh:function(){this.$refs.table.refresh()},handleAddRole:function(){this.$refs.createModal.form.resetFields(),this.createModal.visible=!0,this.createModal.model=null},handleEditRole:function(e){this.createModal.visible=!0,this.createModal.model={description:e.description,display_name:e.display_name,id:e.id,name:e.name}},addSuccessCallback:function(){this.createModal.visible=!1,this.$refs.table.refresh(!0),this.$refs.createModal.form.resetFields()},handleCancel:function(){this.createModal.visible=!1,this.$refs.createModal.form.resetFields()},handleRolePrems:function(e){this.giveRolePremsModal.visible=!0,this.giveRolePremsModal.model={display_name:e.display_name,id:e.id}},deleteConfirm:function(e){this.$createElement;var t=this;this.$confirm({title:"确定删除该条角色信息吗？",content:function(e){return e("div",{style:"color:red;"},["删除后不可恢复"])},onOk:function(){return Object(i["d"])({role_id:e.id}).then((function(e){200==e.code?(t.$message.success("角色删除成功..."),t.handleRefresh()):t.$message.error("角色删除失败...")})).catch((function(e){t.$message.error("网络异常，请稍后再试...")}))}})}}},l=c,d=r("2877"),u=Object(d["a"])(l,n,a,!1,null,null,null);t["default"]=u.exports},"1e55":function(e,t,r){},"2b00":function(e,t,r){"use strict";r.r(t);var n=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("a-modal",{attrs:{title:"分配角色权限",visible:e.visible,confirmLoading:e.loading,okText:"立即分配",cancelText:"取消"},on:{ok:e.submit,cancel:e.cancel}},[r("a-spin",{attrs:{spinning:e.loading,tip:"权限信息加载中..."}},[r("a-form",e._b({attrs:{form:e.form}},"a-form",e.formLayout,!1),[r("a-form-item",{directives:[{name:"show",rawName:"v-show",value:!1,expression:"false"}]},[r("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["id"],expression:"['id']"}]})],1),r("a-form-item",{attrs:{label:"角色名称"}},[r("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["display_name"],expression:"['display_name']"}],staticStyle:{background:"none"},attrs:{disabled:""}})],1),r("a-form-item",{attrs:{label:"角色权限"}},[e.treeData?r("div",{staticClass:"tree-box"},[r("a-tree",{attrs:{checkable:"","tree-data":e.treeData,blockNode:!0,checkStrictly:!1,replaceFields:{children:"children",title:"title",key:"id",value:"id"}},on:{check:e.onCheck},model:{value:e.checkedKeys,callback:function(t){e.checkedKeys=t},expression:"checkedKeys"}})],1):e._e()])],1)],1)],1)},a=[],i=(r("99af"),r("4160"),r("c975"),r("a15b"),r("d3b7"),r("159b"),r("2909")),o=r("88bc"),s=r.n(o),c=r("677a"),l=r("ca002"),d=["id","display_name"],u={name:"GiveRolePrems",props:{visible:{type:Boolean,required:!0},model:{type:Object,default:function(){return null}}},data:function(){return{formLayout:{labelCol:{xs:{span:24},sm:{span:7}},wrapperCol:{xs:{span:24},sm:{span:13}}},loading:!1,form:this.$form.createForm(this),checkedKeys:[],halfCheckedKeys:[],treeData:[]}},watch:{model:function(){this.model&&this.form.setFieldsValue(s()(this.model,d)),this.resetTree(),this.loadTree()}},created:function(){var e=this;d.forEach((function(t){return e.form.getFieldDecorator(t)}))},methods:{submit:function(){var e=this;this.form.validateFields((function(t,r){t||e.toSubmit(r.id)}))},cancel:function(){this.loading=!1,this.resetTree(),this.$emit("close")},toSubmit:function(e){var t=this,r=[].concat(Object(i["a"])(this.checkedKeys),[this.halfCheckedKeys]).join(",");this.loading=!0,Object(c["n"])({role_id:e,permissions:r}).then((function(e){200==e.code?(t.$message.success("角色分配权限成功..."),t.$emit("close")):t.$message.error("角色分配权限失败...")})).catch((function(e){t.$message.error("网络异常,请稍后再试...")})).finally((function(){t.loading=!1}))},resetTree:function(){this.checkedKeys=[],this.treeData=[]},onCheck:function(e,t){this.halfCheckedKeys=t.halfCheckedKeys},loadTree:function(){var e=this;Object(c["k"])({role_id:this.model.id}).then((function(t){if(200==t.code){var r=t.data,n=r.permissions,a=r.role_perms,i=Object(l["d"])(Object(l["b"])(n));e.treeData=n,a.forEach((function(t){i.indexOf(t)>=0?e.halfCheckedKeys.push(t):e.checkedKeys.push(t)}))}}))}}},m=u,f=(r("93d8"),r("2877")),h=Object(f["a"])(m,n,a,!1,null,"6a64efca",null);t["default"]=h.exports},"677a":function(e,t,r){"use strict";r.d(t,"l",(function(){return i})),r.d(t,"b",(function(){return o})),r.d(t,"f",(function(){return s})),r.d(t,"d",(function(){return c})),r.d(t,"a",(function(){return l})),r.d(t,"e",(function(){return d})),r.d(t,"c",(function(){return u})),r.d(t,"j",(function(){return m})),r.d(t,"n",(function(){return f})),r.d(t,"m",(function(){return h})),r.d(t,"k",(function(){return p})),r.d(t,"h",(function(){return b})),r.d(t,"g",(function(){return v})),r.d(t,"i",(function(){return y}));var n=r("b775"),a={roles:"admin/rbac/roles",create_role:"admin/rbac/create-role",edit_role:"admin/rbac/edit-role",delete_role:"admin/rbac/delete-role",create_permission:"admin/rbac/create-permission",edit_permission:"admin/rbac/edit-permission",permissions:"admin/rbac/permissions",delete_permission:"admin/rbac/delete-permission",give_role_permission:"admin/rbac/give-role-permission",give_admin_permission:"admin/rbac/give-admin-permission",get_role_permission:"admin/rbac/get-role-permission",get_admin_permission:"admin/rbac/get-admin-permission",get_admin_bill:"admin/bill/getList",get_admin_task:"admin/bill/getTaskList"};function i(e){return Object(n["a"])(a.roles,e)}function o(e){return Object(n["b"])(a.create_role,e)}function s(e){return Object(n["b"])(a.edit_role,e)}function c(e){return Object(n["b"])(a.delete_role,e)}function l(e){return Object(n["b"])(a.create_permission,e)}function d(e){return Object(n["b"])(a.edit_permission,e)}function u(e){return Object(n["b"])(a.delete_permission,e)}function m(e){return Object(n["a"])(a.permissions,e)}function f(e){return Object(n["b"])(a.give_role_permission,e)}function h(e){return Object(n["b"])(a.give_admin_permission,e)}function p(e){return Object(n["a"])(a.get_role_permission,e)}function b(e){return Object(n["a"])(a.get_admin_permission,e)}function v(e){return Object(n["b"])(a.get_admin_bill,e)}function y(e){return Object(n["b"])(a.get_admin_task,e)}},"88bc":function(e,t,r){(function(t){var r=1/0,n=9007199254740991,a="[object Arguments]",i="[object Function]",o="[object GeneratorFunction]",s="[object Symbol]",c="object"==typeof t&&t&&t.Object===Object&&t,l="object"==typeof self&&self&&self.Object===Object&&self,d=c||l||Function("return this")();function u(e,t,r){switch(r.length){case 0:return e.call(t);case 1:return e.call(t,r[0]);case 2:return e.call(t,r[0],r[1]);case 3:return e.call(t,r[0],r[1],r[2])}return e.apply(t,r)}function m(e,t){var r=-1,n=e?e.length:0,a=Array(n);while(++r<n)a[r]=t(e[r],r,e);return a}function f(e,t){var r=-1,n=t.length,a=e.length;while(++r<n)e[a+r]=t[r];return e}var h=Object.prototype,p=h.hasOwnProperty,b=h.toString,v=d.Symbol,y=h.propertyIsEnumerable,g=v?v.isConcatSpreadable:void 0,_=Math.max;function k(e,t,r,n,a){var i=-1,o=e.length;r||(r=x),a||(a=[]);while(++i<o){var s=e[i];t>0&&r(s)?t>1?k(s,t-1,r,n,a):f(a,s):n||(a[a.length]=s)}return a}function j(e,t){return e=Object(e),O(e,t,(function(t,r){return r in e}))}function O(e,t,r){var n=-1,a=t.length,i={};while(++n<a){var o=t[n],s=e[o];r(s,o)&&(i[o]=s)}return i}function w(e,t){return t=_(void 0===t?e.length-1:t,0),function(){var r=arguments,n=-1,a=_(r.length-t,0),i=Array(a);while(++n<a)i[n]=r[t+n];n=-1;var o=Array(t+1);while(++n<t)o[n]=r[n];return o[t]=i,u(e,this,o)}}function x(e){return P(e)||C(e)||!!(g&&e&&e[g])}function $(e){if("string"==typeof e||N(e))return e;var t=e+"";return"0"==t&&1/e==-r?"-0":t}function C(e){return R(e)&&p.call(e,"callee")&&(!y.call(e,"callee")||b.call(e)==a)}var P=Array.isArray;function M(e){return null!=e&&F(e.length)&&!S(e)}function R(e){return E(e)&&M(e)}function S(e){var t=q(e)?b.call(e):"";return t==i||t==o}function F(e){return"number"==typeof e&&e>-1&&e%1==0&&e<=n}function q(e){var t=typeof e;return!!e&&("object"==t||"function"==t)}function E(e){return!!e&&"object"==typeof e}function N(e){return"symbol"==typeof e||E(e)&&b.call(e)==s}var K=w((function(e,t){return null==e?{}:j(e,m(k(t,1),$))}));e.exports=K}).call(this,r("c8ba"))},"93d8":function(e,t,r){"use strict";r("1e55")},ca002:function(e,t,r){"use strict";r.d(t,"c",(function(){return a})),r.d(t,"a",(function(){return i})),r.d(t,"b",(function(){return o})),r.d(t,"d",(function(){return s}));r("4de4"),r("4160"),r("a630"),r("c975"),r("d3b7"),r("6062"),r("3ca3"),r("159b"),r("ddb0");var n=r("2909");function a(){var e=new Date,t=e.getHours();return t<9?"早上好":t<=11?"上午好":t<=13?"中午好":t<20?"下午好":"晚上好"}function i(e){var t=JSON.parse(JSON.stringify(e)),r=t.filter((function(e){var r=t.filter((function(t){return e.id==t.pid}));return r.length>0&&(e.children=r),0==e.pid}));return r}var o=function e(t){var r=[];return t.forEach((function(t){t.parent_id>0&&r.push(t.parent_id),t.children&&r.push.apply(r,Object(n["a"])(e(t.children)))})),r},s=function(e){if(Array.hasOwnProperty("from"))return Array.from(new Set(e));for(var t={},r=[],n=0;n<e.length;n++)t[e[n]]||(t[e[n]]=!0,r.push(e[n]));return r}},f99b:function(e,t,r){"use strict";r.r(t);var n=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("a-modal",{attrs:{title:e.model?"编辑角色":"添加角色",width:550,visible:e.visible,confirmLoading:e.loading,okText:e.model?"立即编辑":"立即添加",cancelText:"取消"},on:{ok:e.ok,cancel:e.cancel}},[r("a-spin",{attrs:{spinning:e.loading}},[r("a-form",e._b({attrs:{form:e.form}},"a-form",e.formLayout,!1),[r("a-form-item",{directives:[{name:"show",rawName:"v-show",value:!1,expression:"false"}]},[r("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["id",{rules:[]}],expression:"['id', { rules: [] }]"}],attrs:{placeholder:"ID"}})],1),r("a-form-item",{attrs:{label:"权限字符"}},[r("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["name",{rules:[{required:!0,message:"权限字符不能为空！"}]}],expression:"['name', { rules: [{ required: true, message: '权限字符不能为空！' }] }]"}],attrs:{placeholder:"请填写权限字符 (建议英文字母)"}})],1),r("a-form-item",{attrs:{label:"角色名称"}},[r("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["display_name",{rules:[{required:!0,message:"角色名称不能为空！"}]}],expression:"['display_name', { rules: [{ required: true, message: '角色名称不能为空！' }] }]"}],attrs:{placeholder:"请填写角色名称"},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.ok(t)}}})],1),r("a-form-item",{attrs:{label:"角色描述"}},[r("a-input",{directives:[{name:"decorator",rawName:"v-decorator",value:["description"],expression:"['description']"}],attrs:{placeholder:"请填写角色描述(非必填)",type:"textarea"},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.ok(t)}}})],1)],1)],1)],1)},a=[],i=(r("4160"),r("88bc")),o=r.n(i),s=r("677a"),c=["id","name","display_name","description"],l={name:"EditRole",props:{visible:{type:Boolean,required:!0},model:{type:Object,default:function(){return null}}},data:function(){return{formLayout:{labelCol:{xs:{span:24},sm:{span:7}},wrapperCol:{xs:{span:24},sm:{span:13}}},loading:!1,form:this.$form.createForm(this)}},watch:{model:function(){this.model&&this.form.setFieldsValue(o()(this.model,c))}},created:function(){var e=this;c.forEach((function(t){return e.form.getFieldDecorator(t)}))},methods:{ok:function(){var e=this;this.loading=!0;var t=this;this.form.validateFields((function(r,n){r?e.loading=!1:n.id>0?t.edit(n):t.add(n)}))},cancel:function(){this.$emit("cancel")},add:function(e){var t=this;Object(s["b"])(e).then((function(e){t.loading=!1,200==e.code?(t.$message.success("角色添加成功..."),t.$emit("success")):t.$message.info("角色添加失败...")})).catch((function(e){t.$message.error("网络异常,请稍后再试..."),t.loading=!1}))},edit:function(e){var t=this;e.role_id=e.id,Object(s["f"])(e).then((function(e){t.loading=!1,200==e.code?(t.$message.success("角色编辑成功..."),t.$emit("success")):t.$message.info("角色编辑失败...")})).catch((function(e){t.$message.error("网络异常,请稍后再试..."),t.loading=!1}))}}},d=l,u=r("2877"),m=Object(u["a"])(d,n,a,!1,null,null,null);t["default"]=m.exports}}]);