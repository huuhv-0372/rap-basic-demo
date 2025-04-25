@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Custom entity of ZJH_SALEORDER'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZI_UNMANAGED_SALESORDER
  as select from zjh_saleorder
{
  key sales_order as Sales_Order,
  customer_name as Customer_Name,
  total_amount as Total_Amount,
  currency as Currency,
  last_changed_at as Last_Changed_At
}
