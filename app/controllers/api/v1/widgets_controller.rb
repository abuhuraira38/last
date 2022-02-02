# START:edit:3
class Api::V1::WidgetsController < ApiController
# END:edit:3
  def show
    widget = Widget.find(params[:id])
    render json: { widget: widget }
  end
end
