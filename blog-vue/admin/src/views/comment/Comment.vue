<template>
  <el-card class="main-card">
    <div class="title">{{ this.$route.name }}</div>
    <!-- 表格操作 -->
    <div class="operation-container">
      <el-button
        v-if="isDelete == 0"
        type="danger"
        size="small"
        icon="el-icon-deleteItem"
        :disabled="commentIdList.length == 0"
        @click="updateIsDelete = true"
      >
        批量删除
      </el-button>
      <el-button
        v-else
        type="danger"
        size="small"
        icon="el-icon-deleteItem"
        :disabled="commentIdList.length == 0"
        @click="remove = true"
      >
        批量删除
      </el-button>
      <!-- 数据筛选 -->
      <div style="margin-left:auto">
        <el-select
          v-model="isDelete"
          placeholder="请选择"
          size="small"
          style="margin-right:1rem"
        >
          <el-option
            v-for="item in options"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          />
        </el-select>
        <el-input
          v-model="keywords"
          prefix-icon="el-icon-search"
          size="small"
          placeholder="请输入用户昵称"
          style="width:200px"
          @keyup.enter.native="listComments"
        />
        <el-button
          type="primary"
          size="small"
          icon="el-icon-search"
          style="margin-left:1rem"
          @click="listComments"
        >
          搜索
        </el-button>
      </div>
    </div>
    <!-- 表格展示 -->
    <el-table
      border
      :data="commentList"
      @selection-change="selectionChange"
      v-loading="loading"
    >
      <!-- 表格列 -->
      <el-table-column type="selection" width="55" />
      <el-table-column prop="avatar" label="头像" align="center" width="120">
        <template v-slot="scope">
          <img :src="scope.row.avatar" width="40" height="40" />
        </template>
      </el-table-column>
      <!-- 评论人昵称 -->
      <el-table-column
        prop="nickname"
        label="评论人"
        align="center"
        width="120"
      />
      <!-- 回复人昵称 -->
      <el-table-column
        prop="replyNickname"
        label="回复人"
        align="center"
        width="120"
      >
        <template v-slot="scope">
          <span v-if="scope.row.replyNickname">
            {{ scope.row.replyNickname }}
          </span>
          <span v-else>无</span>
        </template>
      </el-table-column>
      <!-- 评论文章标题 -->
      <el-table-column prop="articleTitle" label="文章标题" align="center">
        <template v-slot="scope">
          <span v-if="scope.row.articleTitle">
            {{ scope.row.articleTitle }}
          </span>
          <span v-else>无</span>
        </template>
      </el-table-column>
      <!-- 评论内容 -->
      <el-table-column prop="commentContent" label="评论内容" align="center">
        <template v-slot="scope">
          <span v-html="scope.row.commentContent" class="comment-content" />
        </template>
      </el-table-column>
      <!-- 点赞量 -->
      <el-table-column
        prop="likeCount"
        label="点赞量"
        width="80"
        align="center"
      >
        <template v-slot="scope">
          <span v-if="scope.row.likeCount">
            {{ scope.row.likeCount }}
          </span>
          <span v-else>0</span>
        </template>
      </el-table-column>
      <!-- 评论时间 -->
      <el-table-column
        prop="createTime"
        label="评论时间"
        width="150"
        align="center"
      >
        <template v-slot="scope">
          <i class="el-icon-time" style="margin-right:5px" />
          {{ scope.row.createTime | date }}
        </template>
      </el-table-column>
      <el-table-column label="来源" align="center" width="100">
        <template v-slot="scope">
          <el-tag v-if="scope.row.articleTitle">文章</el-tag>
          <el-tag v-else type="warning">友链</el-tag>
        </template>
      </el-table-column>
      <!-- 列操作 -->
      <el-table-column label="操作" width="160" align="center">
        <template v-slot="scope">
          <el-popconfirm
            v-if="scope.row.isDelete == 0"
            title="确定删除吗？"
            @confirm="updateCommentStatus(scope.row.id)"
          >
            <el-button size="mini" type="danger" slot="reference">
              删除
            </el-button>
          </el-popconfirm>
          <el-popconfirm
            v-if="scope.row.isDelete == 1"
            title="确定恢复吗？"
            @confirm="updateCommentStatus(scope.row.id)"
          >
            <el-button size="mini" type="success" slot="reference">
              恢复
            </el-button>
          </el-popconfirm>
          <el-popconfirm
            style="margin-left:10px"
            v-if="scope.row.isDelete == 1"
            title="确定彻底删除吗？"
            @confirm="deleteComments(scope.row.id)"
          >
            <el-button size="mini" type="danger" slot="reference">
              删除
            </el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页 -->
    <el-pagination
      class="pagination-container"
      background
      @size-change="sizeChange"
      @current-change="currentChange"
      :current-page="current"
      :page-size="size"
      :total="count"
      :page-sizes="[10, 20]"
      layout="total, sizes, prev, pager, next, jumper"
    />
    <!-- 批量删除对话框 -->
    <el-dialog :visible.sync="updateIsDelete" width="30%">
      <div class="dialog-title-container" slot="title">
        <i class="el-icon-warning" style="color:#ff9900" />提示
      </div>
      <div style="font-size:1rem">是否删除选中项？</div>
      <div slot="footer">
        <el-button @click="updateIsDelete = false">取 消</el-button>
        <el-button type="primary" @click="updateCommentStatus(null)">
          确 定
        </el-button>
      </div>
    </el-dialog>
    <!-- 批量彻底删除对话框 -->
    <el-dialog :visible.sync="remove" width="30%">
      <div class="dialog-title-container" slot="title">
        <i class="el-icon-warning" style="color:#ff9900" />提示
      </div>
      <div style="font-size:1rem">是否彻底删除选中项？</div>
      <div slot="footer">
        <el-button @click="remove = false">取 消</el-button>
        <el-button type="primary" @click="deleteComments(null)">
          确 定
        </el-button>
      </div>
    </el-dialog>
  </el-card>
