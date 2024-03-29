<!--

            Copyright (C) 2020-2023 OpenPEPPOL AISBL

            Licensed under the Apache License, Version 2.0 (the "License");
            you may not use this file except in compliance with the License.
            You may obtain a copy of the License at

                    http://www.apache.org/licenses/LICENSE-2.0

            Unless required by applicable law or agreed to in writing, software
            distributed under the License is distributed on an "AS IS" BASIS,
            WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
            See the License for the specific language governing permissions and
            limitations under the License.

-->
<!-- Schematron binding rules automatically generated by Oriol Bausà-->
<!-- Data binding to UBL syntax for model -->
<!-- Timestamp: 2020-02-11 12:09:56 +0200 -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="model" id="BPC-model">
  <param name="bpcbr-02" value="(count(cac:ProjectReference/cbc:ID) &lt;= 1)"/>  
  <param name="bpcbr-03" value="(count(cac:ContractDocumentReference/cbc:ID) &lt;= 1)"/>
  <param name="bpcbr-04" value="(count(cac:ReceiptDocumentReference/cbc:ID) &lt;= 1)"/>
  <param name="bpcbr-05" value="(count(cac:AdditionalDocumentReference/cbc:ID) &lt;= 1)"/>
  <param name="bpcbr-06" value="count (@schemeID) = 1"/>
  <param name="bpcbr-07" value="if( count( cbc:SettlementDiscountPercent ) > 0 or count( cbc:SettlementDiscountAmount ) > 0 or count( cbc:Amount ) > 0 ) then ( count( cbc:SettlementDiscountPercent ) = 1 and count( cbc:SettlementDiscountAmount ) = 1 and count( cbc:Amount ) = 1 ) else true()"/>
  <param name="bpcbr-08" value="xs:decimal(cbc:SettlementDiscountAmount) = xs:decimal(cbc:Amount * cbc:SettlementDiscountPercent)"/>
  <param name="bpcbr-09" value="count(cac:InvoicePeriod) &lt;= 1"/>
  <param name="bpcbr-10" value="normalize-space(cbc:ProfileID) = ('TBD BPC Profile Identifier')"/>
  <param name="bpcbr-11" value="count(cbc:ProfileExecutionID) =1"/>
  <param name="bpcbr-12" value="((not(contains(normalize-space(.), ' ')) and contains(' codes 1373 ', concat(' ', normalize-space(.), ' '))))"/>
  <param name="bpcbr-13" value="count(cac:AccountingSupplierParty) = 1"/>
  <param name="bpcbr-14" value="count(@schemeID) = 1"/>
  <param name="bpcbr-15" value="count(@schemeID) = 1"/>
  <param name="bpcbr-16" value="count(cac:Party/cac:PostalAddress) = 1"/>
  <param name="bpcbr-17" value="count(cac:Party/cac:PostalAddress/cbc:PostalZone) = 1"/>
  <param name="bpcbr-18" value="count(cac:Party/cac:PostalAddress/cbc:CountrySubentity) = 1"/>
  <param name="bpcbr-19" value="count(cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1"/>
  <param name="bpcbr-20" value="count(cac:PartyLegalEntity/cbc:CompanyID/@schemeID) = 1"/>
  <param name="bpcbr-21" value="count(cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1"/>
  <param name="bpcbr-22" value="count(cac:Party/cac:PartyLegalEntity/cbc:CompanyID/@schemeID) = 1"/>
  <param name="bpcbr-23" value="count(cac:AccountingCustomerParty) = 1"/>
  <param name="bpcbr-24" value="count(cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) = 1"/>
  <param name="bpcbr-25" value="count(cac:Party/cac:PartyName/cbc:Name) &lt;= 1"/>
  <param name="bpcbr-26" value="count(cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1"/>
  <param name="bpcbr-27" value="count(cbc:PostalZone) = 1"/>
  <param name="bpcbr-28" value="count(cbc:CountrySubentity) = 1"/>
  <param name="bpcbr-29" value="count(cac:Party/cac:PartyName/cbc:Name) &lt;= 1"/>
  <param name="bpcbr-30" value="true()"/>
  <param name="bpcbr-31" value="count(cac:Party/cac:PartyIdentification/cbc:ID/@schemeID) =1"/>
  <param name="bpcbr-32" value="count(cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1"/>
  <param name="bpcbr-33" value="count(cac:Party/cac:PartyLegalEntity/cbc:CompanyID/@schemeID) = 1"/>
  <param name="bpcbr-34" value="count(cac:DeliveryParty/cac:PartyName/cbc:Name) &lt;= 1"/>
  <param name="bpcbr-36" value="if (some $code in (17, 18, 20, 28, 29, 30, 32, 33, 35, 36, 39, 40, 41, 43, 48, 49, 54) satisfies normalize-space(cbc:PaymentMeansCode) = string($code) ) then count (../cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID) = 1 else true()"/>
  <param name="bpcbr-37" value="count(cbc:PaymentMeansCode/@Name) &lt;= 1"/>
  <param name="bpcbr-38" value="count(cbc:PaymentID) &lt;= 1"/>
  <param name="bpcbr-39" value="count(cbc:ID) = 1 "/>
  <param name="bpcbr-40" value="count(cbc:PrimaryAccountNumberID) = 1"/>
  <param name="bpcbr-41" value="count(cac:PayeeParty/cac:PartyIdentification/cbc:ID) &lt;= 1"/>
  <param name="bpcbr-44" value="count(cac:TaxCategory/cbc:Percent) &lt;= 1"/>
  <param name="bpcbr-48" value="count(cac:TaxTotal/cac:TaxSubtotal) &gt;= 1"/>
  <param name="bpcbr-49" value="count(cbc:TaxableAmount) = 1"/>
  <param name="bpcbr-50" value="(xs:decimal(child::cbc:TaxAmount)= round((sum(cac:TaxSubtotal/xs:decimal(cbc:TaxAmount)) * 10 * 10)) div 100) or not(cac:TaxSubtotal)"/>
  <param name="bpcbr-52" value="count(cac:TaxCategory/cbc:TaxExemptionReason) &lt;= 1"/>
  <param name="bpcbr-53" value="count(@filename ) = 1"/>
  <param name="bpcbr-54" value="count(cac:OrderLineReference/cbc:LineID) &lt;=1"/>
  <param name="bpcbr-55" value="count(cbc:ID) = 1"/>
  <param name="bpcbr-58" value="count(cac:InvoicePeriod) &lt;= 1"/>
  <param name="bpcbr-59" value="count(cac:Price) = 1"/>
  <param name="bpcbr-60" value="count(cac:Price/cac:AllowanceCharge) &lt;= 1"/>
  <param name="bpcbr-61" value="count(cac:Price/cbc:BaseAmount) &lt;= 1"/>
  <param name="bpcbr-65" value="if( count(cbc:Percent) = 1 and count(cbc:PerUnitAmount) = 1 ) then false() else true()"/>
  <param name="bpcbr-68" value="count(cac:StandardItemIdentification/cbc:ID) = 1 or count(cbc:Description) = 1"/>
  <param name="Invoice_Period" value="cac:InvoicePeriod"/>
  <param name="Document_totals" value="cac:LegalMonetaryTotal"/>
  <param name="Attachments" value="cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject"/>
  <param name="Allowance" value="cac:AllowanceCharge[cbc:ChargeIndicator='false']"/>
  <param name="Payee" value="cac:PayeeParty"/>
  <param name="Credit_transfer" value="cac:PaymentMeans/cac:PayeeFinancialAccount"/>
  <param name="Card_account" value="cac:PaymentMeans/cac:CardAccount"/>
  <param name="Tax_Representative_postal_address" value="cac:TaxRepresentativeParty/cac:PostalAddress"/>
  <param name="Tax_Representative" value="cac:TaxRepresentativeParty"/>
  <param name="Tax_Subtotal" value="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal | /cn:CreditNote/cac:Taxtotal/cac:TaxSubtotal"/>
  <param name="Tax_Total" value="/ubl:Invoice/cac:TaxTotal | /cn:CreditNote/cac:Taxtotal"/>
  <param name="Seller_party_legal_entity" value="cac:AccountingSupplierParty/cac:Party/cbc:PartyLegalEntity/cbc:CompanyID"/>
  <param name="Seller_party_identification" value="cac:AccountingSupplierParty/cac:Party/cbc:PartyIdentification/cbc:ID"/>
  <param name="Seller_electronic_address" value="cac:AccountingSupplierParty/cac:Party/cbc:EndpointID"/>
  <param name="Seller_postal_address" value="cac:AccountingSupplierParty/cac:Party/cac:PostalAddress"/>
  <param name="Invoice_Line_Period" value="cac:InvoiceLine/cac:InvoicePeriod | cac:CreditNoteLine/cac:InvoicePeriod"/>
  <param name="Seller" value="cac:AccountingSupplierParty"/>
  <param name="Invoice_Line" value="cac:InvoiceLine | cac:CreditNoteLine"/>
  <param name="Document_level_allowances" value="/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator = false()] | /cn:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator = false()]"/>
  <param name="Document_level_charges" value="/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator = true()] | /cn:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator = true()]"/>
  <param name="Invoice_line_tax" value="//cac:InvoiceLine/cac:ClassifiedTaxCategory | //cac:CreditNoteLine/cac:ClassifiedTaxCategory"/>
  <param name="Invoice_line_charges" value="//cac:InvoiceLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()] | //cac:CreditNoteLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()]"/>
  <param name="Payment_instructions" value="cac:PaymentTerms"/>
  <param name="Payment_means" value="cac:PaymentMeans"/>
  <param name="Additional_supporting_documents" value="cac:AdditionalDocumentReference/cbc:ID"/>
  <param name="Item_attributes" value="//cac:AdditionalItemProperty"/>
  <param name="Document_status" value="cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode"/>
  <param name="Invoice" value="/ubl:Invoice | /cn:CreditNote"/>
  <param name="Buyer_postal_address" value="cac:AccountingCustomerParty/cac:Party/cac:PostalAddress"/>
  <param name="Deliver_to_address" value="cac:Delivery/cac:DeliveryLocation/cac:Address"/>
  <param name="Buyer_electronic_address" value="cac:AccountingCustomerParty/cac:Party/cbc:EndpointID"/>
  <param name="Item" value="//cac:Item"/>
  <param name="Item_classification_identifier" value="cac:InvoiceLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode | cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode "/>
  <param name="Percent" value="(//cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent | //cac:AllowanceCharge/cac:TaxCategory/cbc:Percent)"/>
  <param name="Buyer" value="cac:AccountingCustomerParty"/>
  <param name="Delivery" value="//cac:Delivery"/>
</pattern>
