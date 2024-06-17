CLASS zcl_cargasaleorder_6247 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cargasaleorder_6247 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: lt_order_status TYPE TABLE OF zorstatust_6247.

******** ZORDERSTATUST_6247 ********
    "fill internal table
    lt_order_status = VALUE #(
    ( orderstatus = '01' id_lang = 'EN' orderstatustext = 'New' )
     ( orderstatus = '02' id_lang = 'EN' orderstatustext = 'In Process' )
    ( orderstatus = '03' id_lang = 'EN' orderstatustext = 'Completed' )
     ( orderstatus = '04' id_lang = 'EN' orderstatustext = 'Cancelled' )
     ( orderstatus = '05' id_lang = 'ES' orderstatustext = 'Nuevo' )
     ( orderstatus = '06' id_lang = 'ES' orderstatustext = 'En Proceso' )
     ( orderstatus = '07' id_lang = 'ES' orderstatustext = 'Completado' )
    ( orderstatus = '08' id_lang = 'ES' orderstatustext = 'Cancelado' ) ).

    "Delete possible entries; insert new entries
    DELETE FROM zorstatust_6247.                        "#EC CI_NOWHERE

    INSERT zorstatust_6247 FROM TABLE @lt_order_status.
    out->write( |Acceso por Order Status { sy-dbcnt }| ).


  ENDMETHOD.

ENDCLASS.
