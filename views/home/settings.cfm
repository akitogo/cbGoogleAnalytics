<cfoutput>
<div class="row">
    <div class="col-md-12">
        <h1 class="h1"><i class="fa fa-flask fa-lg"></i> Google Analytics</h1>
    </div>
</div>
#html.startForm(
    name="commentSettingsForm", 
    action=prc.xehSave, 
    class="form-vertical"
)#	
<div class="row">
	<div class="col-md-12">

		<div class="panel panel-default">
		    <div class="panel-body">
				<div class="form-group">
	            #html.textField(
	                name="trackingId",
	                label="Tracking Id",
	                value=rc.trackingId,
	                class="form-control",
	                size="60",
	                wrapper="div class=controls",
	                labelClass="control-label",
	                groupWrapper="div class=form-group"
	           	)#
				</div>
				<!--- Anonymize Ip Address 														--->
       			 <div class="form-group">   
       			 	<label class="control-label" for="anonymizeIp">Anonymize Ip Address:</label>
       			 	<br />
       			 	<small>To anonymize the IP address of an individual hit, tick checkbox</small>
       			 	<br />
       			 	<div class="controls">
			 		#html.checkbox(
							name    = "anonymizeIp",
							label   = "Enable:&nbsp;",
							checked	= rc.anonymizeIp
						)#       
       			 	</div>    	
				</div>
				<!--- Display Features 															--->
       			 <div class="form-group">   
       			 	<label class="control-label" for="DisplayFeatures">Display Features:</label>
       			 	<br />
       			 	<small>The display features plugin for analytics.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting.</small>
       			 	<br />
       			 	<div class="controls">
			 		#html.checkbox(
							name    = "DisplayFeatures",
							label   = "Enable:&nbsp;",
							checked	= rc.DisplayFeatures
						)#       
       			 	</div>    	
				</div>
				<!--- Enhanced Link Attribution 												--->
       			 <div class="form-group">   
       			 	<label class="control-label" for="EnhancedLinkAttribution">Enhanced Link Attribution:</label>
       			 	<br />
       			 	<small>Enhanced Link Attribution improves the accuracy of your In-Page Analytics report by automatically differentiating between multiple links to the same URL on a single page by using link element IDs.</small>
       			 	<br />
       			 	<div class="controls">
			 		#html.checkbox(
							name    = "EnhancedLinkAttribution",
							label   = "Enable:&nbsp;",
							checked	= rc.EnhancedLinkAttribution
						)#       
       			 	</div>    	
				</div>
				<!--- Enhanced Link Attribution 												--->
       			 <div class="form-group">   
       			 	<label class="control-label" for="Ecommerce">Ecommerce:</label>
       			 	<br />
       			 	<small>Ecommerce tracking allows you to measure the number of transactions and revenue that your website generates.</small>
       			 	<br />
       			 	<div class="controls">
		                #html.radioButton(
		                    name="Ecommerce",
		                    checked=(rc.Ecommerce eq 'off'),
		                    value='off'
		                )# Off
		                #html.radioButton(
		                    name="Ecommerce",
		                    checked=(rc.Ecommerce eq 'ecommerce'),
		                    value='ecommerce'
		                )# Ecommerce 
		                
		                #html.radioButton(
		                    name="Ecommerce",
		                    checked=(rc.Ecommerce eq 'enhancedecommerce'),
		                    value='enhancedecommerce'
		                )# Enhanced Ecommerce 		                
       			 	</div>    	
				</div>				
	            <div class="form-actions">
	                #html.button(type="submit", value="Save Settings", class="btn btn-danger" )#
	            </div>  
 	         	
			</div>
		</div>

	</div>
</div>
#html.endForm()#        
</cfoutput>


