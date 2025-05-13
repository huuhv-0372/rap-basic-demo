//@EndUserText.label: 'CDS for Unmanaged query'
////@ObjectModel.query.implementedBy:'ABAP:ZCL_UN_SALESORDER_QUERY'
//@Metadata.allowExtensions: true
//
//define root entity ZI_UN_SALESORDER
//  as select from zjh_usalesorder
//{
////  key salesorder     : abap.char(10);
////      customername   : abap.char(40);
////      totalamount    : abap.dec(15,2);
////      currency       : abap.cuky(5);
////      status         : abap.char(20);
////      last_changed_at: timestampl;
//}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS for Unmanaged query'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZI_UN_SALESORDER
  as select from zjh_usalesorder
{
  key salesorder,
  customername,
  totalamount,
  currency,
  status,
  last_changed_at
}
