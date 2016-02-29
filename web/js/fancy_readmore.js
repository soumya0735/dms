jQuery(document).ready(function() {
  
    //jQuery("#container").append("<div class=\"tempcontainerclass\" id=\"tempcontainer\"><div id=\"btn-size-logo\"><a id=\"print-article\" href=\"#\" style=\"padding-right:10px;\"  title=\"Print Article\"><img style=\"width:25px;height:25px\" src=\"images/printer.png\" alt=\"Print\" /></a>                <a id=\"jfontsize-minus\" href=\"#\" title=\"Decrease size\"><img src=\"images/btnMinus.jpg\" alt=\"Decrease font size\" /></a><a id=\"jfontsize-default\" href=\"#\" title=\"Deafult size\"><img src=\"images/btnDefault.jpg\" alt=\"Default font size\" /></a><a id=\"jfontsize-plus\" href=\"#\" title=\"Increase size\"><img src=\"images/btnPlus.jpg\" alt=\"Increase font size\" /></a> <div class=\"clear\">&nbsp;</div></div><h2>"+$("#span40").html()+"</h2><hr/></div>");  
    jQuery("#container").append("<div class=\"tempcontainerclass\" id=\"tempcontainer\"><div id=\"btn-size-logo\"><a id=\"print-article\" href=\"#\" style=\"padding-right:10px;\"  title=\"Print Article\"></a>  <a id=\"jfontsize-minus\" href=\"#\" title=\"Decrease size\"><img src=\"images/btnMinus.jpg\" alt=\"Decrease font size\" /></a><a id=\"jfontsize-default\" href=\"#\" title=\"Deafult size\"><img src=\"images/btnDefault.jpg\" alt=\"Default font size\" /></a><a id=\"jfontsize-plus\" href=\"#\" title=\"Increase size\"><img src=\"images/btnPlus.jpg\" alt=\"Increase font size\" /></a> <div class=\"clear\">&nbsp;</div></div><h2>"+$("#span40").html()+"</h2><hr/></div>");
  
    $("#tempcontainer").append($("#main_content1").action);
 
  
    jQuery("#main_content1").expander({
        slicePoint: 560,
        preserveWords: true,
        window: 4,
        expandText: '',
        expandPrefix: ''
    });
  
    jQuery("#print-article").click(function(){
        $('#tempcontainer').printElement({
            printMode:'iframe',
            pageTitle:$('#span40').html(),
            overrideElementCSS:[
            {
                href:'css/print2.css',
                media:'print'
            }]
        })
        });


  
    // Reset Font Size
    var originalFontSize = $('#tempcontainer').css('font-size');
    $("#jfontsize-default").click(function(){
        $('#tempcontainer').css('font-size', originalFontSize);
    });
    // Increase Font Size
    $("#jfontsize-plus").click(function(){
        var currentFontSize = $('#tempcontainer').css('font-size');
        var currentFontSizeNum = parseFloat(currentFontSize, 10);
        var newFontSize = currentFontSizeNum*1.2;
        $('#tempcontainer').css('font-size', newFontSize);
        return false;
    });
    // Decrease Font Size
    $("#jfontsize-minus").click(function(){
        var currentFontSize = $('#tempcontainer').css('font-size');
        var currentFontSizeNum = parseFloat(currentFontSize, 10);
        var newFontSize = currentFontSizeNum*0.8;
        $('#tempcontainer').css('font-size', newFontSize);
        return false;
    });

  
    //jQuery(".read-more").html("");
    //$(".summary").append("<p style=\"float:right\"><a href=\"#tempcontainer\" class=\"fbox\">Read More..</a></p>");
    $(".summary").append("<p style=\"float:right\"><a href=\"#tempcontainer\" style=\"text-decoration:none\" class=\"read-more\">Read More...</a></p>");
    /*$(".fbox").fancybox({
                
        fitToView	: true,		
        autoSize	: false,
        closeClick	: false,
        openEffect	: 'none',
        closeEffect	: 'none'                
    });*/
        

  $(".read-more").click(function(){$("#main_content1").fancybox({
		maxWidth	: 800,
		maxHeight	: 600,
		width		: 540,
		height		: 285,
		fitToView	: false,		
		autoSize	: false,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none'
	});
         });
});