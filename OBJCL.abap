CLASS lcl_objcl DEFINITION.

  PUBLIC SECTION.

    CONSTANTS:
      BEGIN OF mty_c_param,
        mch1  TYPE bapi1003_key-objecttable VALUE 'MCH1',
      END OF  mty_c_param.

    CLASS-METHODS:	
        get_object_key
          IMPORTING iv_objkey TYPE cuobj
          RETURNING value(ev_objkey) TYPE objnum,
        get_split_key
          IMPORTING iv_objname TYPE objnum
          RETURNING value(rt_objkey) TYPE tt_bapi1003_object_keys.

ENDCLASS. 


CLASS lcl_objcl IMPLEMENTATION.

  METHOD get_object_key.
    DATA:
     lt_return TYPE bapiret2_t.

    CALL FUNCTION 'BAPI_OBJCL_GET_OBJECT_OF_KEY'
      EXPORTING
        clobjectkeyin = iv_objkey
      IMPORTING
        objectname    = ev_objkey
      TABLES
        return        = lt_return.
  ENDMETHOD. 


  METHOD get_split_key.
    DATA:
     lt_return TYPE bapiret2_t.

    CALL FUNCTION 'BAPI_OBJCL_SPLITKEY'
      EXPORTING
        objectkey_conc = iv_objname
        objecttable    = mty_c_param-mch1
      TABLES
        objectkeytable = rt_objkey
        return         = lt_return.
  ENDMETHOD.  
  
ENDCLASS.