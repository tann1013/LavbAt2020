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
    import { ServeGetAdminBill, ServeDeleteRole } from '@/api/rbac'
    //import { ServeGetRoles, ServeDeleteRole } from '@/api/rbac'
    //import CreateForm from './modules/EditRoleFrom'
    //import GiveRolePrems from './modules/GiveRolePrems'

    export default {
        name: 'SystemRolePageV2',
        components: {
            //CreateForm,
            //GiveRolePrems
        },

    //     `op_eat` int(2) DEFAULT NULL,
    //     `op_traffic` int(2) DEFAULT NULL,
    //     `op_other` int(2) DEFAULT NULL,
    //     `op_other_notes` varchar(200) DEFAULT NULL,
    //     `total` int(2) DEFAULT NULL,
    //     `addtime` date DEFAULT NULL,
    //     `op_today_profit` varchar(5) DEFAULT NULL COMMENT '每日理财收益',
    //     `op_today_reading` varchar(5) DEFAULT NULL COMMENT '每日读书时长/分钟',
    //     `op_today_running` varchar(5) DEF
    // 吃
    // 通勤
    // 其他
    // 今日总支出
    // 收益
    // 读书
    // 跑步



        data() {
            return {
                // 表格栏目
                columns: [
                    {
                        title: '日期',
                        dataIndex: 'addtime',
                        width: '12%',
                        align: 'center',
                    },
                    {
                        title: '吃￥',
                        dataIndex: 'op_eat',
                        width: '5%',
                        align: 'center',
                    },
                    {
                        title: '通勤￥',
                        dataIndex: 'op_traffic',
                        width: '5%',
                        align: 'center',
                    },
                    {
                        title: '其他￥',
                        dataIndex: 'op_other',
                        width: '5%',
                        align: 'center',
                    },
                    {
                        title: '今日总支出￥',
                        dataIndex: 'total',
                        sorter: true,
                        width: '10%',
                        align: 'center',
                        color: 'red',
                    },
                    {
                        title: '收益￥',
                        dataIndex: 'op_today_profit',
                        sorter: true,
                        width: '10%',
                        align: 'center',
                    },
                    {
                        title: '读书min',
                        dataIndex: 'op_today_reading',
                        width: '6%',
                        align: 'center',
                    },
                    {
                        title: '跑步km',
                        dataIndex: 'op_today_running',
                        align: 'center',
                        width: '7%',
                        align: 'center',
                    }
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
                    return ServeGetAdminBill(data).then(res => {
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
