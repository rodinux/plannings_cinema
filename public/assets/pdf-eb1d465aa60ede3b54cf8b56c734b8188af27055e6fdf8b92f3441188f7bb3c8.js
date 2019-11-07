$(window).load(function () {
    var sizes = {};
    $('#the_table tr:first th').each(function (a, td) {
        var w = $(td).width();
        if (sizes.hasOwnProperty('' + a)) {
            if (sizes['' + a] < w)
                sizes['' + a] = w;
        }
        else {
            sizes['' + a] = w;
        }
    });

    var tableClone = $('#the_table').clone();
    $('#the_table').replaceWith('<div class="container"></div>');

    var curentDivTable;
    var cDiv = $('.container');
    tableClone.find('tr').each(function (i, ln) {
        var line = $(ln);
        if (line.hasClass('main_row')) {
            var div = $('<div class="new-section"><table><tbody>')
            currentDivTable = div.find('tbody');
            cDiv.append(div);
        }
        currentDivTable.append(line);
    });
    //optional - maybe in % its better than px
    var sum = 0;
    $.each(sizes, function (a, b) {
        sum += b;
    });
    var widths = {};
    $.each(sizes, function (a, b) {
        var p = Math.ceil(b * 100 / sum);
        widths['' + a] = p + '%';
    });
    //setup
    $('.container table').each(function (a, tbl) {
        $(tbl).find('tr:first td, tr:first th').each(function (b, td) {
            $(td).width(widths['' + b]);
        });
        $(tbl).addClass('fixed');
    });
});
