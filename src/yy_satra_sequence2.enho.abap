CLASS LCL_YY_SATRA_SEQUENCE2 DEFINITION DEFERRED.
CLASS CL_ATRA_UML_HANDLING DEFINITION LOCAL FRIENDS LCL_YY_SATRA_SEQUENCE2.
CLASS LCL_YY_SATRA_SEQUENCE2 DEFINITION.
PUBLIC SECTION.
CLASS-DATA OBJ TYPE REF TO LCL_YY_SATRA_SEQUENCE2. "#EC NEEDED
DATA CORE_OBJECT TYPE REF TO CL_ATRA_UML_HANDLING . "#EC NEEDED
 INTERFACES  IOW_YY_SATRA_SEQUENCE2.
  METHODS:
   CONSTRUCTOR IMPORTING CORE_OBJECT
     TYPE REF TO CL_ATRA_UML_HANDLING OPTIONAL.
ENDCLASS.
CLASS LCL_YY_SATRA_SEQUENCE2 IMPLEMENTATION.
METHOD CONSTRUCTOR.
  ME->CORE_OBJECT = CORE_OBJECT.
ENDMETHOD.

METHOD IOW_YY_SATRA_SEQUENCE2~SHOW_SEQ_DIAGRAM.
*"------------------------------------------------------------------------*
*" Declaration of Overwrite-method, do not insert any comments here please!
*"
*"class-methods SHOW_SEQ_DIAGRAM
*"  importing
*"    !KEY type SATR_TAB_KEY .
*"------------------------------------------------------------------------*
DATA lx_error TYPE REF TO cx_dynamic_check.
  TRY.
      lcl_sequence=>to_diagram( lcl_configuration=>query( ) )->output( ).
    CATCH cx_dynamic_check INTO lx_error.
      MESSAGE lx_error TYPE 'I' DISPLAY LIKE 'E'.  "#EC CI_USE_WANTED
  ENDTRY.
  RETURN.
ENDMETHOD.
ENDCLASS.
