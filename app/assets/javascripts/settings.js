$(document).ready(function()
{
  $('#activate-username-edit').click(function(event)
  {
    $('.editUsername').toggle(250);
    $('.currentUsername').toggle(250);
    $('.editEmail').hide(250);
    $('.currentEmail').show(250);
    $('.editPassword').hide(250);
    $('.currentPassword').show(250);
    $('.editAvatar').hide(250);
    $('.currentAvatar').show(250);
    $('#usernameField').focus();
  });

  $('#activate-email-edit').click(function(event)
  {
    $('.editEmail').toggle(250);
    $('.currentEmail').toggle(250);
    $('.editUsername').hide(250);
    $('.currentUsername').show(250);
    $('.editPassword').hide(250);
    $('.currentPassword').show(250);
    $('.editAvatar').hide(250);
    $('.currentAvatar').show(250);
    $('#emailField').focus();
  });

  $('#activate-password-edit').click(function(event)
  {
    $('.editPassword').toggle(250);
    $('.currentPassword').toggle(250);
    $('.editUsername').hide(250);
    $('.currentUsername').show(250);
    $('.editEmail').hide(250);
    $('.currentEmail').show(250);
    $('.editAvatar').hide(250);
    $('.currentAvatar').show(250);
    $('#passwordField').focus();
  });

  $('#activate-avatar-edit').click(function(event)
  {
    $('.editAvatar').toggle(250);
    $('.currentAvatar').toggle(250);
    $('.editPassword').hide(250);
    $('.currentPassword').show(250);
    $('.editUsername').hide(250);
    $('.currentUsername').show(250);
    $('.editEmail').hide(250);
    $('.currentEmail').show(250);
  });


  $('html').click(function() 
  {
    $('.editUsername').hide(250);
    $('.editEmail').hide(250); 
    $('.editPassword').hide(250);
    $('.currentPassword').show(250);
    $('.currentUsername').show(250);
    $('.currentEmail').show(250);
    $('.editAvatar').hide(250);
    $('.currentAvatar').show(250);
  });

  $('.account-username').click(function(event)
  {
     event.stopPropagation();
  });

  $('.account-email').click(function(event)
  {
     event.stopPropagation();
  });

  $('.account-password').click(function(event)
  {
     event.stopPropagation();
  });

  $('.account-avatar').click(function(event)
  {
     event.stopPropagation();
  });

});
