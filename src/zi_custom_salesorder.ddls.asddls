@EndUserText.label: 'Custom Sales Order Query'
@ObjectModel.query.implementedBy:'ABAP:ZCL_SALESORDER_QUERY' 

define custom entity ZI_CUSTOM_SALESORDER {
  key sales_order     : abap.char(10);
      customer_name   : abap.char(40);
      total_amount    : abap.dec(15,2);
      currency        : abap.cuky(5);
      last_changed_at : timestampl;
}
