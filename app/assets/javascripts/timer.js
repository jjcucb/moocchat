var Timer = {
  seconds: 0,
  selectorToUpdate: '#_timer_',
  submitUrl: '',                // only if no form on this page
  nextTimeout: null,
  updateDisplay: function() {
    var min = Math.floor(this.seconds/60).toString();
    var sec = (this.seconds % 60).toString();
    var displayTime = (min<10 ? '0': '') + min + ':' + (sec<10 ? '0' : '') + sec;
    $(this.selectorToUpdate).text(displayTime);
  },
  initialize: function(seconds, submitUrl) {
    this.seconds = seconds;
    this.updateDisplay();
    this.countdown();
  },
  countdown: function() {
    this.nextTimeout = setTimeout('Timer.decrement()', 1000);
  },
  submitForm: function() {
    clearTimeout(this.nextTimeout);
    // if there's a form with a submit button, submit it
    if ($('form:first').length > 0) {
      $('form:first').submit();
    } else {                    // look for link with ID='submit' instead
      window.location.href = this.submitUrl;
    }
  },
  decrement: function() {
    this.seconds -= 1;
    this.updateDisplay();
    if (this.seconds > 0) {
      this.countdown();
    } else {
      this.submitForm();
    }
  },
  setup: function() {
    var t = $('#_timer_');
    if (t.length > 0) { // the page has a timer on it
      Timer.initialize(t.data('countfrom'), t.data('submit'));
    }
  },
};
$(Timer.setup);
