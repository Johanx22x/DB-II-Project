<template>
  <div class="common-layout h-100">
    <el-container class="h-100">
      <el-aside width="12rem" class="h-100">
        <Navbar class="h-100" />
      </el-aside>
      <el-main>
        <router-view></router-view>
      </el-main>
    </el-container>
  </div>
</template>

<script lang="ts">
    import { defineComponent } from 'vue'
    import Navbar from './components/Navbar.vue'

    export default defineComponent({
      name: 'App',
      components: {
        Navbar,
      },
    })
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
