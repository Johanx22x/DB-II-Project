<template>
  <el-main class="w-100 h-100 p-3 d-flex flex-column">
    <el-row class="w-100 h-100">
      <el-col :span="12">
        <First class="mb-3" />
      </el-col>
      <el-col :span="12">
        <Second class="mb-3" />
      </el-col>
    </el-row>
    <el-row class="w-100 h-100">
      <el-col :span="8">
        <Third class="mb-3" />
      </el-col>
      <el-col :span="8">
        <Fourth class="mb-3" />
      </el-col>
      <el-col :span="8">
        <Fifth class="mb-3" />
      </el-col>
    </el-row>
  </el-main>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import First from '@/components/First.vue';
import Second from '@/components/Second.vue';
import Third from '@/components/Third.vue';
import Fourth from '@/components/Fourth.vue';
import Fifth from '@/components/Fifth.vue';

export default defineComponent({
    name: "HomeView",
    components: {
        First,
        Second,
        Third,
        Fourth,
        Fifth,
    },
});
</script>
