component {

	this.title 				= "cbGoogleAnalytics";
	this.author 			= "Aktigo Internet and Media Applications GmbH";
	this.webURL 			= "http://www.akitogo.com";
	this.description 		= "Implements Google Analytics for Contentbox 3.7 and up";
	this.version			= "1.2";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "cbGoogleAnalytics";
	// Model Namespace
	this.modelNamespace		= "cbGoogleAnalytics";
	// CF Mapping
	this.cfmapping			= "cbGoogleAnalytics";
	// Auto-map models
	this.autoMapModels		= true;
	// Module Dependencies
	this.dependencies 		= [];

	function configure(){

		// parent settings
		parentSettings = {

		};

		// module settings - stored in modules.name.settings
		settings = {

		};

		// Layout Settings
		layoutSettings = {
			defaultLayout = ""
		};

		// datasources
		datasources = {

		};

		// SES Routes
		routes = [
			// Module Entry Point
			{ pattern="/", handler="home", action="index" },
			// Convention Route
			{ pattern="/:handler/:action?" }
		];

		// Custom Declared Points
		interceptorSettings = {
			customInterceptionPoints = ""
		};

		// Custom Declared Interceptors
		interceptors = [
			{ class="#moduleMapping#.interceptors.GoogleAnalytics", name="ga@cbGoogleAnalytics" }
		];

		// Binder Mappings
		// binder.map("Alias").to("#moduleMapping#.model.MyService");

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		// Let's add ourselves to the main menu in the Modules section
		var menuService = controller.getWireBox().getInstance( "AdminMenuService@cb" );
		// Add Menu Contribution
		menuService.addSubMenu(topMenu=menuService.MODULES,name="cbGoogleAnalytics",label="Google Analytics",href="#menuService.buildModuleLink('cbGoogleAnalytics','home.settings')#" );
	}

	/**
	* Fired when the module is activated by ContentBox
	*/
	function onActivate(){

	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
		// Let's remove ourselves to the main menu in the Modules section
		var menuService = controller.getWireBox().getInstance( "AdminMenuService@cb" );
		// Remove Menu Contribution
		menuService.removeSubMenu(topMenu=menuService.MODULES,name="cbGoogleAnalytics" );
	}

}