CLASS zcl_salesorder_query DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
ENDCLASS.

CLASS zcl_salesorder_query IMPLEMENTATION.

  METHOD if_rap_query_provider~select.
    DATA: lt_result TYPE TABLE OF zi_custom_salesorder.

    " Get parameter Query from request
    DATA(lv_sql_filter) = io_request->get_filter( )->get_as_sql_string( ).

*    DATA(lv_search_string) = io_request->get_search_expression( ).
*    DATA(lv_search_sql) = |customer_name LIKE '%{ cl_abap_dyn_prg=>escape_quotes( lv_search_string ) }%'|.
*
*    IF lv_sql_filter IS INITIAL.
*      lv_sql_filter = lv_search_sql.
*    ELSE.
*      lv_sql_filter = |( { lv_sql_filter } AND { lv_search_sql } )|.
*    ENDIF.

    DATA(lt_sort)    = io_request->get_sort_elements( ).
    DATA(lt_sort_criteria) = VALUE string_table( FOR ls_sort IN lt_sort
                                               ( ls_sort-element_name && COND #( WHEN ls_sort-descending = abap_true
                                                                                      THEN ` descending`
                                                                                      ELSE ` ascending` ) ) ).
    DATA(lv_sort_string)  = COND #( WHEN lt_sort_criteria IS INITIAL THEN `sales_order`
                                                                     ELSE concat_lines_of( table = lt_sort_criteria sep = `, ` ) ).
    DATA(lv_offset) = io_request->get_paging( )->get_offset( ).
    DATA(lv_page_size) = io_request->get_paging( )->get_page_size( ).
    DATA(lv_max_rows) = COND #( WHEN lv_page_size = if_rap_query_paging=>page_size_unlimited THEN 0
                                ELSE lv_page_size ).

    " Execute query
    SELECT sales_order, customer_name, total_amount, currency, last_changed_at
      FROM zjh_saleorder
      WHERE (lv_sql_filter) AND total_amount > 1000
      ORDER BY (lv_sort_string)
      INTO TABLE @lt_result
      OFFSET @lv_offset UP TO @lv_max_rows ROWS.

    " Return result
    io_response->set_total_number_of_records( lines( lt_result ) ).
    io_response->set_data( lt_result ).
  ENDMETHOD.

ENDCLASS.

