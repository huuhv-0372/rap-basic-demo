@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Root view for ZJH_BOOK table'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZI_BOOK
  as select from zjh_book
{
  key travel_id     as Travel_Id,
  key booking_id    as Booking_Id,
      booking_date  as Booking_Date,
      customer_id   as Customer_Id,
      carrier_id    as Carrier_Id,
      connection_id as Connection_Id,
      flight_date   as Flight_Date,
      @Semantics.amount.currencyCode : 'Currency_Code'
      flight_price  as Flight_Price,
      currency_code as Currency_Code
}
