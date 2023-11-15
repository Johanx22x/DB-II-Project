<template>
    <el-container class="container-xl">
        <el-main>
            <el-card class="box-card">
                <div slot="header" class="clearfix">
                    <h1>Settings</h1>
                    <el-divider />
                </div>
                <div class="text item d-flex flex-column justify-content-center align-items-center">
                    <el-row :gutter="20">
                        <el-col :span="12">
                            <el-form-item label="Select a component">
                                <el-select v-model="selectedComponent" placeholder="Select a component">
                                    <el-option
                                        v-for="item in components"
                                        :key="item.value"
                                        :label="item.label"
                                        :value="item.value"
                                    />
                                </el-select>
                            </el-form-item>
                        </el-col>
                        <el-col :span="12">
                            <el-form-item label="Filter criteria">
                                <el-select v-model="selectedField" placeholder="Select a field" :disabled="!selectedComponent">
                                    <el-option
                                        v-for="item in fields[selectedComponent]"
                                        :key="item.value"
                                        :label="item.label"
                                        :value="item.value"
                                    />
                                </el-select>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-button type="primary" size="default" @click="handleClick">Change</el-button>
                </div>
            </el-card>
        </el-main>
    </el-container>
</template>

<script lang="ts">
import { de } from 'element-plus/es/locale';
import { defineComponent } from 'vue';

export default defineComponent({
    name: "SettingsView",
    data() {
        return {
            selectedComponent: null, 
            selectedField: null,
            components: [] as any[],
            fields: {} as any
        }
    },
    mounted() {
        this.components = [
            { value: 1, label: 'Component 1: <Status> applications ordered by weekday' },
            { value: 2, label: 'Component 2: <Status> applications ordered by work type' },
            { value: 3, label: 'Component 4: <Goods Type> applications ordered by weekday' },
            { value: 4, label: 'Component 5: <Goods Type> applications ordered by family status' }
        ];

        this.fields = {
            1: [
                { value: 'Active', label: 'Active' },
                { value: 'Closed', label: 'Closed' }
            ],
            2: [
                { value: 'Active', label: 'Active' },
                { value: 'Closed', label: 'Closed' }
            ],
            3: [
                { value: 'Cash loans', label: 'Cash loans' },
                { value: 'Revolving loans', label: 'Revolving loans' },
                { value: 'Consumer loans', label: 'Consumer loans' }
            ],
            4: [
                { value: 'Cash loans', label: 'Cash loans' },
                { value: 'Revolving loans', label: 'Revolving loans' },
                { value: 'Consumer loans', label: 'Consumer loans' }
            ]
        }
    },
    methods: {
        handleClick() {
            switch (this.selectedComponent) {
                case 1:
                    this.$store.commit('setFirstChartStatus', this.selectedField);
                    break;
                case 2:
                    this.$store.commit('setSecondChartStatus', this.selectedField);
                    break;
                case 3:
                    this.$store.commit('setFourthChartType', this.selectedField);
                    break;
                case 4:
                    this.$store.commit('setFifthChartType', this.selectedField);
                    break;
                default:
                    break;
            }
        }
    }
});
</script>