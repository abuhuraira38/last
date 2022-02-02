class UserShippingEstimate
  include ActiveModel::Model
  attr_accessor :widget_name,
                :widget_user_facing_id,
                :shipping_zone,
                :destination_post_code
# START:edit:3

  def persisted?
    true
  end

  def to_key
    [ self.widget_user_facing_id,
      self.destination_post_code ]
  end
# END:edit:3
end
