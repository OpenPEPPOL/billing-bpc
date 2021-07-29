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
    <rule context="cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
      <assert id="bpcbr-53" flag="fatal" test="count(@filename ) = 1">[bpcbr-53]-Attached document filename must exist exactly once.</assert>
    </rule>
    <rule context="cac:AllowanceCharge[cbc:ChargeIndicator='false']">
      <assert id="bpcbr-44" flag="fatal" test="count(cac:TaxCategory/cbc:Percent) &lt;= 1">[bpcbr-44]-Cannot have more than one Document level discount tax rate</assert>
    </rule>
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
      <assert id="bpcbr-41" flag="fatal" test="count(cac:PayeeParty/cac:PartyIdentification/cbc:ID) &lt;= 1">[bpcbr-41]-Cannot have more than one Bank Assigned Creditor Identifier.</assert>
      <assert id="bpcbr-48" flag="fatal" test="count(cac:TaxTotal/cac:TaxSubtotal) >= 1">[bpcbr-48]-Tax Breakdown information must exist.</assert>
    </rule>
    <rule context="//cac:InvoiceLine/cac:ClassifiedTaxCategory | //cac:CreditNoteLine/cac:ClassifiedTaxCategory">
      <assert id="bpcbr-65" flag="fatal" test="if( count(cbc:Percent) = 1 and count(cbc:PerUnitAmount) = 1 ) then false() else true()">[bpcbr-65]-Invoiced Item Tax Rate and Per Unit Tax Amount are mutually exclusive.</assert>
    </rule>
    <rule context="//cac:InvoiceLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()] | //cac:CreditNoteLine/cac:AllowanceCharge[cbc:ChargeIndicator = true()]" />
    <rule context="cac:InvoiceLine | cac:CreditNoteLine">
      <assert id="bpcbr-54" flag="fatal" test="count(cac:OrderLineReference/cbc:LineID) &lt;=1">[bpcbr-54]-Purchase Order Line Number must exist at most once.</assert>
      <assert id="bpcbr-58" flag="fatal" test="count(cac:InvoicePeriod) &lt;= 1">[bpcbr-58]- More than one Invoice Period Line exists.</assert>
      <assert id="bpcbr-59" flag="fatal" test="count(cac:Price) = 1">[bpcbr-59]- Price Details must exist exactly once.</assert>
      <assert id="bpcbr-60" flag="fatal" test="count(cac:Price/cac:AllowanceCharge) &lt;= 1">[bpcbr-60]-Cannot have more than one item price discount.</assert>
      <assert id="bpcbr-61" flag="fatal" test="count(cac:Price/cbc:BaseAmount) &lt;= 1">[bpcbr-61]-Cannot have more than one item gross price.</assert>
    </rule>
    <rule context="cac:InvoicePeriod" />
    <rule context="cac:PaymentMeans/cac:PayeeFinancialAccount">
      <assert id="bpcbr-39" flag="fatal" test="count(cbc:ID) = 1">[bpcbr-39]-Payment Account Identifier must exist if Credit Transfer information is provided.</assert>
    </rule>
    <rule context="cac:PaymentMeans/cac:CardAccount">
      <assert id="bpcbr-40" flag="fatal" test="count(cbc:PrimaryAccountNumberID) = 1">[bpcbr-40]-Payment card primary account number must exist exactly once if Payment Card Information is provided.</assert>
    </rule>
    <rule context="//cac:AdditionalItemProperty" />
    <rule context="//cac:Item">
      <assert id="bpcbr-68" flag="fatal" test="count(cac:StandardItemIdentification/cbc:ID) = 1 or count(cbc:Description) = 1">[bpcbr-68]-Product/service code OR Product/service description is mandatory. </assert>
    </rule>
    <rule context="//cac:Delivery">
      <assert id="bpcbr-55" flag="fatal" test="count(cbc:ID) = 1">[bpcbr-55]-Delivery identifier must exist.</assert>
    </rule>
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
    <rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal | /cn:CreditNote/cac:Taxtotal/cac:TaxSubtotal">
      <assert id="bpcbr-49" flag="fatal" test="count(cbc:TaxableAmount) = 1">[bpcbr-49]-Tax Category taxable amount must exist.</assert>
      <assert id="bpcbr-52" flag="fatal" test="count(cac:TaxCategory/cbc:TaxExemptionReason) &lt;= 1">[bpcbr-52]-More than one Tax Exemption Reason Text entry exists.</assert>
    </rule>
    <rule context="/ubl:Invoice/cac:TaxTotal | /cn:CreditNote/cac:Taxtotal">
      <assert id="bpcbr-50" flag="fatal" test="(xs:decimal(child::cbc:TaxAmount)= round((sum(cac:TaxSubtotal/xs:decimal(cbc:TaxAmount)) * 10 * 10)) div 100) or not(cac:TaxSubtotal)">[bpcbr-50]-Tax amount must equal to the taxable amount times the taxable rate, rounded to two decimals.</assert>
    </rule>
  </pattern>
  <pattern id="Codesmodel">
    <rule flag="fatal" context="cbc:InvoiceTypeCode | cbc:CreditNoteTypeCode">
      <assert id="bpcbr-01" flag="fatal" test="(self::cbc:InvoiceTypeCode and ((not(contains(normalize-space(.), ' ')) and contains(' 380 ', concat(' ', normalize-space(.), ' '))))) or (self::cbc:CreditNoteTypeCode and ((not(contains(normalize-space(.), ' ')) and contains(' 381 ', concat(' ', normalize-space(.), ' ')))))">[bpcbr-01]-Invoice Type Code value must be Commercial Invoice (380) or Credit Note (381).</assert>
    </rule>
    <rule flag="fatal" context="cac:TaxCategory/cbc:ID | cac:ClassifiedTaxCategory/cbc:ID">
      <assert id="bpcbr-43" flag="fatal" test="( ( not(contains(normalize-space(.),' ')) and contains( ' AE L M E S Z G O K B ',concat(' ',normalize-space(.),' ') ) ) )">[bpcbr-43]-Tax category code must reflect values from United Nations Economic Commission for Europe (UNECE) – (UNTDID) D. 16B – Duty or tax or fee category code (Subset of UNCL5305)</assert>
    </rule>
    <rule flag="fatal" context="cac:AllowanceCharge[cbc:ChargeIndicator = true()]/cbc:AllowanceChargeReasonCode">
      <assert id="bpcbr-47" flag="fatal" test="((not(contains(normalize-space(.), ' ')) and contains(' AA AAA AAC AAD AAE AAF AAH AAI AAS AAT AAV AAY AAZ ABA ABB ABC ABD ABF ABK ABL ABN ABR ABS ABT ABU ACF ACG ACH ACI ACJ ACK ACL ACM ACS ADC ADE ADJ ADK ADL ADM ADN ADO ADP ADQ ADR ADT ADW ADY ADZ AEA AEB AEC AED AEF AEH AEI AEJ AEK AEL AEM AEN AEO AEP AES AET AEU AEV AEW AEX AEY AEZ AJ AU CA CAB CAD CAE CAF CAI CAJ CAK CAL CAM CAN CAO CAP CAQ CAR CAS CAT CAU CAV CAW CAX CAY CAZ CD CG CS CT DAB DAD DAC DAF DAG DAH DAI DAJ DAK DAL DAM DAN DAO DAP DAQ DL EG EP ER FAA FAB FAC FC FH FI GAA HAA HD HH IAA IAB ID IF IR IS KO L1 LA LAA LAB LF MAE MI ML NAA OA PA PAA PC PL RAB RAC RAD RAF RE RF RH RV SA SAA SAD SAE SAI SG SH SM SU TAB TAC TT TV V1 V2 WH XAA YY ZZZ ', concat(' ', normalize-space(.), ' '))))">[bpcbr-47]-Document level charge reason code value must reflect United Nations Economic Commission for Europe (UNECE) - (UNTDID) – D.18A – Element 5189 (Allowance or charge identification code)</assert>
    </rule>
    <rule flag="fatal" context="cbc:InvoicedQuantity[@unitCode] | cbc:BaseQuantity[@unitCode] | cbc:CreditedQuantity[@unitCode]">
      <assert id="bpcbr-62" flag="fatal" test="((not(contains(normalize-space(@unitCode), ' ')) and contains(' 10 11 13 14 15 20 21 22 23 24 25 27 28 33 34 35 37 38 40 41 56 57 58 59 60 61 74 77 80 81 85 87 89 91 1I 2A 2B 2C 2G 2H 2I 2J 2K 2L 2M 2N 2P 2Q 2R 2U 2X 2Y 2Z 3B 3C 4C 4G 4H 4K 4L 4M 4N 4O 4P 4Q 4R 4T 4U 4W 4X 5A 5B 5E 5J A10 A11 A12 A13 A14 A15 A16 A17 A18 A19 A2 A20 A21 A22 A23 A24 A26 A27 A28 A29 A3 A30 A31 A32 A33 A34 A35 A36 A37 A38 A39 A4 A40 A41 A42 A43 A44 A45 A47 A48 A49 A5 A53 A54 A55 A56 A59 A6 A68 A69 A7 A70 A71 A73 A74 A75 A76 A8 A84 A85 A86 A87 A88 A89 A9 A90 A91 A93 A94 A95 A96 A97 A98 A99 AA AB ACR ACT AD AE AH AI AK AL AMH AMP ANN APZ AQ AS ASM ASU ATM AWG AY AZ B1 B10 B11 B12 B13 B14 B15 B16 B17 B18 B19 B20 B21 B22 B23 B24 B25 B26 B27 B28 B29 B3 B30 B31 B32 B33 B34 B35 B4 B41 B42 B43 B44 B45 B46 B47 B48 B49 B50 B52 B53 B54 B55 B56 B57 B58 B59 B60 B61 B62 B63 B64 B66 B67 B68 B69 B7 B70 B71 B72 B73 B74 B75 B76 B77 B78 B79 B8 B80 B81 B82 B83 B84 B85 B86 B87 B88 B89 B90 B91 B92 B93 B94 B95 B96 B97 B98 B99 BAR BB BFT BHP BIL BLD BLL BP BPM BQL BTU BUA BUI C0 C10 C11 C12 C13 C14 C15 C16 C17 C18 C19 C20 C21 C22 C23 C24 C25 C26 C27 C28 C29 C3 C30 C31 C32 C33 C34 C35 C36 C37 C38 C39 C40 C41 C42 C43 C44 C45 C46 C47 C48 C49 C50 C51 C52 C53 C54 C55 C56 C57 C58 C59 C60 C61 C62 C63 C64 C65 C66 C67 C68 C69 C7 C70 C71 C72 C73 C74 C75 C76 C78 C79 C8 C80 C81 C82 C83 C84 C85 C86 C87 C88 C89 C9 C90 C91 C92 C93 C94 C95 C96 C97 C99 CCT CDL CEL CEN CG CGM CKG CLF CLT CMK CMQ CMT CNP CNT COU CTG CTM CTN CUR CWA CWI D03 D04 D1 D10 D11 D12 D13 D15 D16 D17 D18 D19 D2 D20 D21 D22 D23 D24 D25 D26 D27 D29 D30 D31 D32 D33 D34 D36 D41 D42 D43 D44 D45 D46 D47 D48 D49 D5 D50 D51 D52 D53 D54 D55 D56 D57 D58 D59 D6 D60 D61 D62 D63 D65 D68 D69 D73 D74 D77 D78 D80 D81 D82 D83 D85 D86 D87 D88 D89 D91 D93 D94 D95 DAA DAD DAY DB DBM DBW DD DEC DG DJ DLT DMA DMK DMO DMQ DMT DN DPC DPR DPT DRA DRI DRL DT DTN DWT DZN DZP E01 E07 E08 E09 E10 E12 E14 E15 E16 E17 E18 E19 E20 E21 E22 E23 E25 E27 E28 E30 E31 E32 E33 E34 E35 E36 E37 E38 E39 E4 E40 E41 E42 E43 E44 E45 E46 E47 E48 E49 E50 E51 E52 E53 E54 E55 E56 E57 E58 E59 E60 E61 E62 E63 E64 E65 E66 E67 E68 E69 E70 E71 E72 E73 E74 E75 E76 E77 E78 E79 E80 E81 E82 E83 E84 E85 E86 E87 E88 E89 E90 E91 E92 E93 E94 E95 E96 E97 E98 E99 EA EB EQ F01 F02 F03 F04 F05 F06 F07 F08 F10 F11 F12 F13 F14 F15 F16 F17 F18 F19 F20 F21 F22 F23 F24 F25 F26 F27 F28 F29 F30 F31 F32 F33 F34 F35 F36 F37 F38 F39 F40 F41 F42 F43 F44 F45 F46 F47 F48 F49 F50 F51 F52 F53 F54 F55 F56 F57 F58 F59 F60 F61 F62 F63 F64 F65 F66 F67 F68 F69 F70 F71 F72 F73 F74 F75 F76 F77 F78 F79 F80 F81 F82 F83 F84 F85 F86 F87 F88 F89 F90 F91 F92 F93 F94 F95 F96 F97 F98 F99 FAH FAR FBM FC FF FH FIT FL FNU FOT FP FR FS FTK FTQ G01 G04 G05 G06 G08 G09 G10 G11 G12 G13 G14 G15 G16 G17 G18 G19 G2 G20 G21 G23 G24 G25 G26 G27 G28 G29 G3 G30 G31 G32 G33 G34 G35 G36 G37 G38 G39 G40 G41 G42 G43 G44 G45 G46 G47 G48 G49 G50 G51 G52 G53 G54 G55 G56 G57 G58 G59 G60 G61 G62 G63 G64 G65 G66 G67 G68 G69 G70 G71 G72 G73 G74 G75 G76 G77 G78 G79 G80 G81 G82 G83 G84 G85 G86 G87 G88 G89 G90 G91 G92 G93 G94 G95 G96 G97 G98 G99 GB GBQ GDW GE GF GFI GGR GIA GIC GII GIP GJ GL GLD GLI GLL GM GO GP GQ GRM GRN GRO GV GWH H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H18 H19 H20 H21 H22 H23 H24 H25 H26 H27 H28 H29 H30 H31 H32 H33 H34 H35 H36 H37 H38 H39 H40 H41 H42 H43 H44 H45 H46 H47 H48 H49 H50 H51 H52 H53 H54 H55 H56 H57 H58 H59 H60 H61 H62 H63 H64 H65 H66 H67 H68 H69 H70 H71 H72 H73 H74 H75 H76 H77 H79 H80 H81 H82 H83 H84 H85 H87 H88 H89 H90 H91 H92 H93 H94 H95 H96 H98 H99 HA HAD HBA HBX HC HDW HEA HGM HH HIU HKM HLT HM HMO HMQ HMT HPA HTZ HUR HWE IA IE INH INK INQ ISD IU IUG IV J10 J12 J13 J14 J15 J16 J17 J18 J19 J2 J20 J21 J22 J23 J24 J25 J26 J27 J28 J29 J30 J31 J32 J33 J34 J35 J36 J38 J39 J40 J41 J42 J43 J44 J45 J46 J47 J48 J49 J50 J51 J52 J53 J54 J55 J56 J57 J58 J59 J60 J61 J62 J63 J64 J65 J66 J67 J68 J69 J70 J71 J72 J73 J74 J75 J76 J78 J79 J81 J82 J83 J84 J85 J87 J90 J91 J92 J93 J95 J96 J97 J98 J99 JE JK JM JNT JOU JPS JWL K1 K10 K11 K12 K13 K14 K15 K16 K17 K18 K19 K2 K20 K21 K22 K23 K26 K27 K28 K3 K30 K31 K32 K33 K34 K35 K36 K37 K38 K39 K40 K41 K42 K43 K45 K46 K47 K48 K49 K50 K51 K52 K53 K54 K55 K58 K59 K6 K60 K61 K62 K63 K64 K65 K66 K67 K68 K69 K70 K71 K73 K74 K75 K76 K77 K78 K79 K80 K81 K82 K83 K84 K85 K86 K87 K88 K89 K90 K91 K92 K93 K94 K95 K96 K97 K98 K99 KA KAT KB KBA KCC KDW KEL KGM KGS KHY KHZ KI KIC KIP KJ KJO KL KLK KLX KMA KMH KMK KMQ KMT KNI KNM KNS KNT KO KPA KPH KPO KPP KR KSD KSH KT KTN KUR KVA KVR KVT KW KWH KWN KWO KWS KWT KWY KX L10 L11 L12 L13 L14 L15 L16 L17 L18 L19 L2 L20 L21 L23 L24 L25 L26 L27 L28 L29 L30 L31 L32 L33 L34 L35 L36 L37 L38 L39 L40 L41 L42 L43 L44 L45 L46 L47 L48 L49 L50 L51 L52 L53 L54 L55 L56 L57 L58 L59 L60 L63 L64 L65 L66 L67 L68 L69 L70 L71 L72 L73 L74 L75 L76 L77 L78 L79 L80 L81 L82 L83 L84 L85 L86 L87 L88 L89 L90 L91 L92 L93 L94 L95 L96 L98 L99 LA LAC LBR LBT LD LEF LF LH LK LM LN LO LP LPA LR LS LTN LTR LUB LUM LUX LY M1 M10 M11 M12 M13 M14 M15 M16 M17 M18 M19 M20 M21 M22 M23 M24 M25 M26 M27 M29 M30 M31 M32 M33 M34 M35 M36 M37 M38 M39 M4 M40 M41 M42 M43 M44 M45 M46 M47 M48 M49 M5 M50 M51 M52 M53 M55 M56 M57 M58 M59 M60 M61 M62 M63 M64 M65 M66 M67 M68 M69 M7 M70 M71 M72 M73 M74 M75 M76 M77 M78 M79 M80 M81 M82 M83 M84 M85 M86 M87 M88 M89 M9 M90 M91 M92 M93 M94 M95 M96 M97 M98 M99 MAH MAL MAM MAR MAW MBE MBF MBR MC MCU MD MGM MHZ MIK MIL MIN MIO MIU MKD MKM MKW MLD MLT MMK MMQ MMT MND MNJ MON MPA MQD MQH MQM MQS MQW MRD MRM MRW MSK MTK MTQ MTR MTS MTZ MVA MWH N1 N10 N11 N12 N13 N14 N15 N16 N17 N18 N19 N20 N21 N22 N23 N24 N25 N26 N27 N28 N29 N3 N30 N31 N32 N33 N34 N35 N36 N37 N38 N39 N40 N41 N42 N43 N44 N45 N46 N47 N48 N49 N50 N51 N52 N53 N54 N55 N56 N57 N58 N59 N60 N61 N62 N63 N64 N65 N66 N67 N68 N69 N70 N71 N72 N73 N74 N75 N76 N77 N78 N79 N80 N81 N82 N83 N84 N85 N86 N87 N88 N89 N90 N91 N92 N93 N94 N95 N96 N97 N98 N99 NA NAR NCL NEW NF NIL NIU NL NM3 NMI NMP NPT NT NTU NU NX OA ODE ODG ODK ODM OHM ON ONZ OPM OT OZA OZI P1 P10 P11 P12 P13 P14 P15 P16 P17 P18 P19 P2 P20 P21 P22 P23 P24 P25 P26 P27 P28 P29 P30 P31 P32 P33 P34 P35 P36 P37 P38 P39 P40 P41 P42 P43 P44 P45 P46 P47 P48 P49 P5 P50 P51 P52 P53 P54 P55 P56 P57 P58 P59 P60 P61 P62 P63 P64 P65 P66 P67 P68 P69 P70 P71 P72 P73 P74 P75 P76 P77 P78 P79 P80 P81 P82 P83 P84 P85 P86 P87 P88 P89 P90 P91 P92 P93 P94 P95 P96 P97 P98 P99 PAL PD PFL PGL PI PLA PO PQ PR PS PTD PTI PTL PTN Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q29 Q3 Q30 Q31 Q32 Q33 Q34 Q35 Q36 Q37 Q38 Q39 Q40 Q41 Q42 QA QAN QB QR QTD QTI QTL QTR R1 R9 RH RM ROM RP RPM RPS RT S3 S4 SAN SCO SCR SEC SET SG SIE SM3 SMI SQ SQR SR STC STI STK STL STN STW SW SX SYR T0 T3 TAH TAN TI TIC TIP TKM TMS TNE TP TPI TPR TQD TRL TST TTS U1 U2 UB UC VA VLT VP W2 WA WB WCD WE WEB WEE WG WHR WM WSD WTT X1 YDK YDQ YRD Z11 Z9 ZP ZZ X1A X1B X1D X1F X1G X1W X2C X3A X3H X43 X44 X4A X4B X4C X4D X4F X4G X4H X5H X5L X5M X6H X6P X7A X7B X8A X8B X8C XAA XAB XAC XAD XAE XAF XAG XAH XAI XAJ XAL XAM XAP XAT XAV XB4 XBA XBB XBC XBD XBE XBF XBG XBH XBI XBJ XBK XBL XBM XBN XBO XBP XBQ XBR XBS XBT XBU XBV XBW XBX XBY XBZ XCA XCB XCC XCD XCE XCF XCG XCH XCI XCJ XCK XCL XCM XCN XCO XCP XCQ XCR XCS XCT XCU XCV XCW XCX XCY XCZ XDA XDB XDC XDG XDH XDI XDJ XDK XDL XDM XDN XDP XDR XDS XDT XDU XDV XDW XDX XDY XEC XED XEE XEF XEG XEH XEI XEN XFB XFC XFD XFE XFI XFL XFO XFP XFR XFT XFW XFX XGB XGI XGL XGR XGU XGY XGZ XHA XHB XHC XHG XHN XHR XIA XIB XIC XID XIE XIF XIG XIH XIK XIL XIN XIZ XJB XJC XJG XJR XJT XJY XKG XKI XLE XLG XLT XLU XLV XLZ XMA XMB XMC XME XMR XMS XMT XMW XMX XNA XNE XNF XNG XNS XNT XNU XNV XO1 XO2 XO3 XO4 XO5 XO6 XO7 XO8 XO9 XOA XOB XOC XOD XOE XOF XOG XOH XOI XOJ XOK XOL XOM XON XOP XOQ XOR XOS XOT XOU XOV XOW XOX XOY XOZ XP1 XP2 XP3 XP4 XPA XPB XPC XPD XPE XPF XPG XPH XPI XPJ XPK XPL XPN XPO XPP XPR XPT XPU XPV XPX XPY XPZ XQA XQB XQC XQD XQF XQG XQH XQJ XQK XQL XQM XQN XQP XQQ XQR XQS XRD XRG XRJ XRK XRL XRO XRT XRZ XSA XSB XSC XSD XSE XSH XSI XSK XSL XSM XSO XSP XSS XST XSU XSV XSW XSX XSY XSZ XT1 XTB XTC XTD XTE XTG XTI XTK XTL XTN XTO XTR XTS XTT XTU XTV XTW XTY XTZ XUC XUN XVA XVG XVI XVK XVL XVN XVO XVP XVQ XVR XVS XVY XWA XWB XWC XWD XWF XWG XWH XWJ XWK XWL XWM XWN XWP XWQ XWR XWS XWT XWU XWV XWW XWX XWY XWZ XXA XXB XXC XXD XXF XXG XXH XXJ XXK XYA XYB XYC XYD XYF XYG XYH XYJ XYK XYL XYM XYN XYP XYQ XYR XYS XYT XYV XYW XYX XYY XYZ XZA XZB XZC XZD XZF XZG XZH XZJ XZK XZL XZM XZN XZP XZQ XZR XZS XZT XZU XZV XZW XZX XZY XZZ ', concat(' ', normalize-space(@unitCode), ' '))))">[bpcbr-62]-Measure Code must reflect value from UN/ECE Recommendation N.20 "Codes for Units of Measure Used in International Trade"</assert>
    </rule>
    <rule flag="fatal" context="cac:TaxScheme/cbc:ID">
      <assert id="bpcbr-57" flag="fatal" test="( ( not(contains(normalize-space(.),' ')) and contains( ' VAT GST ',concat(' ',normalize-space(.),' ') ) ) )">[bpcbr-57]-Tax Scheme value specified is invalid.</assert>
    </rule>
  </pattern>
</schema>
