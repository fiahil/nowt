module DeviseHelper
  def devise_error_messages!
    flash_alerts = []
    error_key = 'errors.messages.not_saved'

    if !flash.empty?
        flash_alerts.push(flash[:error]) if flash[:error]
        flash_alerts.push(flash[:alert]) if flash[:alert]
        error_key = 'devise.failure.invalid'
    end

    return '' if resource.errors.empty? && flash_alerts.empty?
    errors = resource.errors.empty? ? flash_alerts : resource.errors.full_messages

    messages = errors.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div class="alert alert-danger alert-dismmissable form-errors">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      <strong>Whoops! Something wrong happened!</strong>
      <ul>
        #{messages}
      </ul>
    </div>
    HTML

    html.html_safe
  end

  def devise_success_messages!
    flash_alerts = []
    error_key = 'errors.messages.not_saved'

    if !flash.empty?
        flash_alerts.push(flash[:success]) if flash[:success]
        flash_alerts.push(flash[:notice]) if flash[:notice]
        error_key = 'devise.failure.invalid'
    end

    return '' if resource.errors.empty? && flash_alerts.empty?
    errors = resource.errors.empty? ? flash_alerts : resource.errors.full_messages

    messages = errors.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div class="alert alert-success alert-dismmissable form-errors" style="margin-bottom: 20px">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      <strong>Successful!</strong>
      <ul>
        #{messages}
      </ul>
    </div>
    HTML

    html.html_safe
  end
end