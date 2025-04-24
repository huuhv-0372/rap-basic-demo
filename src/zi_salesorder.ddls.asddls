@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Custom entity of ZJH_SALEORDER'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZI_SALESORDER as select from zjh_saleorder
{
  key sales_order as SalesOrder,
  customer_name as CustomerName,
  total_amount as TotalAmount,
  currency as Currency,
  last_changed_at as LastChangedAt
}
