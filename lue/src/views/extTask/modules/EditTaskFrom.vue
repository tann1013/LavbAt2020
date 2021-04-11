<template>
  <a-modal
          :title="model ? '编辑任务' : '添加任务'"
          :width="550"
          :visible="visible"
          :confirmLoading="loading"
          :okText="model ? '立即编辑' : '立即添加'"
          cancelText="取消"
          @ok="ok"
          @cancel="cancel"
  >
    <a-spin :spinning="loading">
      <a-form :form="form" v-bind="formLayout">
        <a-form-item v-show="false">
          <a-input v-decorator="['id', { rules: [] }]" placeholder="ID" />
        </a-form-item>
        <a-form-item label="任务名称">
          <a-input
                  placeholder="请任务名称"
                  v-decorator="['title', { rules: [{ required: true, message: '任务名称不能为空！' }] }]"
          />
        </a-form-item>
        <a-form-item label="任务描述">
          <a-input
                  placeholder="请填写任务描述"
                  v-decorator="['content', { rules: [{ required: true, message: '任务描述不能为空！' }] }]"
          />
        </a-form-item>
        <a-form-item label="发起时间">
          <a-input
                  placeholder="请填写发起时间"
                  v-decorator="['create_time', { rules: [{ required: true, message: '发起时间不能为空！' }] }]"
          />
        </a-form-item>
      </a-form>
    </a-spin>
  </a-modal>
</template>

<script>
    import pick from 'lodash.pick'
    import { ServeCreateTask, ServeEditTask } from '@/api/rbac'

    // 表单字段
    const fields = ['id', 'name', 'display_name', 'description']

    export default {
        name: 'EditTask',
        props: {
            visible: {
                type: Boolean,
                required: true
            },
            model: {
                type: Object,
                default: () => null
            }
        },
        data() {
            return {
                formLayout: {
                    labelCol: {
                        xs: {
                            span: 24
                        },
                        sm: {
                            span: 7
                        }
                    },
                    wrapperCol: {
                        xs: {
                            span: 24
                        },
                        sm: {
                            span: 13
                        }
                    }
                },
                loading: false,
                form: this.$form.createForm(this)
            }
        },
        watch: {
            model() {
                this.model && this.form.setFieldsValue(pick(this.model, fields))
            }
        },
        created() {
            fields.forEach(v => this.form.getFieldDecorator(v))
        },
        methods: {
            ok() {
                this.loading = true
                let _this = this
                this.form.validateFields((errors, values) => {
                    if (!errors) {
                        if (values.id > 0) {
                            _this.edit(values)
                        } else {
                            _this.add(values)
                        }
                    } else {
                        this.loading = false
                    }
                })
            },
            cancel() {
                this.$emit('cancel')
            },

            add(values) {
                ServeCreateTask(values)
                    .then(res => {
                        this.loading = false
                        if (res.code == 200) {
                            this.$message.success('任务添加成功...')
                            this.$emit('success')
                        } else {
                            this.$message.info('任务添加失败...')
                        }
                    })
                    .catch(err => {
                        this.$message.error('网络异常,请稍后再试...')
                        this.loading = false
                    })
            },

            edit(values) {
                values.task_id = values.id
                ServeEditRole(values)
                    .then(res => {
                        this.loading = false
                        if (res.code == 200) {
                            this.$message.success('任务编辑成功...')
                            this.$emit('success')
                        } else {
                            this.$message.info('任务编辑失败...')
                        }
                    })
                    .catch(err => {
                        this.$message.error('网络异常,请稍后再试...')
                        this.loading = false
                    })
            }
        }
    }
</script>
