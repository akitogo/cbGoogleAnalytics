component extends="coldbox.system.Interceptor"{

    // DI
    property name="settingService"  inject="id:settingService@cb";

    /**
    * Configure
    */
    function configure(){}

    /**
     * add to head
     */
	public void function cbui_beforeHeadEnd(event, interceptData) {
		// we don't track preview events
		if(reFindNoCase( "contentbox-ui:.*preview", event.getCurrentEvent() )){
			appendToBuffer( "<!-- No Google Analytics For Preview -->" );	
			return;			
		}
		
		// No Google Analytics For Admin Users				
		// the interceptor is called with prc in arguments	
		if(	prc.oCurrentAuthor.isLoggedIn() 
			and prc.oCurrentAuthor.checkPermission( "CONTENTBOX_ADMIN,PAGES_ADMIN,PAGES_EDITOR,ENTRIES_ADMIN,ENTRIES_EDITOR" )
		) {
			appendToBuffer( "<!-- No Google Analytics For Admin Users -->" );	
			return;			
		}
		
		
		
		var toBuffer = '';
		
		// settings
		var settingStruct = settingService.getSetting( "cb_GoogleAnalytics","" );
		
		// if settings not valid return
		if(!isJson(settingStruct))
			return;
			
		var ga=deserializeJson(settingStruct);
			
		// if tracking id is empty makes no sense to proceed
		if(trim(ga.trackingId) eq '') 
			return;
			
		savecontent variable="toBuffer" {
				writeOutput("<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
  ga('create', '#ga.trackingId#', 'auto');");
  if(ga.DisplayFeatures) writeOutput(" ga('require', 'displayfeatures'); ");
  if(ga.EnhancedLinkAttribution) writeOutput(" ga('require', 'linkid'); ");
  if(ga.Ecommerce eq "ecommerce") writeOutput(" ga('require', 'ecommerce'); ");
  if(ga.Ecommerce eq "enhancedecommerce") writeOutput(" ga('require', 'ec'); ");
  if(ga.scrollDepth) writeOutput(" var config = { action : 'Pageview End', beacon : true, category : 'Page', debug : false,  delay : true, labelNoScroll : 'Did Not Scroll',
  labelScroll : 'Did Scroll', sampleRate : 100, scrollThreshold : 10, setPage : true, timeout : 300, timeThreshold : 15, metric : null, maxTimeOnPage : 30
  ga('require', 'scrollDepthTracker', '#event.getModuleRoot('cbGoogleAnalytics')#/includes/js/scroll-depth-tracker.js', config); ");
  writeOutput(" ga('send', 'pageview');");
  writeOutput(" </script> ");
  }//end savecontent
   		appendToBuffer( toBuffer );		
	}
}
