<script setup lang="ts">
import { Get } from '@/utils';

const axiosDataRef = ref('')
function axiosTest() {
  Get<string>('/test').then((res: string) => {
    console.log(res)
    axiosDataRef.value = res
  })
}
</script>

<template>
  <div>
    <h2>测试页面</h2>

    <h4>页面访问</h4>
    <div class="flex gap-2">
      <router-link to="/home">首页</router-link>
      <router-link to="/search">搜索详情页</router-link>
      <router-link to="/product">商品详情页</router-link>
      <router-link to="/order">订单详情页</router-link>
    </div>

    <h4>unocss测试</h4>
    <div class="bg-red">
      红色
    </div>

    <h4>Axios测试</h4>
    <div>
      {{ axiosDataRef }}
    </div>
    <el-button @click="axiosTest">
      测试获取数据
    </el-button>
  </div>
</template>

<style scoped></style>
