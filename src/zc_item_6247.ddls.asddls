@EndUserText.label: 'Consumption Item'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions:true
@Search.searchable:true

define view entity ZC_ITEM_6247
  as projection on ZR_ITEM_6247
{
  key SaleUUID,
  key ItemUUID,
      IdSale,
      @Search.defaultSearchElement: true
      IdItem,
      Name,
      Description,
      Releasedate,
      Discontinueddate,
      Price,
      Height,
      Width,
      Depth,
      Quantity,
      @Consumption.valueHelpDefinition: [{entity:
                                            { name: 'I_UnitOfMeasure',
                                              element: 'UnitOfMeasure' },
                                      useForValidation: true }]
      Unitofmeasure,
      LocalLastChangedAt,
      /* Associations */
      _SaleOrder : redirected to parent ZC_SALEORDER_6247
}
