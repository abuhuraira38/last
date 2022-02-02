class FinanceMailer < ApplicationMailer
# START:edit:3
  helper :application
# END:edit:3
  def high_priced_widget(widget)
    @widget = widget
    mail to: "finance@example.com"
  end
end
