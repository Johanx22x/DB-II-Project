import { createStore } from 'vuex'

export default createStore({
  state: {
    firstChart: {
      status: 'Active',
    },
    secondChart: {
      status: 'Active',
    },
    fourthChart: {
      type: 'Cash loans',
    },
    fifthChart: {
      type: 'Cash loans',
    },
  },
  getters: {
    getFirstChartStatus: (state) => state.firstChart.status,
    getSecondChartStatus: (state) => state.secondChart.status,
    getFourthChartType: (state) => state.fourthChart.type,
    getFifthChartType: (state) => state.fifthChart.type,
  },
  mutations: {
    setFirstChartStatus(state, status) {
      state.firstChart.status = status;
    },
    setSecondChartStatus(state, status) {
      state.secondChart.status = status;
    },
    setFourthChartType(state, type) {
      state.fourthChart.type = type;
    },
    setFifthChartType(state, type) {
      state.fifthChart.type = type;
    },
  },
  actions: {
  },
  modules: {
  }
})
