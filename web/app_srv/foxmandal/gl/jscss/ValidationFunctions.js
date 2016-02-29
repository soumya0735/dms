(function(){
	/**
	 * To Escape the Regular Expressions for normal user supplied special characters
	 */
	RegExp.quote = function( str ){
		return (str+'').replace(/([.?^*+$[\]\\(){}|-])/g,"\\$1");
	}

	/**
	 * equals		: Compares value with some other field
	 * USAGE			: equals[\"#otherField\"] (Argument is ID of field to compare)
	 * Precaution	: The string passed must be escaped.
	 */
	$.extend($.fn.validatebox.defaults.rules, {  
	   equals: {  
			validator: function(value,param){  
			   return value === $(param[0]).val();  
			},  
	      message: 'Both passwords do not match.'  
	   }  
	});

	/**
	 * Alpha		: Validates Alphabets
	 * USAGE		: Alpha
	 */
	$.extend($.fn.validatebox.defaults.rules, {  
	   Alpha: {
	      validator: function(value){
	      	value = $.trim(value);
	        	var r = /^[A-Z ]+$/i;
            return value.match(r);
        	},  
	      message: 'Alphabets only.'
	   }  
	});

	/**
	 * CheckZero	: Validates that fields do not have all zeroes
	 * USAGE			: CheckZero[\" arg \"] (arg can be int/float)
	 *	INFO			: The messages are based on arg i.e. int or float
	 * Precaution	: The string passed must be escaped.
	 */
	$.extend($.fn.validatebox.defaults.rules, {  
	   CheckZero: {
	      validator: function(value,param){
	      	value = $.trim(value);
	      	if(param[0].toLowerCase() === 'float'){
	      		param[1] = 'Cannot start with Zero';
	      		return (parseFloat(value) !== 0);
	      	} else {	
	      		param[1] = 'Cannot be Zero';
	      		return (parseInt(value) !== 0);
	      	}
        	},  
	      message: '{1}'
	   }  
	});

	/**
	 * Numeric		: Validates Numbers
	 * USAGE			: Numeric
	 */
	$.extend($.fn.validatebox.defaults.rules, {  
	   Numeric: {
	      validator: function(value){
	      	value = $.trim(value);
	        	var r = /^[0-9]+$/i;
            return value.match(r);
        	},  
	      message: 'Numbers only.'
	   }  
	});

	/**
	 * Decimal		: Validates Decimal Nos
	 * USAGE			: Decimal[ len,len ] i.e (3,4 => 123.1234)
	 */
	$.extend($.fn.validatebox.defaults.rules, {  
	   Decimal: {
	      validator: function(value,param){
	      	value = $.trim(value);

	      	var numbersOnly = /^[0-9\.]+$/;

	      	if(numbersOnly.test(value)){
	      		var period = value.indexOf('.');

		      	//Check if more periods exist
		      	if(value.indexOf('.',period+1) > -1){
		      		param[2] = 'Invalid Decimal Number.';
		      		return false;
		      	}

		      	if(period > 0){
		      		beforePeriod = value.substr(0,period);
		      		afterPeriod = value.substr(period+1);
		      		if(beforePeriod.length > param[0]) {
		      			param[2] = 'Only '+ param[0] +' digits before period.';
		      			return false;
		      		} else if(afterPeriod.length > param[1]) {
		      			param[2] = 'Only '+ param[1] +' digits after period.';
		      			return false;
		      		} else {
		      			return true;
		      		}
		      	} else if( period === 0) {
		      		param[2] = 'Value needed before period.';
		      		return false;
		      	} else if( period === -1 ){
		      		if(value.length > param[0]){
		      			param[2] = 'Only ' + param[0] + ' digits only.';
		      			return false;
		      		} else {
		      			return true;
		      		}
		      	} else {
		      		return true;
		      	}
	      	} else {
	      		param[2] = 'Invalid Decimal Number.';
	      		return false;
	      	}
        	},  
	      message: '{2}'
	   }  
	});

	/**
	 * AlphaWithApos	: Validates Alphabets and Apostrophe [a-zA-Z' ]
	 * USAGE				: AlphaWithApos
	 */
	$.extend($.fn.validatebox.defaults.rules, {  
	   AlphaWithApos: {
	      validator: function(value){
	      	value = $.trim(value);
	        	var r = /^[A-Z' ]+$/i;
            return value.match(r);
        	},  
	      message: 'Alphabets &amp; Apostrophe only.'
	   }  
	});

	/**
	 * AlphaNumeric	: Validates Alphabets and Numbers [a-zA-Z0-9 ]
	 * USAGE				: AlphaNumeric
	 */
	$.extend($.fn.validatebox.defaults.rules, {  
	   AlphaNumeric: {
	      validator: function(value){
	      	value = $.trim(value);
	        	var r = /^[A-Z0-9 ]+$/i;
            return value.match(r);
        	},  
	      message: 'Alphabets &amp; Numbers only.'
	   }  
	});

	/**
	 * AlphaNumericWithApos	: Validates Alphabets,Numbers and Apostrophe [a-zA-Z0-9' ]
	 * USAGE						: AlphaNumericWithApos
	 */
	$.extend($.fn.validatebox.defaults.rules, {  
	   AlphaNumericWithApos: {
	      validator: function(value){
	      	value = $.trim(value);
	        	var r = /^[A-Z0-9' ]+$/i;
            return value.match(r);
        	},  
	      message: 'Alphabets, Numbers &amp; Apostrophe only.'
	   }  
	});

	/**
	 * AlphaSpecial	: Validates Alphabets and Characters Passed as a String
	 * USAGE				: AlphaSpecial[\"string\"]
	 * Precaution		: The string passed must be escaped.
	 */
	$.extend($.fn.validatebox.defaults.rules, {  
	   AlphaSpecial: {
	      validator: function(value, param){
	      	value = $.trim(value);
	        	var t = "^[A-Z" + RegExp.quote(param[0]) + " ]+$";
	        	var z = new RegExp(t,'i');
	        	param[1] = param[0].replace(/(.)/g,', $1').substr(1);
            return value.match(z);
        	},  
	      message: 'Alphabets &amp; {1} only.'
	   }  
	});

	/**
	 * minLength		: Validates minimum no of characters 
	 * USAGE				: minLength[ length ]
	 */
	$.extend($.fn.validatebox.defaults.rules, {  
	   minLength: {
			validator: function(value,param){
				return value.length >= param[0];  
			},  
			message: 'Enter at Least {0} characters.'
	   }  
	});

	/**
	 * maxLength		: Validates Maximum no of characters 
	 * USAGE				: maxLength[ length ]
	 */
	$.extend($.fn.validatebox.defaults.rules, {  
	   maxLength: {
			validator: function(value,param){
				return value.length <= param[0];  
			},  
			message: 'Enter at Most {0} characters.'
	   }  
	});

	/**
	 * Mobile	: Validates Mobile nos [ (+919911223344) OR (9911223344) ]
	 * USAGE		: Mobile
	 */
	$.extend($.fn.validatebox.defaults.rules, {  
	   Mobile: {
	      validator: function(value){
	      	value = $.trim(value);
	        	var r = /^(\+[1-9]{2})?[0-9]{10}$/;
            return value.match(r);
        	},  
	      message: 'Invalid Mobile Number.'
	   }  
	});
        
        /**
	 * AlphaNumericWithdot	: Validates Alphabets,Numbers and dot [a-zA-Z0-9. ]
	 * USAGE						: AlphaNumericWithApos
	 */
	$.extend($.fn.validatebox.defaults.rules, {  
	   AlphaNumericWithdot: {
	      validator: function(value){
	      	value = $.trim(value);
	        	var r = /^[A-Z0-9\.]+$/i;
            return value.match(r);
        	},  
	      message: 'Alphabets, Numbers &amp; dot only.'
	   }  
	});
        
        $.extend($.fn.validatebox.defaults.rules, {  
	   dateType: {
	      validator: function(value){
	      	value = $.trim(value);
	        	var r = /^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.](19|20)[0-9]{2})$/;
            return value.match(r);
        	},  
	      message: 'DD/MM/YYYY format only'
	   }  
	});
        
        /*
validation code for checking pdf file uploaded only
*/
$.extend($.fn.validatebox.defaults.rules, {  
	   uploadpdfonly: {
		
	      validator: function(value){
		
                if(value.indexOf('pdf')=="-1" && value.indexOf('PDF')=="-1")
	         return false;
		else
			return true;
	      },  
	     message: 'Upload PDF only'
	   }  
	});
        $.extend($.fn.validatebox.defaults.rules, {  
	   uploadjpgonly: {
		
	      validator: function(value){
		
		if(value.indexOf('jpg')=="-1" && value.indexOf('jpeg')=="-1" && value.indexOf('JPG')=="-1" && value.indexOf('JPEG')=="-1")
	         return false;
		else
			return true;
	      },  
	     message: 'Upload Jpg Only'
	   }  
	});
        
          // allows alphabets and special characters only (a-zA-Z._-+)
	$.extend($.fn.validatebox.defaults.rules, {  
	   alphaspecial: {
	      validator: function(value){
	        	var r = /^[0-9A-Z\,\.\;\s\&\-_!~`’@$%^&*()+=\[\]{}:";'<>?\/]+$/i;
	         return value.match(r);
	      },  
	      message: 'Alphanumeric and Special Characters only'
	   }  
	});

  // allows alphabets and special characters only (a-zA-Z._-+)
	$.extend($.fn.validatebox.defaults.rules, {  
	   alphaNumericCommaDotApos: {
	      validator: function(value){
	        	var r = /^[0-9A-Z\,\.\s\&\-_’'<>?\/]+$/i;
	         return value.match(r);
	      },  
	      message: 'Alphanumeric Comma Dot and Apostrophe only'
	   }  
	});
  
  //Email
  // allows alphabets and special characters only (a-zA-Z._-+)
	$.extend($.fn.validatebox.defaults.rules, {  
	   email: {
	      validator: function(value){
	        	var r = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9])+$/i;
	         return value.match(r);
	      },  
	      message: 'Invalid E-Mail Id'
	   }  
	});


}());