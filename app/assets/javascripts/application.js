// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery3
//= require bootstrap-sprockets
//= require popper
//= require jquery-ujs
//= require rails-ujs
//= require toastr
//= require activestorage
//= require turbolinks
//= require_tree .

import '@fortawesome/fontawesome-free/js/all';

app.use(helmet({
    contentSecurityPolicy:{
      directives:{
        "default-src":["'self'"],
        "script-src":["https://code.jquery.com/jquery-3.5.1.slim.min.js","'sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj'","https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js","'sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV'"],
        "style-src": ["'self'","https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css","'unsafe-inline'"],
        "object-src":["'none'"],
  
  
      },
    }
  }
  ));
