// All JS required for enquiries controller
$(document).on('turbolinks:load', function() {

  // Set project start amount
  $projectStarValue = 300;

  // Set up form Validation
  $constraints = {
    'enquiry[name]': {
      // Name is required
      presence: { message: validate.format("^Name has to be filled out") },
    },
    'enquiry[email]': {
      // Email is required
      presence: { message: validate.format("^Email has to be filled out") },
      // and must be an email
      email: { message: validate.format("^Email is not the right format") },
    },
    'enquiry[message_type]': {
      // Message type is required
      presence: { message: validate.format("^Please choose an option") },
    },
    'enquiry[message]': function(value, attributes, attributeName, options, constraints) {
      // If Message type is message, message is required
      if (attributes['enquiry[message_type]'] != 'message') return null;
      return {
        presence: { message: validate.format("^Message has to be filled out") },
      };
    },
    'enquiry[project_budget]': function(value, attributes, attributeName, options, constraints) {
      // If Message type is project, budget is required
      if (attributes['enquiry[message_type]'] != 'project') return null;
      return {
        presence: { message: validate.format("^Please choose a budget") },
      };
    },
    'enquiry[project_description]': function(value, attributes, attributeName, options, constraints) {
      // If Message type is project, project description is required
      if (attributes['enquiry[message_type]'] != 'project') return null;
      return {
        presence: { message: validate.format("^Project Description has to be filled out") },
      };
    }
  };

  // Hook up the inputs to validate on the fly
  $('form').on('change', '.form-control', function() {
    $errors = validate($('.new_enquiry'), $constraints) || {};
    showErrorsForInput(this, $errors[this.name]);
  });

  // Show errors on form
  function showErrors(form, errors) {
    form.find('.form-control').each(function() {
      showErrorsForInput($(this), errors && errors[$(this).attr('name')]);
    });
  }

  // Show errors on input
  function showErrorsForInput(input, errors) {

    // Remove old messages
    $(input).closest('div').find('.error').remove();

    if (errors) {

      // add error class to parent if there are errors
      $(input).closest('div').addClass('has-error');

      // then we append all the errors
      $.each(errors, function(index, value) {
        $(input).closest('div').append('<span class="error">' + value + '</span>');
      });
    } else {

      // remove error class if there are no errors
      $(input).closest('div').removeClass('has-error');
    }
  }
  
  // On message type select change
  $('form').on('change', '.message-type', function() {

    // Hide all the message blocks
    $('.message-block').hide();

    // Reset all content within those message blocks
    $('.message-block input, .message-block textarea').val('');

    // Show the correct message block depending on message type chosen
    if ($(this).val()) {
      $('.message-block#' + $(this).val()).show();
      // Set default value if project view
      if ($(this).val() == 'project') {
        $('#enquiry_project_budget').val($projectStarValue);
      }
    }
  });

  // On new enquiry form submit
  $('body').on('submit', '.new_enquiry', function(e) {

    // Prevent form submit
    e.preventDefault();

    // Run validations
    $errors = validate($(this), $constraints);
    showErrors($(this), $errors || {});

    // If no errors, continue
    if (!$errors) {

      // Show spinner and disable button whilst request is made
      $('.new_enquiry .spinner').show();
      $(this).find('input[type="submit"]').prop('disabled', true);

      // Post to /enquiries.json with form data
      $.post({
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: $(this).attr('action'),
        data: $(this).serializeArray()
      })
      .done(function() {

        // Enquiry is sent - show thank you
        $('.form-content').fadeOut();
        $('.form-thank-you').fadeIn();
      })
      .fail(function(res) {

        // Show error messages
        $.each(res.responseJSON, function(name, errors) {
          showErrorsForInput($('[name="enquiry[' + name + ']"]'), errors);
        });
      })
      .always(function() {

        // Hide spinner as request is finished
        $('.new_enquiry .spinner').hide();
      });
    } else {
      
      // Stop the form from being submitted
      return false;
    }
  });

  // Project Range Slider
  $budgetRange = document.getElementById('budget-range');
  noUiSlider.create($budgetRange, {
    start: [$projectStarValue],
    connect: [true, false],
    step: 100,
    range: {
      'min': [ 0 ],
      '10%': [ 500, 500 ],
      '50%': [ 4000, 1000 ],
      'max': [ 10000 ]
    }
  });

  // On slide update the text field
  $budgetRange.noUiSlider.on('update', function( values, handle ) {
    $('#enquiry_project_budget').val(parseInt(values[handle]));
  });
  
});