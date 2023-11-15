<template>
    <el-container class="container-sm">
        <el-card shadow="hover" class="h-100 w-100">
            <div id="fifth-chart" class="h-100"> </div>
        </el-card>
    </el-container>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import axios from 'axios';

    // @ts-ignore
    google.charts.load("current", {packages:["corechart"]});

    export default defineComponent({
        name: 'Fifth',
        mounted() {
            // @ts-ignore
            google.charts.setOnLoadCallback(this.drawChart);
        },
        methods: {
            async fetchData() {
                // @ts-ignore
                const response = await axios.get('/api/fifth-component', {
                    params: {
                        // @ts-ignore
                        type: this.$store.getters.getFifthChartType,
                    },
                });

                return response.data;
            },
            async drawChart() {
                var data = await this.fetchData();

                let chartData = [
                    ['Family Status', 'Applications count'],
                ];

                for (let i = 0; i < data.length; i++) {
                    chartData.push([data[i].family_status, data[i].application_count]);
                }

                // @ts-ignore
                var data = google.visualization.arrayToDataTable([ ...chartData ]);

                var options = {
                    title: this.$store.getters.getFifthChartType + ' applications ordered by family status',
                    pieHole: 0.4,
                    height: 300,
                };

                // @ts-ignore
                var chart = new google.visualization.PieChart(document.getElementById('fifth-chart'));
                chart.draw(data, options);
            },
        },
    });
</script>