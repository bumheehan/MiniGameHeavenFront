google.charts.load('current', {packages: ['corechart', 'line','controls']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {
	var jsDate = new Date();
	var date = jsDate.getTime();
	
	var jsonData = $.ajax({
	        url: "../visitor_line",
	        type: 'GET',

  		success: function(resp) {
		  },
		  error: function() {
			  alert("error")
		  },
	        dataType: "json",
	        async: false
	        }).responseText;
	  
  
	var data = new google.visualization.DataTable(jsonData);
	
	var dashboard = new google.visualization.Dashboard(
            document.getElementById('dashboard'));
	
	var dateSlider = new google.visualization.ControlWrapper({
		controlType: 'DateRangeFilter',
		containerId: 'slider',
		options: {
			filterColumnLabel: 'date',
			width: ($(window).width())
		}
	});


	var lineChart = new google.visualization.ChartWrapper({
		chartType: 'LineChart',
		containerId: 'visitor_chart',
		options: {
			hAxis: {
				  format: 'yyyy/MM'
				},
			vAxis: {
		        format: 'decimal'
		    },
			legend: 'none',
//			theme: 'material',
			title:'visitors',
//			focusTarget: 'category',
			animation: {
				duration: 1000,
				easing: 'out',
				startup: true
			},
			width: ($(window).width()),
			height: ($(window).height() * 0.70)
		}
	});
	
      dashboard.bind(dateSlider, lineChart);
		
		dashboard.draw(data);
    }