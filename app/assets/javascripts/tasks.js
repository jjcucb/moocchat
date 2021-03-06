var FormChecker = {
  checkForm: function() {
    var incomplete = $('form :input').filter(function() {
      return $(this).val() == '';
    });
    //if incomplete contains any elements, the form has not been filled 
    if(incomplete.length) {
      alert('please fill out all the form');
      //to prevent submission of the form
      return false;
    }
  },
  setup: function() {
    $('.form-warning').submit(FormChecker.checkForm);
  },    
};
$(FormChecker.setup);
