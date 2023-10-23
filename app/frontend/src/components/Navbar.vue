<template>
<el-menu
    default-active="2"
    class="el-menu-vertical-demo"
    @open="handleOpen"
    @close="handleClose"
  >
    <img alt="Vue logo" src="../assets/logo.png" class="logo" />
    <router-link to="/" class="router-link">
      <el-menu-item>
        <el-icon><House /></el-icon>
        <el-text>Home</el-text>
      </el-menu-item>
    </router-link>
    <router-link to="/config" class="router-link">
      <el-menu-item>
        <el-icon><Setting /></el-icon>
        <el-text>Configuration</el-text>
      </el-menu-item>
    </router-link>
    <router-link to="/about" class="router-link">
      <el-menu-item>
        <el-icon><User /></el-icon>
        <el-text>About</el-text>
      </el-menu-item>
    </router-link>
  </el-menu>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';

    import {
      User,
      House,
      Setting,
    } from '@element-plus/icons-vue'

    export default defineComponent({
        name: 'Navbar',
        components: {
            User,
            House,
            Setting,
        },
    });
</script>

<style scoped>
    .logo {
        width: 80%;
        margin: 5 auto;
    }

    .router-link {
        text-decoration: none;
    }
</style>
