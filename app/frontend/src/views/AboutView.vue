<template>
    <el-container class="container-sm">
        <el-main>
            <el-row justify="center">
                <el-col :span="6" class="m-4">
                    <el-card shadow="hover">
                        <el-avatar :size="100" :src="johan_avatar" class="mx-auto d-block"></el-avatar>
                        <el-divider></el-divider>
                        <el-text>
                            <h3 class="text-center">Johan Rodriguez</h3>
                            <p class="text-center">@Johanx22x</p>
                            <p class="text-center">A Computer Science student
                            at Costa Rica Institute of Technology.
                            </p>
                            <!-- Contact -->
                            <el-row justify="center">
                                <el-col :span="6">
                                    <el-link href="https://github.com/Johanx22x" target="_blank">
                                        <el-avatar :size="30" src="https://logos-download.com/wp-content/uploads/2016/09/GitHub_logo.png"></el-avatar>
                                    </el-link>
                                </el-col>
                                <el-col :span="6">
                                    <el-link href="https://www.linkedin.com/in/johan-rodr%C3%ADguez-5a49a223a/" target="_blank">
                                        <el-avatar :size="30" src="https://cdn.iconscout.com/icon/free/png-256/linkedin-208-916919.png"></el-avatar>
                                    </el-link>
                                </el-col>
                            </el-row>
                        </el-text>
                    </el-card>
                </el-col>
                <el-col :span="6" class="m-4">
                    <el-card shadow="hover">
                        <el-avatar :size="100" :src="mathew_avatar" class="mx-auto d-block"></el-avatar>
                        <el-divider></el-divider>
                        <el-text>
                            <h3 class="text-center">Mathew Carballo</h3>
                            <p class="text-center">@ContraInfinito</p>
                            <p class="text-center">A Computer Science student
                            at Costa Rica Institute of Technology.
                            </p>
                            <!-- Contact -->
                            <el-row justify="center">
                                <el-col :span="4">
                                    <el-link href="https://github.com/ContraInfinito" target="_blank">
                                        <el-avatar :size="30" src="https://logos-download.com/wp-content/uploads/2016/09/GitHub_logo.png"></el-avatar>
                                    </el-link>
                                </el-col>
                            </el-row>
                        </el-text>
                    </el-card>
                </el-col>
            </el-row>
        </el-main>
    </el-container>
</template>

<script lang="ts">
    import { reactive, toRefs, defineComponent } from 'vue';

    const state = reactive({
        johan_avatar: 'https://avatars.githubusercontent.com/u/101372687',
        mathew_avatar: 'https://scontent.fsjo14-1.fna.fbcdn.net/v/t39.30808-6/311697568_3191601774438952_2599050419873419803_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_ohc=se-MdzYpgfUAX-dwncv&_nc_ht=scontent.fsjo14-1.fna&oh=00_AfA0m2K_fwYoocD1TBENxDwFswPLFfLs3uow2PgTX5QXmw&oe=653AD0B0',
    });

    const { johan_avatar, mathew_avatar } = toRefs(state);

    export default defineComponent({
        name: 'AboutView',
        setup() {
            return {
                johan_avatar,
                mathew_avatar,
            };
        },
    });
</script>
