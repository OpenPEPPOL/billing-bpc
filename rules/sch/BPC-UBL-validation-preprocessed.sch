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
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <ns prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" />
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
  <ns prefix="qdt" uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" />
  <ns prefix="udt" uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" />
  <ns prefix="cn" uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" />
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" />
  <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema" />
  <phase id="BPCmodel_phase">
    <active pattern="BPC-model" />
  </phase>
  <phase id="codelist_phase">
    <active pattern="Codesmodel" />
  </phase>
  <pattern id="BPC-model">
    <rule context="cac:AdditionalDocumentReference/cbc:ID">
      <assert id="bpcbr-06" flag="fatal" test="count (@schemeID) = 1">[bpcbr-06]-Scheme Identifier does not exist when Invoiced Object Identifier is provided.</assert>
    </rule>
    <rule context="cac:LegalMonetaryTotal/cbc:PayableAmount" />
    <rule context="cac:AccountingCustomerParty/cac:Party/cbc:EndpointID" />
    <rule context="cac:AccountingCustomerParty/cac:Party/cac:PostalAddress">
      <assert id="bpcbr-27" flag="fatal" test="count(cbc:PostalZone) = 1">[bpcbr-27]-Customer - Accounts Payable Post Code must exist exactly once.</assert>
      <assert id="bpcbr-28" flag="fatal" test="count(cbc:CountrySubentity) = 1">[bpcbr-28]-Customer - Accounts Payable Country Subdivision must exist exactly once.</assert>
    </rule>
    <rule context="cac:AccountingCustomerParty">
      <assert id="bpcbr-24" flag="fatal" test="count(cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) = 1">[bpcbr-24]-Cannot have more than one Customer - Accounts Payable Trading Name.</assert>
      <assert id="bpcbr-25" flag="fatal" test="count(cac:Party/cac:PartyName/cbc:Name) &lt;= 1">[bpcbr-25]-More than one Customer - Accounts Payable Trading Name exists.</assert>
      <assert id="bpcbr-26" flag="fatal" test="count(cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1">[bpcbr-26]-Cannot have more than one Customer - Accounts Payable Legal Registration Identifier.</assert>
      <assert id="bpcbr-29" flag="fatal" test="count(cac:Party/cac:PartyName/cbc:Name) &lt;= 1">[bpcbr-29]-Cannot have more than one Customer - Buyer Trading Name</assert>
      <assert id="bpcbr-30" flag="fatal" test="true()">[bpcbr-30]-Cannot have more than one Customer - Buyer Identifier</assert>
      <assert id="bpcbr-31" flag="fatal" test="count(cac:Party/cac:PartyIdentification/cbc:ID/@schemeID) =1">[bpcbr-31]-Scheme Identifier must exist if Customer - Buyer Identifier is provided.</assert>
      <assert id="bpcbr-32" flag="fatal" test="count(cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1">[bpcbr-32]-Cannot have more than one Customer - Buyer legal registration identifier</assert>
      <assert id="bpcbr-33" flag="fatal" test="count(cac:Party/cac:PartyLegalEntity/cbc:CompanyID/@schemeID) = 1">[bpcbr-33]-Scheme Identifier must exist if Customer - Buyer Legal Registration Identifier is provided.</assert>
    </rule>
    <rule context="cac:Delivery/cac:DeliveryLocation/cac:Address" />
    <rule context="/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator = false()] | /cn:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator = false()]" />
    <rule context="/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator = true()] | /cn:CreditNote/cac:AllowanceCharge[cbc:ChargeIndicator = true()]" />
    <rule context="cac:LegalMonetaryTotal" />
    <rule context="/ubl:Invoice | /cn:CreditNote">
      <assert id="bpcbr-02" flag="fatal" test="(count(cac:ProjectReference/cbc:ID) &lt;= 1)">[bpcbr-02]-Cannot have more than one project reference.</assert>
      <assert id="bpcbr-03" flag="fatal" test="(count(cac:ContractDocumentReference/cbc:ID) &lt;= 1)">[bpcbr-03]-Cannot have more than one contract number.</assert>
      <assert id="bpcbr-04" flag="fatal" test="(count(cac:ReceiptDocumentReference/cbc:ID) &lt;= 1)">[bpcbr-04]-Cannot have more than one proof of delivery reference.</assert>
      <assert id="bpcbr-05" flag="fatal" test="(count(cac:AdditionalDocumentReference/cbc:ID) &lt;= 1)">[bpcbr-05]-More than one Invoice Object Identifier exists.</assert>
      <assert id="bpcbr-09" flag="fatal" test="count(cac:InvoicePeriod) &lt;= 1">[bpcbr-09]-Cannot have more than one invoicing period.</assert>
      <assert id="bpcbr-10" flag="fatal" test="normalize-space(cbc:ProfileID) = ('TBD BPC Profile Identifier')">[bpcbr-10]-Business process type must reflect a BPC identifier.</assert>
      <assert id="bpcbr-11" flag="fatal" test="count(cbc:ProfileExecutionID) =1">[bpcbr-11]-Session Identifier must exist exactly once.</assert>
      <assert id="bpcbr-13" flag="fatal" test="count(cac:AccountingSupplierParty) = 1">[bpcbr-13]-Cannot have more than one Supplier - Accounts Receivable Identifier.</assert>
      <assert id="bpcbr-23" flag="fatal" test="count(cac:AccountingCustomerParty) = 1">[bpcbr-23]-Customer - Accounts Payable must exist exactly once.</assert>
      <assert id="bpcbr-34" flag="fatal" test="count(cac:DeliveryParty/cac:PartyName/cbc:Name) &lt;= 1">[bpcbr-34]-Cannot have more than one Deliver to party name.</assert>
      <assert id="bpcbr-39" flag="fatal" test="true()">[bpcbr-39]-Payment Account Identifier must exist if Credit Transfer information is provided.</assert>
      <assert id="bpcbr-40" flag="fatal" test="true()">[bpcbr-40]-Payment card primary account number must exist exactly once if Payment Card Information is provided.</assert>
      <assert id="bpcbr-41" flag="fatal" test="true()">[bpcbr-41]-Cannot have more than one Bank Assigned Creditor Identifier.</assert>
      <assert id="bpcbr-42" flag="fatal" test="true()">[bpcbr-42]-Discount  indicator must exist</assert>
      <assert id="bpcbr-43" flag="fatal" test="true()">[bpcbr-43]-Document level discount tax category code must reflect values from United Nations Economic Commission for Europe (UNECE) – (UNTDID) D. 16B – Duty or tax or fee category code (Subset of UNCL5305)</assert>
      <assert id="bpcbr-44" flag="fatal" test="true()">[bpcbr-44]-Cannot have more than one Document level discount tax rate</assert>
      <assert id="bpcbr-45" flag="fatal" test="true()">[bpcbr-45]-Charge indicator must exist</assert>
      <assert id="bpcbr-46" flag="fatal" test="true()">[bpcbr-46]-Document level charge tax category code value must reflect United Nations Economic Commission for Europe (UNECE) – (UNTDID) D. 16B – Duty or tax or fee category code (Subset of UNCL5305).</assert>
      <assert id="bpcbr-47" flag="fatal" test="true()">[bpcbr-47]-Document level charge reason code value must reflect United Nations Economic Commission for Europe (UNECE) - (UNTDID) – D.18A – Element 5189 (Allowance or charge identification code)</assert>
      <assert id="bpcbr-48" flag="fatal" test="true()">[bpcbr-48]-Tax Breakdown information must exist.</assert>
      <assert id="bpcbr-49" flag="fatal" test="true()">[bpcbr-49]-Tax Category taxable amount must exist.</assert>
      <assert id="bpcbr-50" flag="fatal" test="true()">[bpcbr-50]-Tax amount must equal to the taxable amount times the taxable rate, rounded to two decimals.</assert>
      <assert id="bpcbr-51" flag="fatal" test="true()">[bpcbr-51]-Tax category code must reflect value from United Nations Economic Commission for Europe (UNECE) – (UNTDID) D. 16B – Duty or tax or fee category code (Subset of UNCL5305)</assert>
      <assert id="bpcbr-52" flag="fatal" test="true()">[bpcbr-52]-More than one Tax Exemption Reason Text entry exists.</assert>
      <assert id="bpcbr-53" flag="fatal" test="true()">[bpcbr-53]-Attached document filename must exist exactly once.</assert>
      <assert id="bpcbr-54" flag="fatal" test="true()">[bpcbr-54]-Purchase Order Line Number must exist exactly once.</assert>
      <assert id="bpcbr-55" flag="fatal" test="true()">[bpcbr-55]-Delivery identifier must exist.</assert>
      <assert id="bpcbr-56" flag="fatal" test="true()">[bpcbr-56]-Tax Category Code must reflect value from United Nations Economic Commission for Europe (UNECE) – (UNTDID) D. 16B – Duty or tax or fee category code (Subset of UNCL5305)</assert>
      <assert id="bpcbr-57" flag="fatal" test="true()">[bpcbr-57]-Tax Scheme value specified is invalid.</assert>
      <assert id="bpcbr-58" flag="fatal" test="true()">[bpcbr-58]- More than one Invoice Period Line exists.</assert>
      <assert id="bpcbr-59" flag="fatal" test="true()">[bpcbr-59]- Price Details must exist exactly once.</assert>
      <assert id="bpcbr-60" flag="fatal" test="true()">[bpcbr-60]-Cannot have more than one item price discount.</assert>
      <assert id="bpcbr-61" flag="fatal" test="true()">[bpcbr-61]-Cannot have more than one item gross price.</assert>
      <assert id="bpcbr-62" flag="fatal" test="true()">[bpcbr-62]-Item Price Base Quanitity Unit of Measure Code must reflect value from UN/ECE Recommendation N.20 "Codes for Units of Measure Used in International Trade"</assert>
      <assert id="bpcbr-63" flag="fatal" test="true()">[bpcbr-63]-Code must be equal to Invoiced Quantity Unit of Measure Code.</assert>
      <assert id="bpcbr-64" flag="fatal" test="true()">[bpcbr-64]-Code must be equal to Credited Quantity Unit of Measure Code.</assert>
      <assert id="bpcbr-65" flag="fatal" test="true()">[bpcbr-65]-Invoiced Item Tax Rate and Per Unit Tax Amount are mutually exclusive.</assert>
      <assert id="bpcbr-66" flag="fatal" test="true()">[bpcbr-66]-Invoiced Item Tax Category Code must reflect value from United Nations Economic Commission for Europe (UNECE) – (UNTDID) D. 16B – Duty or tax or fee category code (Subset of UNCL5305)</assert>
      <assert id="bpcbr-67" flag="fatal" test="true()">[bpcbr-67]-Invoiced Item Tax Scheme Identifier must reflect value from United Nations Economic Commission for Europe (UNECE) – (UNTDID) D. 18A – Usage of Element 5153 (Duty/tax/fee)</assert>
      <assert id="bpcbr-68" flag="fatal" test="true()">[bpcbr-68]-Product/service code OR Product/service description is mandatory. </assert>
      <assert id="bpcbr-69" flag="fatal" test="true()">[bpcbr-69]-Lot identification number is not specified or exists more than once.</assert>
    </rule>
    <rule context="//cac:InvoiceLine/cac:AllowanceCharge[cbc:ChargeIndicator = false()] | //cac:CreditNoteLine/cac:AllowanceCharge[cbc:ChargeIndicator = false()]" />
    <rule context="//cac:InvoiceLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()] | //cac:CreditNoteLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()]" />
    <rule context="cac:InvoiceLine/cac:InvoicePeriod | cac:CreditNoteLine/cac:InvoicePeriod" />
    <rule context="cac:InvoicePeriod" />
    <rule context="//cac:AdditionalItemProperty" />
    <rule context="cac:InvoiceLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode | cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode" />
    <rule context="cac:InvoiceLine/cac:Item/cac:StandardItemIdentification/cbc:ID | cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID" />
    <rule context="cac:PayeeParty">
      <assert id="bpcbr-20" flag="fatal" test="count(cac:PartyLegalEntity/cbc:CompanyID/@schemeID) = 1">[bpcbr-10]-Scheme Identifier must exist if Supplier - Seller Identifier is provided.</assert>
      <assert id="bpcbr-21" flag="fatal" test="count(cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1">[bpcbr-21]-Cannot have more than one Supplier - Seller legal registration identifier.</assert>
    </rule>
    <rule context="cac:PaymentTerms">
      <assert id="bpcbr-07" flag="fatal" test="if( count( cbc:SettlementDiscountPercent ) > 0 or count( cbc:SettlementDiscountAmount ) > 0 or count( cbc:Amount ) > 0 ) then ( count( cbc:SettlementDiscountPercent ) = 1 and count( cbc:SettlementDiscountAmount ) = 1 and count( cbc:Amount ) = 1 ) else true()">[bpcbr-07]-If Payment Terms Discount Percent or Payment Terms Discount Amount or Basis for Terms Discount exist, then all three elements must exist.</assert>
      <assert id="bpcbr-08" flag="fatal" test="xs:decimal(cbc:SettlementDiscountAmount) = xs:decimal(cbc:Amount * cbc:SettlementDiscountPercent)">[bpcbr-08]-Payment Terms Discount Amount must be equal to Payment Terms Discount Percent times Basis for Terms Discount.</assert>
    </rule>
    <rule context="cac:PaymentMeans">
      <assert id="bpcbr-36" flag="fatal" test="if (some $code in (17, 18, 20, 28, 29, 30, 32, 33, 35, 36, 39, 40, 41, 43, 48, 49, 54) satisfies normalize-space(cbc:PaymentMeansCode) = string($code) ) then count (../cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID) = 1 else true()">[bpcbr-36]-If the Payment means type code needs an account, the Payment account identifier must exist.</assert>
      <assert id="bpcbr-37" flag="fatal" test="count(cbc:PaymentMeansCode/@Name) &lt;= 1">[bpcbr-37]-Cannot have more than one payment method text entry.</assert>
      <assert id="bpcbr-38" flag="fatal" test="count(cbc:PaymentID) &lt;= 1">[bpcbr-38]-Cannot have more than one remittance requirement information entry.</assert>
    </rule>
    <rule context="cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode">
      <assert id="bpcbr-12" flag="fatal" test="((not(contains(normalize-space(.), ' ')) and contains(' codes 1373 ', concat(' ', normalize-space(.), ' '))))">[bpcbr-12]-Value must exist in code list UNECE-1373.</assert>
    </rule>
    <rule context="cac:AccountingSupplierParty">
      <assert id="bpcbr-16" flag="fatal" test="count(cac:Party/cac:PostalAddress) = 1">[bpcbr-16]-Supplier - Accounts Receivable Postal Address must exist exactly once.</assert>
      <assert id="bpcbr-17" flag="fatal" test="count(cac:Party/cac:PostalAddress/cbc:PostalZone) = 1">[bpcbr-17]-Supplier - Accounts Reivable Post Code must exist exactly once.</assert>
      <assert id="bpcbr-18" flag="fatal" test="count(cac:Party/cac:PostalAddress/cbc:CountrySubentity) = 1">[bpcbr-18]-Supplier - Accounts Reivable Country Subdivision must exist exactly once.</assert>
      <assert id="bpcbr-19" flag="fatal" test="count(cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1">[bpcbr-19]-Cannot have more than one Supplier - Seller Identifier.</assert>
      <assert id="bpcbr-22" flag="fatal" test="count(cac:Party/cac:PartyLegalEntity/cbc:CompanyID/@schemeID) = 1">[bpcbr-22]-Scheme Identifier must exist if Supplier - Seller Legal Registration Identifier is provided.</assert>
    </rule>
    <rule context="cac:AccountingSupplierParty/cac:Party/cbc:PartyIdentification/cbc:ID">
      <assert id="bpcbr-14" flag="fatal" test="count(@schemeID) = 1">[bpcbr-14]-Scheme Identifier must exist if Supplier - Accounts Receivable Identifier is provided.</assert>
    </rule>
    <rule context="cac:AccountingSupplierParty/cac:Party/cbc:PartyLegalEntity/cbc:CompanyID">
      <assert id="bpcbr-15" flag="fatal" test="count(@schemeID) = 1">[bpcbr-15]-Scheme Identifier must exist if Supplier - Accounts Receivable Legal Registration Identifier is provided.</assert>
    </rule>
    <rule context="cac:AccountingSupplierParty/cac:Party/cbc:EndpointID" />
    <rule context="cac:AccountingSupplierParty/cac:Party/cac:PostalAddress" />
    <rule context="cac:TaxRepresentativeParty" />
    <rule context="cac:TaxRepresentativeParty/cac:PostalAddress" />
    <rule context="/ubl:Invoice/cac:TaxTotal | /cn:CreditNote/cac:Taxtotal" />
  </pattern>
  <pattern id="Codesmodel">
    <rule flag="fatal" context="cbc:InvoiceTypeCode | cbc:CreditNoteTypeCode">
      <assert id="ibr-cl-01" flag="fatal" test="(self::cbc:InvoiceTypeCode and ((not(contains(normalize-space(.), ' ')) and contains(' 380 ', concat(' ', normalize-space(.), ' '))))) or (self::cbc:CreditNoteTypeCode and ((not(contains(normalize-space(.), ' ')) and contains(' 381 ', concat(' ', normalize-space(.), ' ')))))">[bpcbr-01]-Invoice Type Code value must be Commercial Invoice (380) or Credit Note (381).</assert>
    </rule>
  </pattern>
</schema>
