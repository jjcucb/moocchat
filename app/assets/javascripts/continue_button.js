var ContinueButton =  {
  //  bind a handler that will be called on form submission for rendered
  //  templates - but not for non-template (ie admin) page views.
  //  An admin page view is identified by the css class 'admin' on <body>.
  ajaxSubmit: function(event) {
    $('#interstitial').show();
    var submit_url = $(this).data('log-url');
    $.ajax({
      type: 'POST',
      url: submit_url,
      data: { name: 'continue' },
      error: ContinueButton.loggingError,
      success: ContinueButton.serverNotified
    });
    $('body').off('submit', 'form');
    event.preventDefault();
  },
  serverNotified: function() {
    $('body').addClass('serverNotified');
  },
  loggingError: function(xhrObject, textStatus, errorThrown) {
    alert(textStatus + " error on " + submit_url + ": " + errorThrown);
  },
  setup: function() {
    if ($('body').hasClass('admin')) {
      return;
    }
    $('#interstitial').hide();
    $('body').on('submit', 'form', ContinueButton.ajaxSubmit);
  }
};

$(ContinueButton.setup);
