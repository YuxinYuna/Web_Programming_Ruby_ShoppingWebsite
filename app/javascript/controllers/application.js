import { Application } from "@hotwired/stimulus"
import ApexCharts from "apexcharts" // Import ApexCharts

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

// Function to initialize charts
function initializeCharts() {
  // Line Chart for Revenue
  var lineChartOptions = {
    chart: {
      type: 'line',
      height: 350,
    },
    series: [{
      name: 'Revenue',
      data: [5678, 9075, 12347, 54625, 4567, 8954,8759,23423,15960,23463,13415,23456],
    }],
    xaxis: {
      categories: ['January', 'February', 'March', 'April', 'May', 'June','July','August','September','October','November','December'],
    },
    title: {
      text: 'Monthly Revenue',
      align: 'center',
    },
    stroke: {
      curve: 'smooth',
      width: 4,
    },
    fill: {
      opacity: 0.7,
      gradient: {
        type: 'vertical',
        shadeIntensity: 0.5,
        gradientToColors: ['#f44336', '#2196f3'], // Gradient colors for the fill
        opacityFrom: 0.5,
        opacityTo: 0.1,
      },
    },
    markers: {
      size: 6,
      colors: ['#ff5722'], // Color for the data points
      strokeColor: '#fff', // Border color of the data points
      strokeWidth: 2,
    },
    tooltip: {
      enabled: true,
    },
  };

  var lineChart = new ApexCharts(document.querySelector("#lineChart"), lineChartOptions);
  lineChart.render();

  // Pie Chart for Product Categories
  var pieChartOptions = {
    chart: {
      type: 'pie',
      height: 350,
    },
    series: [38, 25, 13, 17,7],
    labels: ['Sichuan food', 'Beijing food',' Xinjiang food', 'Guangdong food','Dongbei food'],
    colors: ['#ff6384', '#36a2eb', '#ffcd56', '#4bc0c0','#bf00ff'],
    title: {
      text: 'Product Categories',
      align: 'center',
    },
    dataLabels: {
      style: {
        fontSize: '14px',
        fontWeight: 'bold',
      },
      dropShadow: {
        enabled: true,
        top: 1,
        left: 1,
        opacity: 0.8,
        blur: 3,
        color: '#000',
      },
    },
    tooltip: {
      enabled: true,
    },
  };

  var pieChart = new ApexCharts(document.querySelector("#pieChart"), pieChartOptions);
  pieChart.render();

  // Bar Chart for Sales Data
  var barChartOptions = {
    chart: {
      type: 'bar',
      height: 450,
    },
    series: [{
      name: 'Sales',
      data: [2340, 3429, 1350, 5619, 6543, 2378,2423,5465,6828,2066,4727,8769],
    }],
    xaxis: {
      categories: ['January', 'February', 'March', 'April', 'May', 'June','July','August','September','October','November','December'],
    },
    title: {
      text: 'Monthly Sales',
      align: 'center',
    },
    yaxis: {
      min: 0,
    },
    fill: {
      opacity: 0.7,
      gradient: {
        type: 'horizontal',
        shadeIntensity: 0.4,
        gradientToColors: ['#ff0080', '#ff6699'],
      },
    },
    colors: ['#6699ff'],
    tooltip: {
      enabled: true,
    },
  };

  var barChart = new ApexCharts(document.querySelector("#barChart"), barChartOptions);
  barChart.render();

  // Top Selling Products Bar Chart
  const topSellingProducts = [
    { name: "Xiao Long Bao", sales: 5630 },
    { name: "Peking Duck", sales: 4350 },
    { name: "Sweet and Sour Ribs", sales: 3150 },
    { name: "Da Pan Ji", sales: 1300 },
  ];

  const productNames = topSellingProducts.map(product => product.name);
  const productSales = topSellingProducts.map(product => product.sales);

  var topSellingOptions = {
    colors: ['#ff0080', '#ffeb3b', '#8bc34a', '#2196f3'],
    chart: {
      type: 'bar',
      height: 350,
    },
    series: [{
      name: 'Sales',
      data: productSales,
    }],
    xaxis: {
      categories: productNames,
    },
    title: {
      text: 'Top Selling Products',
      align: 'center',
    },
    
    plotOptions: {
      bar: {
        horizontal: true,
        borderRadius: 8,
        columnWidth: '50%',
      },
    },
    dataLabels: {
      enabled: true,
      style: {
        fontSize: '16px',
        fontWeight: 'bold',
      },
      formatter: (val) => `${val} dishes`,
    },
    tooltip: {
      enabled: true,
      y: {
        formatter: (val) => `${val} dishes sold`,
      },
    },
    fill: {
      opacity: 0.8,
    },
  };

  var topSellingChart = new ApexCharts(document.querySelector("#topSellingChart"), topSellingOptions);
  topSellingChart.render();
}

// Call the chart initialization function when the page is loaded
// document.addEventListener("DOMContentLoaded", initializeCharts);

// If you're using Turbo, make sure to re-initialize charts after navigating between pages
document.addEventListener("turbo:load", initializeCharts);

export { application }