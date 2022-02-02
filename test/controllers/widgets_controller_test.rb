require "test_helper"

class WidgetsControllerTest < ActionDispatch::IntegrationTest
  test "converts dollars to cents when creating widgets" do
    manufacturer = FactoryBot.create(:manufacturer)
    FactoryBot.create(:widget_status, name: "Fresh")
    post widgets_url, params: {
      widget: {
        name: "New Widget",
        price_cents: "123.45",
        manufacturer_id: manufacturer.id.to_s,
      }
    }

    widget = Widget.last
# XXX     refute_nil widget
# XXX     assert_redirected_to widget_path(widget)
# START:edit:6
    confidence_check do
      refute_nil widget
      assert_redirected_to widget_path(widget)
    end
# END:edit:3
    assert_equal 12345, widget.price_cents
  end
end
