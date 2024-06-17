@EndUserText.label: 'Consumption Sale Order'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions:true 
@Search.searchable:true 
@ObjectModel.semanticKey: [ 'IdSale' ]
define root view entity ZC_SALEORDER_6247  provider contract transactional_query as projection on ZR_SALEORDER_6247
{
    key SaleUUID,
    @Search.defaultSearchElement:true
    IdSale,
    Email,
    Firstname,
    Lastname,
    @Consumption.valueHelpDefinition: [{ entity: {name: 'I_CountryText',//'ZR_COUNTRYT_6247',
                                         element: 'CountryName'},
                                         useForValidation: true }]
    Country,

    @Search.defaultSearchElement: true
    Createon,
    @Search.defaultSearchElement: true
    Deliverydate,
    @ObjectModel.text.element: [ '_OrderStatusText' ]
    @Consumption.valueHelpDefinition: [{ entity: {name: 'ZR_ORDERSTAUST_6247',
                                         element: 'Orderstatus'},
                                         useForValidation: true }]
    Orderstatus,
    _OrderStatusText.Orderstatustext as OrderStatusText, //: localized ,
    Imageurl,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Item: redirected to composition child ZC_ITEM_6247,
    _OrderStatusText
}
