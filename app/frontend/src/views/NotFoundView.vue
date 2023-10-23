<template>
    <div class="not-found container-sm mt-5 text-center d-flex flex-column align-items-center">
        <img alt="404" class="not-found-image" src="https://media.tenor.com/qbhL03q9is4AAAAi/dance-scared.gif"/>
        <el-text class="not-found-caption m-0 p-0">404</el-text>
        <el-text class="not-found-text m-0 p-0">Page not found</el-text>
    </div>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';

    export default defineComponent({
        name: 'NotFoundView',
    });
</script>

<style scoped>
    .not-found-image {
        width: 100%;
        max-width: 300px;
    }

    .not-found-caption {
        font-size: 7rem;
        font-weight: bold;
    }

    .not-found-text {
        font-size: 2rem;
        font-weight: bold;
    }
</style>
