class BookingsController < ApplicationController
  before_action :authenticate_user!
  def new
    @property = Property.find(params[:property_id])
    @checkin_date = Date.parse(params[:checkin_date])
    @checkout_date = Date.parse(params[:checkout_date])

    @total_nights = numberOfNights
    @base_fare = @property.price * @total_nights
    @service_fee = @base_fare * 0.18
    @total_amount = @base_fare + @service_fee
  end

  def success
    Reservation.create!(
      user_id: current_user.id,
      property_id: params[:property_id],
      checkin_date: params[:checkin_date],
      checkout_date: params[:checkout_date]
    )

    redirect_to root_path
  end

  private

  def numberOfNights
    checkin_date = Date.parse(params[:checkin_date])
    checkout_date = Date.parse(params[:checkout_date])
    (checkout_date - checkin_date).to_i
  end

  def booking_params
    params.permit(:checkin_date, :checkout_date)
  end
end
