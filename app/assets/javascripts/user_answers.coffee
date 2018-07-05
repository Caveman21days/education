$ ->
  $('.edit-user-answer-link').click (e) ->
    e.preventDefault();
    $(this).hide();
    user_answer_id = $(this).data('userAnswerId')
    $('form#edit-user-answer-' + user_answer_id).show();