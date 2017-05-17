/**
* The handler is just used for admin
* ---
*/
component{

	// DI
	property name="settingService" 	inject="settingService@cb";
	property name="cb" 				inject="cbHelper@cb";

	function settings( event, rc, prc ){
		prc.xehSave = cb.buildModuleLink( "cbGoogleAnalytics", "home.saveSettings" );

		event.paramValue( "trackingId", "" );
		event.paramValue( "anonymizeIp", false );
		event.paramValue( "DisplayFeatures", false );
		event.paramValue( "EnhancedLinkAttribution", false );
		event.paramValue( "Ecommerce", "off" );
		
		var args 	= { name="cb_GoogleAnalytics" };
		var allsettings = settingService.findWhere( criteria=args );

		if(!isNull(allsettings)){
			var pairs=deserializeJSON(allsettings.getValue());
			for( var key in pairs ){
				event.setValue(key,pairs[key] );
			}
		}
		// view
		event.setView( "home/settings" );
	}

	function saveSettings( event, rc, prc ){
		// Get settings
		prc.settings = {trackingId=''
			,anonymizeIp=false
			,DisplayFeatures=false
			,EnhancedLinkAttribution=false
			,Ecommerce='off'
			};

		// iterate over settings
		for( var key in prc.settings ){
			// save only sent in setting keys
			if( structKeyExists( rc, key ) ){
				prc.settings[ key ] = rc[ key ];
			}
		}
		// Save settings
		var args 	= { name="cb_GoogleAnalytics" };
		var setting = settingService.findWhere( criteria=args );
		if( isNull( setting ) ){
			setting = settingService.new( properties=args );
		}
		
		setting.setValue( serializeJSON( prc.settings ) );
		settingService.save( setting );
		settingService.flushSettingsCache();
		
		// Messagebox
		getModel( "messagebox@cbMessagebox" ).info( "Settings Saved & Updated!" );
		// Relocate via CB Helper
		cb.setNextModuleEvent( "cbGoogleAnalytics", "home.settings" );
	}

}