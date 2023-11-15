<template>
    <el-container class="container-sm">
        <el-card shadow="hover" class="h-100 w-100">
            <div id="third-chart" class="h-100"> </div>
        </el-card>
    </el-container>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import axios from 'axios';

    // @ts-ignore
    google.charts.load("current", {packages:["corechart"]});

    export default defineComponent({
        name: 'Third',
        mounted() {
            // @ts-ignore
            google.charts.setOnLoadCallback(this.drawChart);
        },
        methods: {
            async fetchData() {
                // @ts-ignore
                const response = await axios.get('/api/third-component');
                return response.data;
            },
            async drawChart() {
                var data = await this.fetchData();

                let chartData = [
                    ['Gender', 'Applications count'],
                ];

                for (let i = 0; i < data.length; i++) {
                    chartData.push([data[i].gender, data[i].application_count]);
                }

                // @ts-ignore
                var data = google.visualization.arrayToDataTable([ ...chartData ]);

                var options = {
                    title: 'Applications by client gender',
                    pieHole: 0.4,
                    height: 300,
                };

                // @ts-ignore
                var chart = new google.visualization.PieChart(document.getElementById('third-chart'));
                chart.draw(data, options);
            },
        },
    });
</script>