</template>

<script>
export default {
  created() {
    this.listComments();
  },
  data: function() {
    return {
      loading: true,
      remove: false,
      updateIsDelete: false,
      options: [
        {
          value: 0,
          label: "正常"
        },
        {
          value: 1,
          label: "回收站"
        }
      ],
      commentList: [],
      commentIdList: [],
      keywords: null,
      isDelete: 0,
      current: 1,
      size: 10,
      count: 0
    };
  },
  methods: {
    selectionChange(commentList) {
      this.commentIdList = [];
      commentList.forEach(item => {
        this.commentIdList.push(item.id);
      });
    },
    sizeChange(size) {
      this.size = size;
      this.listComments();
    },
    currentChange(current) {
      this.current = current;
      this.listComments();
    },
    updateCommentStatus(id) {
      let param = new URLSearchParams();
      if (id != null) {
        param.append("idList", [id]);
      } else {
        param.append("idList", this.commentIdList);
      }
      param.append("isDelete", this.isDelete == 0 ? 1 : 0);
      this.axios.put("/api/admin/comments", param).then(({ data }) => {
        if (data.flag) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.listComments();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
        this.updateIsDelete = false;
      }).catch(error => {
        console.error("更新评论状态失败", error);
        this.$notify.error({
          title: "失败",
          message: "更新评论状态失败"
        });
        this.updateIsDelete = false;
      });
    },
    deleteComments(id) {
      var param = {};
      if (id == null) {
        param = { data: this.commentIdList };
      } else {
        param = { data: [id] };
      }
      this.axios.delete("/api/admin/comments", param).then(({ data }) => {
        if (data.flag) {
          this.$notify.success({
            title: "成功",
            message: data.message
          });
          this.listComments();
        } else {
          this.$notify.error({
            title: "失败",
            message: data.message
          });
        }
        this.remove = false;
      }).catch(error => {
        console.error("删除评论失败", error);
        this.$notify.error({
          title: "失败",
          message: "删除评论失败"
        });
        this.remove = false;
      });
    },
    listComments() {
      this.loading = true;
      this.axios
        .get("/api/admin/comments", {
          params: {
            current: this.current,
            size: this.size,
            keywords: this.keywords,
            isDelete: this.isDelete
          }
        })
        .then(({ data }) => {
          if (data.data && data.data.recordList) {
            this.commentList = data.data.recordList;
            this.count = data.data.count;
          } else if (Array.isArray(data.data)) {
            this.commentList = data.data;
            this.count = data.data.length;
          } else if (data.recordList) {
            this.commentList = data.recordList;
            this.count = data.count;
          } else {
            this.commentList = [];
            this.count = 0;
            console.error("评论数据结构不符合预期", data);
          }
          this.loading = false;
        })
        .catch(error => {
          console.error("获取评论列表失败", error);
          this.commentList = [];
          this.count = 0;
          this.loading = false;
          this.$notify.error({
            title: "失败",
            message: "获取评论列表失败"
          });
        });
    }
  },
  watch: {
    isDelete() {
      this.listComments();
    }
  }
};
</script>

<style scoped>
.comment-content {
  display: inline-block;
}
</style>
