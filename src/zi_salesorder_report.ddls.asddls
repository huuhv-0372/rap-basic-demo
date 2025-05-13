@EndUserText.label: 'CDS for Custom query'
@ObjectModel.query.implementedBy:'ABAP:ZCL_SALESORDER_REPORT_QUERY'
@Metadata.allowExtensions: true

define custom entity ZI_SALESORDER_REPORT
{
  key salesorder      : abap.char(10);
      customername    : abap.char(40);
      totalamount     : abap.dec(15,2);
      currency        : abap.cuky(5);
      category        : abap.char(20);
      last_changed_at : timestampl;

}
