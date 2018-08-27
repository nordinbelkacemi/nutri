window.onload = function () {

var chart = new CanvasJS.Chart("chartContainer", {
  animationEnabled: true,
  title:{
    text: "Macronutrients",
    horizontalAlign: "center"
  },
  data: [{
    type: "doughnut",
    startAngle: 60,
    //innerRadius: 60,
    indexLabelFontSize: 17,
    indexLabel: "{label} - #percent%",
    toolTipContent: "<b>{label}:</b> {y} (#percent%)",
    dataPoints: [
      { y: 67, label: "Carbohydrates" },
      { y: 28, label: "Protein" },
      { y: 5, label: "Fat" }
    ]
  }]
});
chart.render();

}
