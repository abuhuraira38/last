namespace :one_off do
  desc "Fixes the widgets created before the switch to 0.95 validation"
  task fix_widget_pricing: :environment do
# START:edit:3
    OneOff::WidgetPricing.new.change_to_95_cents
# END:edit:3
  end
end
