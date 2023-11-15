<template>
    <el-container class="container-sm">
        <el-card shadow="hover" class="h-100 w-100">
            <div id="fourth-chart" class="h-100"> </div>
        </el-card>
    </el-container>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import axios from 'axios';

    // @ts-ignore
    google.charts.load("current", {packages:["corechart"]});

    export default defineComponent({
        name: 'Fourth',
        mounted() {
            // @ts-ignore
            google.charts.setOnLoadCallback(this.drawChart);
        },
        methods: {
            async fetchData() {
                // @ts-ignore
                const response = await axios.get('/api/fourth-component', {
                    params: {
                        // @ts-ignore
                        type: this.$store.getters.getFourthChartType,
                    },
                });

                return response.data;
            },
            async drawChart() {
                var data = await this.fetchData();

                let chartData = [
                    ['Weekday', 'Applications count'],
                ];

                for (let i = 0; i < data.length; i++) {
                    chartData.push([data[i].goods_type, data[i].application_count]);
                }

                // @ts-ignore
                var data = google.visualization.arrayToDataTable([ ...chartData ]);

                var options = {
                    title: this.$store.getters.getFourthChartType + ' applications ordered by weekday',
                    pieHole: 0.4,
                    height: 300,
                };

                // @ts-ignore
                var chart = new google.visualization.PieChart(document.getElementById('fourth-chart'));
                chart.draw(data, options);
            },
        },
    });
</script>