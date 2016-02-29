
			$(document).ready(function() {
				oTable = $('#example').dataTable({
                                    "bJQueryUI": true,
                                        "iDisplayLength": 10,
					
					"sPaginationType": "full_numbers",
					"aLengthMenu": [[200,100,50,20,10,5,4,3,2], [200,100,50,20,10,5,4,3,2]]
				});
			} );
/*			$(document).ready(function() {
  $('dl.expander dd:eq(0)').expander();

  $('dl.expander dd:gt(0)').expander({
    collapseTimer: 4000,
    beforeExpand: function() {
      $(this).parent().parent().append('<div class="success">before expand.</div>');
    },
    afterExpand: function() {
      $(this).parent().parent().append('<div class="success">after expand.</div>');
    },
    onCollapse: function(byUser) {
      var by = byUser ? 'user' : 'timer';
      $(this).parent().parent().append('<div class="success">on collapse (' + by + ').</div>');
    }
  });
});*/
