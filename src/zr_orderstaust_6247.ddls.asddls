@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Order Status'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_ORDERSTAUST_6247 as select from zorstatust_6247
{
   @ObjectModel.text.element: [ 'Orderstatustext' ]
   key orderstatus as Orderstatus,
   @Semantics.language: true
   key id_lang as IdLang,
     @Semantics.text: true
   orderstatustext as Orderstatustext 
}
