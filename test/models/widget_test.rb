require "test_helper"

class WidgetTest < ActiveSupport::TestCase
  setup do
# XXX     widget_status = WidgetStatus.create!(name: "fresh")
# XXX     manufacturer = Manufacturer.create!(
# XXX       name: "Cyberdine Systems",
# XXX       address: Address.create!(
# XXX         street: "742 Evergreen Terrace",
# XXX         zip: "90210"
# XXX       )
# XXX     )
# XXX     @widget = Widget.create!(
# XXX         name: "Stembolt",
# XXX         manufacturer: manufacturer,
# XXX         widget_status: widget_status,
# XXX         price_cents: 10_00
# START:edit:17
    @widget = FactoryBot.create(
      :widget
# END:edit:3
      )
  end
  test "valid prices do not trigger the DB constraint" do
    assert_nothing_raised do
      @widget.update_column(
        :price_cents, 45_00
      )
    end
  end
  test "negative prices do trigger the DB constraint" do
    ex = assert_raises do
      @widget.update_column(
        :price_cents, -45_00
      )
    end
    assert_match(/price_must_be_positive/i,ex.message)
  end
  test "when the name an empty string, it's normalized to nil" do
    widget = Widget.new(name: "")
    widget.validate
    assert_nil widget.name
  end

  test "when name is just a lot of spaces, it's normalized to nil" do
    widget = Widget.new(name: "      ")
    widget.validate
    assert_nil widget.name
  end
end
