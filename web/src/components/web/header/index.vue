<script setup lang="ts">

</script>

<template>
    <div class="w-full flex justify-between items-center">
        <div class="flex flex-1 items-center gap-2">
            <!-- <el-image class="w-10 h-10" fit="cover" /> -->
             <span class="w-30 text-slate-700">
                Simple Mall
             </span>
            <div class="w-full flex items-center">
                <el-button text>
                    首页
                </el-button>
                <el-button text>
                    首页
                </el-button>
            </div>
        </div>
        <div class="flex items-center gap-2">
            <el-input placeholder="搜索内容...">
                <template #append>
                    <el-button>
                        搜索
                    </el-button>
                </template>
            </el-input>
            <!-- 登录状态才有 -->
            <el-button text>
                购物车
            </el-button>
            <el-dropdown placement="bottom">
                <el-avatar :size="35" />
                <template #dropdown>
                    <el-dropdown-menu>
                        <el-dropdown-item>用户中心</el-dropdown-item>
                        <!-- 管理员才有 -->
                        <el-dropdown-item>管理中心</el-dropdown-item>

                        <el-dropdown-item>登出</el-dropdown-item>
                    </el-dropdown-menu>
                </template>
            </el-dropdown>
        </div>
    </div>

</template>

<style scoped></style>
