<script setup lang="ts">

</script>

<template>
  <el-container>
    <el-header class="w-full flex items-center">
      <Header />
    </el-header>
    <el-main>
      <router-view />
    </el-main>
    <el-footer>
      <Footer />
    </el-footer>
  </el-container>
</template>

<style scoped></style>
