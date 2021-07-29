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
<!-- Schematron rules generated automatically by Validex Generator Midran ltd -->
<!-- Abstract rules for model -->
<!-- Timestamp: 2020-02-11 12:09:22 +0200 -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="model">
  <rule context="$Additional_supporting_documents">
    <assert test="$bpcbr-06" flag="fatal" id="bpcbr-06">[bpcbr-06]-Scheme Identifier does not exist when Invoiced Object Identifier is provided.</assert>
  </rule>
  <rule context="$Amount_due">
  </rule>
  <rule context="$Buyer_electronic_address">
  </rule>
  <rule context="$Buyer_postal_address">
    <assert test="$bpcbr-27" flag="fatal" id="bpcbr-27">[bpcbr-27]-Customer - Accounts Payable Post Code must exist exactly once.</assert>
    <assert test="$bpcbr-28" flag="fatal" id="bpcbr-28">[bpcbr-28]-Customer - Accounts Payable Country Subdivision must exist exactly once.</assert>
  </rule>
  <rule context="$Buyer">
    <assert test="$bpcbr-24" flag="fatal" id="bpcbr-24">[bpcbr-24]-Cannot have more than one Customer - Accounts Payable Trading Name.</assert>
    <assert test="$bpcbr-25" flag="fatal" id="bpcbr-25">[bpcbr-25]-More than one Customer - Accounts Payable Trading Name exists.</assert>
    <assert test="$bpcbr-26" flag="fatal" id="bpcbr-26">[bpcbr-26]-Cannot have more than one Customer - Accounts Payable Legal Registration Identifier.</assert>
    <assert test="$bpcbr-29" flag="fatal" id="bpcbr-29">[bpcbr-29]-Cannot have more than one Customer - Buyer Trading Name</assert>
    <assert test="$bpcbr-30" flag="fatal" id="bpcbr-30">[bpcbr-30]-Cannot have more than one Customer - Buyer Identifier</assert>
    <assert test="$bpcbr-31" flag="fatal" id="bpcbr-31">[bpcbr-31]-Scheme Identifier must exist if Customer - Buyer Identifier is provided.</assert>
    <assert test="$bpcbr-32" flag="fatal" id="bpcbr-32">[bpcbr-32]-Cannot have more than one Customer - Buyer legal registration identifier</assert>
    <assert test="$bpcbr-33" flag="fatal" id="bpcbr-33">[bpcbr-33]-Scheme Identifier must exist if Customer - Buyer Legal Registration Identifier is provided.</assert>
  </rule>
  <rule context="$Deliver_to_address">
  </rule>
  <rule context="$Document_level_allowances">
  </rule>
  <rule context="$Document_level_charges">
  </rule>
  <rule context="$Document_totals">
  </rule>
  <rule context="$Invoice">
    <assert test="$bpcbr-02" flag="fatal" id="bpcbr-02">[bpcbr-02]-Cannot have more than one project reference.</assert>
    <assert test="$bpcbr-03" flag="fatal" id="bpcbr-03">[bpcbr-03]-Cannot have more than one contract number.</assert>
    <assert test="$bpcbr-04" flag="fatal" id="bpcbr-04">[bpcbr-04]-Cannot have more than one proof of delivery reference.</assert>
    <assert test="$bpcbr-05" flag="fatal" id="bpcbr-05">[bpcbr-05]-More than one Invoice Object Identifier exists.</assert>
    <assert test="$bpcbr-09" flag="fatal" id="bpcbr-09">[bpcbr-09]-Cannot have more than one invoicing period.</assert>
    <assert test="$bpcbr-10" flag="fatal" id="bpcbr-10">[bpcbr-10]-Business process type must reflect a BPC identifier.</assert>
    <assert test="$bpcbr-11" flag="fatal" id="bpcbr-11">[bpcbr-11]-Session Identifier must exist exactly once.</assert>
    <assert test="$bpcbr-13" flag="fatal" id="bpcbr-13">[bpcbr-13]-Cannot have more than one Supplier - Accounts Receivable Identifier.</assert>
    <assert test="$bpcbr-23" flag="fatal" id="bpcbr-23">[bpcbr-23]-Customer - Accounts Payable must exist exactly once.</assert>
    <assert test="$bpcbr-34" flag="fatal" id="bpcbr-34">[bpcbr-34]-Cannot have more than one Deliver to party name.</assert>
    <!-- <assert test="$bpcbr-35" flag="fatal" id="bpcbr-35">[bpcbr-35]-Cannot be more than one Payment Instructions</assert>  Removed from BPC -->
    <assert test="$bpcbr-39" flag="fatal" id="bpcbr-39">[bpcbr-39]-Payment Account Identifier must exist if Credit Transfer information is provided.</assert>
    <assert test="$bpcbr-40" flag="fatal" id="bpcbr-40">[bpcbr-40]-Payment card primary account number must exist exactly once if Payment Card Information is provided.</assert>
    <assert test="$bpcbr-41" flag="fatal" id="bpcbr-41">[bpcbr-41]-Cannot have more than one Bank Assigned Creditor Identifier.</assert>
    <assert test="$bpcbr-42" flag="fatal" id="bpcbr-42">[bpcbr-42]-Discount  indicator must exist</assert>
    <assert test="$bpcbr-43" flag="fatal" id="bpcbr-43">[bpcbr-43]-Document level discount tax category code must reflect values from United Nations Economic Commission for Europe (UNECE) – (UNTDID) D. 16B – Duty or tax or fee category code (Subset of UNCL5305)</assert>
    <assert test="$bpcbr-44" flag="fatal" id="bpcbr-44">[bpcbr-44]-Cannot have more than one Document level discount tax rate</assert>
    <assert test="$bpcbr-45" flag="fatal" id="bpcbr-45">[bpcbr-45]-Charge indicator must exist</assert>
    <assert test="$bpcbr-46" flag="fatal" id="bpcbr-46">[bpcbr-46]-Document level charge tax category code value must reflect United Nations Economic Commission for Europe (UNECE) – (UNTDID) D. 16B – Duty or tax or fee category code (Subset of UNCL5305).</assert>
    <assert test="$bpcbr-47" flag="fatal" id="bpcbr-47">[bpcbr-47]-Document level charge reason code value must reflect United Nations Economic Commission for Europe (UNECE) - (UNTDID) – D.18A – Element 5189 (Allowance or charge identification code)</assert>
    <assert test="$bpcbr-48" flag="fatal" id="bpcbr-48">[bpcbr-48]-Tax Breakdown information must exist.</assert>
    <assert test="$bpcbr-49" flag="fatal" id="bpcbr-49">[bpcbr-49]-Tax Category taxable amount must exist.</assert>
    <assert test="$bpcbr-50" flag="fatal" id="bpcbr-50">[bpcbr-50]-Tax amount must equal to the taxable amount times the taxable rate, rounded to two decimals.</assert>
    <assert test="$bpcbr-51" flag="fatal" id="bpcbr-51">[bpcbr-51]-Tax category code must reflect value from United Nations Economic Commission for Europe (UNECE) – (UNTDID) D. 16B – Duty or tax or fee category code (Subset of UNCL5305)</assert>
    <assert test="$bpcbr-52" flag="fatal" id="bpcbr-52">[bpcbr-52]-More than one Tax Exemption Reason Text entry exists.</assert>
    <assert test="$bpcbr-53" flag="fatal" id="bpcbr-53">[bpcbr-53]-Attached document filename must exist exactly once.</assert>
    <assert test="$bpcbr-54" flag="fatal" id="bpcbr-54">[bpcbr-54]-Purchase Order Line Number must exist exactly once.</assert>
    <assert test="$bpcbr-55" flag="fatal" id="bpcbr-55">[bpcbr-55]-Delivery identifier must exist.</assert>
    <assert test="$bpcbr-56" flag="fatal" id="bpcbr-56">[bpcbr-56]-Tax Category Code must reflect value from United Nations Economic Commission for Europe (UNECE) – (UNTDID) D. 16B – Duty or tax or fee category code (Subset of UNCL5305)</assert>
    <assert test="$bpcbr-57" flag="fatal" id="bpcbr-57">[bpcbr-57]-Tax Scheme value specified is invalid.</assert>
    <assert test="$bpcbr-58" flag="fatal" id="bpcbr-58">[bpcbr-58]- More than one Invoice Period Line exists.</assert>
    <assert test="$bpcbr-59" flag="fatal" id="bpcbr-59">[bpcbr-59]- Price Details must exist exactly once.</assert>
    <assert test="$bpcbr-60" flag="fatal" id="bpcbr-60">[bpcbr-60]-Cannot have more than one item price discount.</assert>
    <assert test="$bpcbr-61" flag="fatal" id="bpcbr-61">[bpcbr-61]-Cannot have more than one item gross price.</assert>
    <assert test="$bpcbr-62" flag="fatal" id="bpcbr-62">[bpcbr-62]-Item Price Base Quanitity Unit of Measure Code must reflect value from UN/ECE Recommendation N.20 "Codes for Units of Measure Used in International Trade"</assert>
    <assert test="$bpcbr-63" flag="fatal" id="bpcbr-63">[bpcbr-63]-Code must be equal to Invoiced Quantity Unit of Measure Code.</assert>
    <assert test="$bpcbr-64" flag="fatal" id="bpcbr-64">[bpcbr-64]-Code must be equal to Credited Quantity Unit of Measure Code.</assert>
    <assert test="$bpcbr-65" flag="fatal" id="bpcbr-65">[bpcbr-65]-Invoiced Item Tax Rate and Per Unit Tax Amount are mutually exclusive.</assert>
    <assert test="$bpcbr-66" flag="fatal" id="bpcbr-66">[bpcbr-66]-Invoiced Item Tax Category Code must reflect value from United Nations Economic Commission for Europe (UNECE) – (UNTDID) D. 16B – Duty or tax or fee category code (Subset of UNCL5305)</assert>
    <assert test="$bpcbr-67" flag="fatal" id="bpcbr-67">[bpcbr-67]-Invoiced Item Tax Scheme Identifier must reflect value from United Nations Economic Commission for Europe (UNECE) – (UNTDID) D. 18A – Usage of Element 5153 (Duty/tax/fee)</assert>
    <assert test="$bpcbr-68" flag="fatal" id="bpcbr-68">[bpcbr-68]-Product/service code OR Product/service description is mandatory. </assert>
    <assert test="$bpcbr-69" flag="fatal" id="bpcbr-69">[bpcbr-69]-Lot identification number is not specified or exists more than once.</assert>
  </rule>
  <rule context="$Invoice_line_allowances">
  </rule>
  <rule context="$Invoice_line_charges">
  </rule>
  <rule context="$Invoice_Line_Period">
  </rule>
  <rule context="$Invoice_Period">
  </rule>
  <rule context="$Item_attributes">
  </rule>
  <rule context="$Item_classification_identifier">
  </rule>
  <rule context="$Item_standard_identifier">
  </rule>
  <rule context="$Payee">
    <assert test="$bpcbr-20" flag="fatal" id="bpcbr-20">[bpcbr-10]-Scheme Identifier must exist if Supplier - Seller Identifier is provided.</assert>
    <assert test="$bpcbr-21" flag="fatal" id="bpcbr-21">[bpcbr-21]-Cannot have more than one Supplier - Seller legal registration identifier.</assert>
  </rule>
  <rule context="$Payment_instructions">
    <assert test="$bpcbr-07" flag="fatal" id="bpcbr-07">[bpcbr-07]-If Payment Terms Discount Percent or Payment Terms Discount Amount or Basis for Terms Discount exist, then all three elements must exist.</assert>
    <assert test="$bpcbr-08" flag="fatal" id="bpcbr-08">[bpcbr-08]-Payment Terms Discount Amount must be equal to Payment Terms Discount Percent times Basis for Terms Discount.</assert>
  </rule>
  <rule context="$Payment_means">
    <assert test="$bpcbr-36" flag="fatal" id="bpcbr-36">[bpcbr-36]-If the Payment means type code needs an account, the Payment account identifier must exist.</assert>
    <assert test="$bpcbr-37" flag="fatal" id="bpcbr-37">[bpcbr-37]-Cannot have more than one payment method text entry.</assert>
    <assert test="$bpcbr-38" flag="fatal" id="bpcbr-38">[bpcbr-38]-Cannot have more than one remittance requirement information entry.</assert>
  </rule>
  <rule context="$Document_status">
    <assert test="$bpcbr-12" flag="fatal" id="bpcbr-12">[bpcbr-12]-Value must exist in code list UNECE-1373.</assert>
  </rule>
  <rule context="$Seller">
    <assert test="$bpcbr-16" flag="fatal" id="bpcbr-16">[bpcbr-16]-Supplier - Accounts Receivable Postal Address must exist exactly once.</assert>
    <assert test="$bpcbr-17" flag="fatal" id="bpcbr-17">[bpcbr-17]-Supplier - Accounts Reivable Post Code must exist exactly once.</assert>
    <assert test="$bpcbr-18" flag="fatal" id="bpcbr-18">[bpcbr-18]-Supplier - Accounts Reivable Country Subdivision must exist exactly once.</assert>
    <assert test="$bpcbr-19" flag="fatal" id="bpcbr-19">[bpcbr-19]-Cannot have more than one Supplier - Seller Identifier.</assert>
    <assert test="$bpcbr-22" flag="fatal" id="bpcbr-22">[bpcbr-22]-Scheme Identifier must exist if Supplier - Seller Legal Registration Identifier is provided.</assert>    
  </rule>
  <rule context="$Seller_party_identification">
    <assert test="$bpcbr-14" flag="fatal" id="bpcbr-14">[bpcbr-14]-Scheme Identifier must exist if Supplier - Accounts Receivable Identifier is provided.</assert>
  </rule>
  <rule context="$Seller_party_legal_entity">
    <assert test="$bpcbr-15" flag="fatal" id="bpcbr-15">[bpcbr-15]-Scheme Identifier must exist if Supplier - Accounts Receivable Legal Registration Identifier is provided.</assert>
  </rule>
  <rule context="$Seller_electronic_address">
  </rule>
  <rule context="$Seller_postal_address">
  </rule>
  <rule context="$Tax_Representative">
  </rule>
  <rule context="$Tax_Representative_postal_address">
  </rule>
  <rule context="$Tax_Total">
  </rule>
</pattern>
