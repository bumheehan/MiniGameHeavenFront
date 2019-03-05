google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);
var data;
var dashboard;
      function drawTable() {
    	  
    	  var jsonData = $.ajax({
    	        url: "../boardchart",
    	        dataType: "json",
    	        async: false
    	        }).responseText;
    	  
    	  
     data = new google.visualization.DataTable(jsonData);

     dashboard = new google.visualization.Dashboard(document.querySelector('#dashboard'));
//     var formatter = new google.visualization.DateFormat({ pattern: "yyyy - MM - dd" });
//     formatter.format(data, 3);
//     formatter.format(data, 4);
    var stringFilter = new google.visualization.ControlWrapper({
        controlType: 'StringFilter',
        containerId: 'string_filter_div',
        options: {
            filterColumnIndex: 0,
            ui: {
                label: 'search'
            }
        }
    });
    
 
    
    var table = new google.visualization.ChartWrapper({
        chartType: 'Table',
        containerId: 'admin_board',
        options: {
            showRowNumber: true,
            allowHtml: true,
            page: 'enable',

            pageSize: 30,
            pagingSymbols: {
                prev: 'prev',
                next: 'next'
                
            },
            formatType:'long',
            
            pagingButtonsConfiguration: 'auto'
        }
    });
    
    dashboard.bind([stringFilter], [table]);
    dashboard.draw(data);
}
google.load('visualization', '1', {packages:['controls'], callback: drawTable});
        
	function removeRow(rowIndex) {
	    data.removeRow(rowIndex);
	    dashboard.draw(data);
	}
    $(document).on('click','input[type=button]',function(e) {
    	
    	
    	var bno=rowNum = $(this).parent().parent().children().eq(1).text();;
    	var url = 'deportMember' 
    		$.ajax({
    		        type: "POST",
    		        url: "bRemove",
    		        data: { bno : bno},
    		        dataType: "html",
    		        success : function (data) {
    		            //put your code here
    		        	confirm("fdaf");
    		        }
    		    });
    	rowNum = $(this).parent().parent().children().eq(0).text();
    	
    	removeRow(Number(rowNum)-1);
    	
    	
        
      });