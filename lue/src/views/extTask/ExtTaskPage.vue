<template>
  <page-header-wrapper :title="false">
    <a-card :bordered="false">
      <div class="table-page-search-wrapper">
        <a-form layout="inline">
          <a-row :gutter="48">
            <a-col :md="6" :sm="24">
              <a-form-item label="角色名称">
                <a-input v-model="queryParam.rolename" placeholder="模糊查询" />
              </a-form-item>
            </a-col>
            <a-col :md="6" :sm="24">
              <a-form-item label="状态">
                <a-select v-model="queryParam.status" placeholder="请选择" default-value="0">
                  <a-select-option value="0">全部</a-select-option>
                  <a-select-option value="1">正常</a-select-option>
                  <a-select-option value="2">已禁用</a-select-option>
                </a-select>
              </a-form-item>
            </a-col>
            <a-col :md="6" :sm="24">
              <span class="table-page-search-submitButtons">
                <a-button type="primary" @click="$refs.table.refresh(true)">查询</a-button>
                <a-button style="margin-left: 8px" @click="() => (this.queryParam = {})">重置</a-button>
              </span>
            </a-col>
          </a-row>
        </a-form>
      </div>

      <div class="table-operator">
        <a-button type="primary" icon="sync" @click="handleRefresh"></a-button>
        <a-button type="primary" icon="plus" @click="handleAddRole">添加</a-button>
      </div>

      <s-table
              ref="table"
              size="default"
              rowKey="id"
              :columns="columns"
              :data="loadData"
              :showPagination="true"
              :scroll="{ x: 800 }"
      >
        <span slot="action" slot-scope="text, record">
          <a v-action:system:role:edit @click="handleEditRole(record)">编辑</a>
          <a-divider type="vertical" />
          <a v-action:system:role:give-perms @click="handleRolePrems(record)">分配权限</a>
          <a-divider type="vertical" />
          <a v-action:system:role:delete @click="deleteConfirm(record)">删除</a>
        </span>
      </s-table>

      <!-- 创建角色及编辑角色窗口 -->
      <create-form
              ref="createModal"
              :visible="createModal.visible"
              :model="createModal.model"
              @cancel="handleCancel"
              @success="addSuccessCallback"
      />

      <!-- 分配角色权限窗口 -->
      <give-role-prems
              ref="giveRoleModal"
              :visible="giveRolePremsModal.visible"
              :model="giveRolePremsModal.model"
              @close="() => (this.giveRolePremsModal.visible = false)"
      />
    </a-card>
  </page-header-wrapper>
</template>

<script>
    import { ServeGetAdminTask } from '@/api/rbac'
    import { ServeGetRoles } from '@/api/rbac'
    import CreateForm from './modules/EditTaskFrom'

    export default {
        name: 'SystemRolePageV2',
        components: {
            CreateForm,
        },

        /*
        ws: [{id: 1, title: "给魏开发系统", status: 1, create_time: 1992}]

         */
        data() {
            return {
                // 表格栏目
                columns: [
                    {
                        title: 'ID',
                        dataIndex: 'id',
                        width: '5%',
                        align: 'center',
                    },
                    {
                        title: '添加时间',
                        dataIndex: 'create_time',
                        width: '5%',
                        align: 'center',
                    },
                    {
                        title: '任务名称',
                        dataIndex: 'title',
                        width: '50%',
                        align: 'center',
                    },
                    {
                        title: '状态',
                        dataIndex: 'status',
                        width: '5%',
                        align: 'center',
                    },
                    /*
                    ,
                    {
                        title: '操作',
                        dataIndex: 'action',
                        width: '50px',
                        align: 'center',
                        scopedSlots: {
                            customRender: 'action'
                        }
                    }
                    */
                ],

                // 查询参数
                queryParam: {},

                // 加载数据方法 必须为 Promise 对象
                loadData: parameter => {
                    const data = Object.assign({}, parameter, this.queryParam)
                    return ServeGetAdminTask(data).then(res => {
                        return res.data
                    })
                },

                // 创建角色弹出层
                createModal: {
                    model: null,
                    visible: false
                },

                // 分配角色权限弹出层
                giveRolePremsModal: {
                    model: null,
                    visible: false
                }
            }
        },
        methods: {
            // 刷新表格数据
            handleRefresh() {
                this.$refs.table.refresh()
            },

            // 添加角色事件
            handleAddRole() {
                this.$refs.createModal.form.resetFields()
                this.createModal.visible = true
                this.createModal.model = null
            },

            // 编辑角色事件
            handleEditRole(record) {
                this.createModal.visible = true
                this.createModal.model = {
                    description: record.description,
                    display_name: record.display_name,
                    id: record.id,
                    name: record.name
                }
            },

            // 添加角色成功回调事件
            addSuccessCallback() {
                this.createModal.visible = false
                this.$refs.table.refresh(true)
                this.$refs.createModal.form.resetFields()
            },

            // 编辑角色取消事件
            handleCancel() {
                this.createModal.visible = false
                this.$refs.createModal.form.resetFields()
            },

            // 分配权限事件
            handleRolePrems(record) {
                this.giveRolePremsModal.visible = true
                this.giveRolePremsModal.model = {
                    display_name: record.display_name,
                    id: record.id
                }
            },
        }
    }
</script>
