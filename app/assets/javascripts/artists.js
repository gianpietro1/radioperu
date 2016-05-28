$(document).ready(function(){

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['table']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data_playlist = new google.visualization.DataTable();
        data_playlist.addColumn('string', 'Canción');
        data_playlist.addColumn('number', 'Reproducciones');
        data_playlist.addRows(playlist_stats);
				var view_playlist = new google.visualization.DataView(data_playlist);
				view_playlist.setRows(data_playlist.getSortedRows({column: 1, desc: true}));

        var data_catalogue = new google.visualization.DataTable();
        data_catalogue.addColumn('string', 'Canción');
        data_catalogue.addColumn('number', 'Reproducciones');
        data_catalogue.addRows(catalogue_stats);
				var view_catalogue = new google.visualization.DataView(data_catalogue);
				view_catalogue.setRows(data_catalogue.getSortedRows({column: 1, desc: true}));

        var data_radio = new google.visualization.DataTable();
        data_radio.addColumn('string', 'Canción');
        data_radio.addColumn('number', 'Reproducciones');
        data_radio.addRows(radio_stats);
				var view_radio = new google.visualization.DataView(data_radio);
				view_radio.setRows(data_radio.getSortedRows({column: 1, desc: true}));

        // Set chart options
        var options = {
                       'width':350,
                       'height':350,
                       page: 'enable'
                     };

        // Instantiate and draw our chart, passing in some options.
        var chart_playlist = new google.visualization.Table(document.getElementById('playlist_chart'));
        chart_playlist.draw(view_playlist, options);

        var chart_catalogue = new google.visualization.Table(document.getElementById('catalogue_chart'));
        chart_catalogue.draw(view_catalogue, options);

        var chart_radio = new google.visualization.Table(document.getElementById('radio_chart'));
        chart_radio.draw(view_radio, options);      

      }

 });