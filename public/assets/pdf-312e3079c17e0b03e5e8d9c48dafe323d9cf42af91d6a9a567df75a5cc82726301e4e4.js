$(window).load(function(){var e={};$("#the_table tr:first th").each(function(a,t){var n=$(t).width();e.hasOwnProperty(""+a)?e[""+a]<n&&(e[""+a]=n):e[""+a]=n});var a=$("#the_table").clone();$("#the_table").replaceWith('<div class="container"></div>');var i=$(".container");a.find("tr").each(function(a,t){var n=$(t);if(n.hasClass("main_row")){var e=$('<div class="new-section"><table><tbody>');currentDivTable=e.find("tbody"),i.append(e)}currentDivTable.append(n)});var r=0;$.each(e,function(a,t){r+=t});var c={};$.each(e,function(a,t){var n=Math.ceil(100*t/r);c[""+a]=n+"%"}),$(".container table").each(function(a,t){$(t).find("tr:first td, tr:first th").each(function(a,t){$(t).width(c[""+a])}),$(t).addClass("fixed")})});