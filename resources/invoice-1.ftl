<?xml version="1.0"?>
<!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
    <!-- =================================================
        Head設定
    ================================================== -->
    <head>
        <!-- フォントのロード -->
        <#assign minchoFont="" />
        <#assign minchoBoldFont="" />
         <!--<link name="明朝体" type="font" subtype="truetype" src="${minchoFont?html}" src-bold="${minchoBoldFont?html}" bytes="2" />
		-->
        <!-- 角印のロード -->
      	<#assign image_url="http://6570575-sb1.shop.netsuite.com/core/media/media.nl?id=17342&c=6570575_SB1&h=Np4scV1Aj4cJu4EUZadIusAVPyGMIHABz3Oh2N3b_GOpuBoi" />

        <!-- ===============================
	        グローバル変数の設定
	    ================================ -->

        <!--  開発モード切り替え  -->
        <#assign development_mode=false />

        <!-- ドキュメントタイトル -->
        <#assign docTitle="INVOICE" />
        <#assign mainTitle="NIPPON MICROMETAL CORPORATION" />
      	<!-- 固定値 -->
        <#assign quantity=239.44 />
        <#assign unitPrice=5.38 />
        <#assign amount=42000.5555 />
        <#assign totalKft=5664.56 />
        <#assign totalAmount=31165.19 />
        <#assign subTotalAmount=979 />
        <#assign totalSpools=979 />
        <#assign totalNetWeightWire=4244.90 />
        <#assign totalNetWeightSpool=16643 />
        <#assign totalGrossWeight=6629 />

        <!-- ===============================
	        ヘッダー＆フッター設定
	    ================================ -->
        <macrolist>
            <!-- ヘッダー -->
            <macro id="nlheader">
                <table>
                    <tr>
                        <td align="center" class="mainTitle">
                        	${mainTitle}
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="headerMainSmlFont">
                          	158-1,Sayamagahara
                      	</td>
                    </tr>
                    <tr>
                        <td align="center" class="headerMainSmlFont">
                          	Iruma City,Saitama 358-0032,Japan
                      	</td>
                    </tr>
                    <tr>
                        <td align="center" class="headerMainSmlFont">
                          	TEL:81-4-2934-6101 FAX:81-4-2934-5454
                      	</td>
                    </tr>
                </table>
            </macro>

            <!-- フッター -->
            <macro id="nlfooter">
                <table class="footer footerAdjustment">
                	<tr>
                      	<td colspan="2">
       						<@netAndSign /> <!-- 合計、サイン -->
                      	</td>
                  	</tr>
                    <tr>
                        <td align="left">
                          	S/N No.: 22-09-603,22-09-604,22-09-605,22-09-606,22-09-607
                      	</td>
                        <td align="right">
                            <pagenumber />/<totalpages /> page
                        </td>
                    </tr>
                </table>
            </macro>
        </macrolist>

        <!-- ===============================
	        function
	    ================================ -->

        <!-- ===============================
	        macro
	    ================================ -->

        <!-- 請求書本文 -->
        <#macro invoiceBody>
            <table>
                <tr>
                    <td align="center" class="invoiceTitleAdjustment invoiceTitle">
                    	${docTitle}
                  	</td>
                    <td style="border:1px;border-right:none;">
                        <@invoiceNoDate />
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom:1px;">
                        <@shipToAndBillTo />
                    </td>
                    <td style="border-left:1px;border-bottom:1px;">
                        <@purchaseOrderAndTransport />
                    </td>
                </tr>
            </table>
        </#macro>

        <!-- 請求書番号、日付 -->
        <#macro invoiceNoDate>
            <table class="invoiceNoDate">
                <tr>
                    <td>
                      	Invoice No
                  	</td>
                    <td>
                      	<b>
                          	CU-229-046
                      	</b>
                  	</td>
                </tr>
                <tr>
                    <td>
                    	Date of Tokyo
                  	</td>
                    <td>
                      	12. Sep, 2022
                  	</td>
                </tr>
            </table>
        </#macro>

        <!-- 送り先、請求書送付先 -->
        <#macro shipToAndBillTo>
            <table class="shipToAndBillTo">
                <tr style="margin-bottom: 7pt;">
                    <td>
                        <@shipTo />
                    </td>
                </tr>
                <tr>
                    <td>
                        <@billTo />
                    </td>
                </tr>
            </table>
        </#macro>

        <!-- 送り先 -->
        <#macro shipTo>
            <table>
                <tr>
                    <td colspan="22" class="shipBillSml">
                      	&lt; SHIP TO &gt;
                  	</td>
                </tr>
                <tr>
                    <td colspan="22">
                      	<b>
                          	Amkor Assembly &#38; Test (Shanghai) Co.,Ltd.
                      	</b>
                  	</td>
                </tr>
                <tr>
                    <td colspan="22" style="padding-left:10pt;padding-top:5pt;">
                      	No.111 Yinglun Road,<br />
                        Waigaoqiao Free Trade Zone, Shanghai,<br />
                        200131 PRC China
                  	</td>
                </tr>
                <tr>
              		<td colspan="22" style="padding-left:15pt;">
                  		<@attnAndTel />
                  	</td>
              	</tr>
            </table>
        </#macro>

      	<!-- Attn & Tel -->
       	<#macro attnAndTel>
          <table style="line-height:8;margin-top:-5pt;">
            	<tr>
                    <td colspan="3">
                      	Attn:
                  	</td>
                    <td colspan="19">
                      	Ms. Alice Zhang
                  	</td>
                </tr>
                <tr>
                  	<td colspan="3"></td>
                  	<td colspan="19">
                      	Manager, Purchasing
                  	</td>
              	</tr>
                <tr>
                    <td colspan="3">
                      	Tel :
                  	</td>
                    <td colspan="19">
                      	21-50644590-4746
                  	</td>
                </tr>
          </table>
        </#macro>

        <!-- 請求書送付先 -->
        <#macro billTo>
            <table>
                <tr>
                    <td colspan="22" class="shipBillSml">
                      	&lt; BILL TO &gt;
                  	</td>
                </tr>
                <tr>
                    <td colspan="22">
                      	<b>
                          	Amkor Assembly &#38; Test (Shanghai) Co.,Ltd.
                      	</b>
                  	</td>
                </tr>
              	<tr>
              		<td colspan="22" style="padding-left:15pt;">
                  		<@attn />
                  	</td>
              	</tr>
            </table>
        </#macro>

      	<!-- Attn -->
      	<#macro attn>
            <table style="line-height:8;">
              	<tr>
                    <td colspan="3">
                      	Attn:
                  	</td>
                    <td colspan="19">
                      	Account Payable
                    </td>
                </tr>
              	<tr>
                  	<td colspan="3"></td>
                  	<td colspan="19">
                      	accountspayable@amkor.com
                  	</td>
              	</tr>
          	</table>
        </#macro>

        <!-- 発注書、輸送 -->
        <#macro purchaseOrderAndTransport>
            <table class="purchaseOrderAndTransport">
                <tr style="margin-top:3pt;">
                    <td class="poNumber">
                      	P/O No.:
                  	</td>
                    <td class="poNumber">
                      	5540122055-001
                  	</td>
                </tr>
              	<tr>
                  	<td></td>
                  	<td class="poNumberSml">
                      	5520088105-000
                  	</td>
              	</tr>
              	<tr>
                  	<td></td>
                  	<td class="poNumberSml">
                      	5520088105-000
                  	</td>
              	</tr>
                <tr style="margin-top:6pt;">
                    <td style="height:20pt;">
                      	Incoterms :
                  	</td>
                    <td>
                      	FOB Japan
                  	</td>
                </tr>
                <tr>
                    <td style="height:20pt;">
                      	Terms of Payment :
                  	</td>
                    <td>
                      	TT Net 60days
                  	</td>
                </tr>
                <tr>
                    <td>
                      	Country of Origin :
                  	</td>
                    <td>
                      	JAPAN
                  	</td>
                </tr>
                <tr>
                    <td style="height:20pt;">
                      	Country of Destination:
                  	</td>
                    <td>
                      	CHINA
                  	</td>
                </tr>
                <tr>
                    <td colspan="2">
                      	Means of Transport and Route :
                  	</td>
                </tr>
              	<tr>
                  	<td align="right" style="padding-right:20pt;">
                      	Shipped per
                  	</td>
                    <td>
                      	On or about<br />
                        AIR Freight
                  	</td>
                </tr>
                <tr>
                    <td align="right" style="padding-right:25pt;">
                      	From
                  	</td>
                    <td>
                      	Tokyo, Japan
                  	</td>
                </tr>
                <tr>
                    <td align="right" style="padding-right:35pt;">
                      	To
                  	</td>
                    <td>
                      	CHINA
                  	</td>
                </tr>
            </table>
        </#macro>

        <!-- 詳細、一覧 -->
        <#macro detailAndList>
            <table>
                <tr>
                    <td class="detailTbl">
                        <@marksAndNums />
                    </td>
                    <td class="listTbl">
                        <@list />
                    </td>
                </tr>
            </table>
        </#macro>

        <!-- 宛先 -->
        <#macro marksAndNums>
            <table>
                <tr>
                    <td class="detailAndListTopTitle">
                      	Marks and Numbers
                  	</td>
                </tr>
            </table>
            <table class="detailTdFont">
                <tr>
                    <td>
                      	I/V No.&nbsp;&nbsp; CU-229-046
                  	</td>
                </tr>
                <tr>
                    <td>
                        <img src="${image_url?html}" style="width: 30%; height: 45px; padding: 0 60px 5px 0;" />
                    </td>
                </tr>
                <tr>
                    <td>
                      	NIPPON MICROMETAL
                  	</td>
                </tr>
                <tr>
                    <td>
                      	P/O No 5540122055-001
                  	</td>
                </tr>
                <tr>
                    <td>
                      	MADE IN JAPAN
                  	</td>
                </tr>
                <tr>
                    <td>
                      	C/No&nbsp;&nbsp; 1-10
                  	</td>
                </tr>
            </table>
        </#macro>

        <!-- アイテム一覧 -->
        <#macro list>
            <table>
                <tr>
                    <td colspan="10" class="detailAndListTopTitle" align="center">
                      	Number and kind of Packages;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Description of Goods
                  	</td>
                    <td colspan="4" class="detailAndListTopTitle" align="center">
                      	Quantity
                  	</td>
                    <td colspan="4" class="detailAndListTopTitle" align="center">
                      	Unit Price
                  	</td>
                    <td colspan="4" class="detailAndListTopTitle" align="center">
                      	Amount
                  	</td>
                </tr>
                <tr>
                  	<td colspan="22">
                      	<b class="fs10">
                          	Copper Bonding Wire
                      	</b>
                      	<b class="fs8">
                          	(HS Code 7108.13)
                      	</b>
                  	</td>
                </tr>
              	<!-- 1st of list -->
                <tr class="listPoNumber">
                	<td colspan="1" class="listNumber">
                 		1:
                	</td>
                	<td colspan="9">
                      	SID No. <b>101403762</b>
                  	</td>
                	<td colspan="12">
                      	(PO No. 5540122055-001&nbsp;&nbsp;PO Item No. 10)
                  	</td>
                </tr>
                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="9">
                      	EX1p&nbsp;&nbsp; 0.9mil&nbsp;&nbsp; 3280feet/sp
                  	</td>
                	<td colspan="4">
                        ${quantity?string(",##0.00")} kft
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>
              	<!-- 2nd of list -->
                <tr class="listPoNumber">
                	<td colspan="1" class="listNumber">
                 		2:
                	</td>
                	<td colspan="9">
                      	SID No. <b>101380024</b>
                  	</td>
                	<td colspan="12">
                      	(PO No. 5540122055-001&nbsp;&nbsp;PO Item No. 20)
                  	</td>
                </tr>
                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="9">
                      	EX1p&nbsp;&nbsp; 0.7mil&nbsp;&nbsp; 6560feet/sp
                  	</td>
                	<td colspan="4">
                        4,447.68 kft
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>
              	<!-- 3rd of list -->
                <tr class="listPoNumber">
                	<td colspan="1" class="listNumber">
                 		3:
                	</td>
                	<td colspan="9">
                      	SID No. <b>101403762</b>
                  	</td>
                	<td colspan="12">
                      	(PO No. 5540122055-001&nbsp;&nbsp;PO Item No. 10)
                  	</td>
                </tr>
                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="9">
                      	EX1p&nbsp;&nbsp; 0.9mil&nbsp;&nbsp; 3280feet/sp
                  	</td>
                	<td colspan="4">
                        ${quantity?string(",##0.00")} kft
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>
              	<!-- 4th of list -->
                <tr class="listPoNumber">
                	<td colspan="1" class="listNumber">
                 		4:
                	</td>
                	<td colspan="9">
                      	SID No. <b>101403762</b>
                  	</td>
                	<td colspan="12">
                      	(PO No. 5540122055-001&nbsp;&nbsp;PO Item No. 10)
                  	</td>
                </tr>
                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="9">
                      	EX1p&nbsp;&nbsp; 0.9mil&nbsp;&nbsp; 3280feet/sp
                  	</td>
                	<td colspan="4">
                        ${quantity?string(",##0.00")} kft
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>
              	<!-- 5th of list -->
                <tr class="listPoNumber">
                	<td colspan="1" class="listNumber">
                 		5:
                	</td>
                	<td colspan="9">
                      	SID No. <b>101403762</b>
                  	</td>
                	<td colspan="12">
                      	(PO No. 5540122055-001&nbsp;&nbsp;PO Item No. 10)
                  	</td>
                </tr>
                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="9">
                      	EX1p&nbsp;&nbsp; 0.9mil&nbsp;&nbsp; 3280feet/sp
                  	</td>
                	<td colspan="4">
                        ${quantity?string(",##0.00")} kft
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>
              	<!-- 6th of list -->
                <tr class="listPoNumber">
                	<td colspan="1" class="listNumber">
                 		6:
                	</td>
                	<td colspan="9">
                      	SID No. <b>101403762</b>
                  	</td>
                	<td colspan="12">
                      	(PO No. 5540122055-001&nbsp;&nbsp;PO Item No. 10)
                  	</td>
                </tr>
                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="9">
                      	EX1p&nbsp;&nbsp; 0.9mil&nbsp;&nbsp; 3280feet/sp
                  	</td>
                	<td colspan="4">
                        ${quantity?string(",##0.00")} kft
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>
              	<!-- 7th of list -->
                <tr class="listPoNumber">
                	<td colspan="1" class="listNumber">
                 		7:
                	</td>
                	<td colspan="9">
                      	SID No. <b>101403762</b>
                  	</td>
                	<td colspan="12">
                      	(PO No. 5540122055-001&nbsp;&nbsp;PO Item No. 10)
                  	</td>
                </tr>
                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="9">
                      	EX1p&nbsp;&nbsp; 0.9mil&nbsp;&nbsp; 3280feet/sp
                  	</td>
                	<td colspan="4">
                        ${quantity?string(",##0.00")} kft
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>
              	<!-- 8th of list (spools) -->
                <tr class="spoolList">
                	<td colspan="1">
                 		8:
                	</td>
                	<td colspan="21">
                      	Spool &nbsp;&nbsp;AM-8 &nbsp;&nbsp;(No Commercial Value)
                  	</td>
                </tr>
                <tr class="spoolList">
                	<td colspan="1"></td>
                	<td colspan="9" align="center">
                      	( Made of Ni plater aluminium )
                  	</td>
                	<td colspan="4">
                        ${totalSpools?string(",##0")} spools
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>
				<!-- total -->
                <tr class="listTotal" style="border-top:1px;">
                    <td colspan="10" align="right" style="padding-right:20pt;">
                      	Total:
                  	</td>
                    <td colspan="6">
                        ${totalKft?string(",##0.00")} kft
                  	</td>
                    <td colspan="6" align="right">
                      	<b>
                          	US&#x24;${totalAmount?string(",##0.00")}
                      	</b>
                  	</td>
                </tr>
              	<tr style="line-height:5">
                  	<td colspan="10"></td>
                  	<td colspan="6" class="totalSml" style="padding-left:15pt;">
                      	(${totalSpools?string(",##0")} spools)
                  	</td>
                  	<td colspan="6" class="totalSml" align="right">
                      	(US&#x24;${subTotalAmount?string(",##0.00")} )
                  	</td>
              	</tr>
              	<tr style="line-height:5">
                  	<td colspan="16"></td>
                  	<td colspan="6" class="totalSml" align="right">
                      	(No Commercial Value)
                  	</td>
              	</tr>
            </table>
        </#macro>

        <!-- 合計、サイン -->
        <#macro netAndSign>
            <table class="netAndSign">
                <tr>
                    <td style="width:50%;">
                        <@net />
                    </td>
                    <td style="width:20%;"></td>
                    <td style="width:30%;">
                        <@sign />
                    </td>
                </tr>
            </table>
        </#macro>

        <!-- 合計 -->
        <#macro net>
            <table style="margin-top:10pt;">
                <tr>
                    <td colspan="22" style="height:25pt;">
                      	Note: Please return the spool after use
                  	</td>
                </tr>
                <tr>
                    <td colspan="17" class="pl80">
                      	Total net weight (wire)
                  	</td>
                    <td colspan="5" align="right">
                        ${totalNetWeightWire?string(",##0.00")} g
                    </td>
                </tr>
                <tr>
                    <td colspan="17" class="pl80">
                      	Total net weight (spool)
                  	</td>
                    <td colspan="5" align="right">
                        ${totalNetWeightSpool?string(",##0.00")} g
                    </td>
                </tr>
                <tr>
                    <td colspan="17" class="pl80">
                      	Total gross weight
                  	</td>
                    <td colspan="5" align="right">
                        ${totalGrossWeight?string(",##0.00")} kg
                    </td>
                </tr>
            </table>
        </#macro>

        <!-- サイン -->
        <#macro sign>
            <table>
                <tr>
                    <td align="right">
                      	NIPPON MICROMETAL CORPORATION
                  	</td>
                </tr>
                <tr>
                    <td class="signAdjust"></td>
                </tr>
                <tr>
                    <td>
                      	Yoji Kawakami
                  	</td>
                </tr>
                <tr>
                    <td>
                      	Managing Director, Sales Dept.
                  	</td>
                </tr>
            </table>
        </#macro>

        <!-- ===============================
            style（css）
        ================================ -->
        <style type="text/css">
        /*================================
            グローバルスタイル
        ================================*/
        * {
            font-family:
                明朝体,
                sans-serif;
        }

        /*
        開発用
        */
        <#if (development_mode==true)>td {
            border: 0.1px;
            border-color: red;
            text-align: center;
        }

        .dev_border {
            border: 0.1px;
            border-color: red;
        }

        </#if>

        table {
            width: 100%;
            table-layout: fixed;
        }

        .detailTbl {
            width: 25%;
        }

        .listTbl {
            width: 70%;
        }

        .mainTitle {
            font-size: 15pt;
        }

        .headerMainSmlFont {
            font-size: 10pt;
        }

        .invoiceTitle {
            font-size: 21pt;
        }

        .invoiceTitleAdjustment {
            border: 1px;
            border-right: none;
            border-left: none;
            vertical-align: middle;
            letter-spacing: 5pt;
        }

        .purchaseOrderAndTransport td {
            font-size: 9pt;
        }

        .purchaseOrderAndTransport {
            /*padding: 0 15pt;*/
          	margin-left:45pt;
          	/*padding-bottom:5pt;*/
        }

        .poNumber {
            font-weight: bold;
            font-size: 13pt !important;
          	line-height:10pt;
        }

        .poNumberSml {
            font-weight: normal;
            font-size: 11pt !important;
          	line-height:7pt;
        }

        .invoiceNoDate td {
            font-size: 11pt;
        }

        .invoiceNoDate {
          	margin-left:45pt;
        }

        .shipToAndBillTo td {
            font-size: 11pt;
        }

        .shipToAndBillTo {
            padding-left: 5pt;
            padding-right: 10pt;
        }

        .shipBillSml {
            font-size:8pt !important;
          	font-weight:400;
        }

        .detailAndListTopTitle {
            font-size: 7.5pt;
        }

        .detailTdFont td {
            font-size: 10pt;
        }

        .detailTdFont {
            border: 1px;
            margin: 10pt 10pt 10pt 0pt;
            padding: 5pt;
        }

        .listTotal,
        .listPoNumber,
        .listPrice td {
            font-size: 10pt;
        }

        .listPrice {
            margin-bottom: 5pt;
        }

        .totalSml {
            font-size: 7pt;
        }

        .fs10 {
            font-size: 10pt !important;
        }

        .fs8 {
            font-size: 8pt !important;
        }

        .pl8 {
            padding-left: 8pt;
        }

        .netAndSign td{
            font-size: 8pt;
        }

        .pl80 {
            padding-left: 80pt;
        }

        .footerAdjustment {
            width: 100%;
            font-size: 7pt;
        }

        .signAdjust {
            height: 35pt;
            border-bottom: 1px;
            margin-bottom: 5pt;
            margin-left: -25pt;
        }

        .spoolList td{
         	font-size:9pt;
        }

        .listNumber{
            font-size:9pt;
        }
        </style>
    </head>
    <!-- =================================================
        Body設定
    ================================================== -->

    <body header="nlheader" header-height="9%" footer="nlfooter" footer-height="10pt" padding="0.5in 0.5in 0.3in 0.5in" size="A4">
        <@invoiceBody />
        <@detailAndList />
        <@netAndSign />
    </body>
</pdf>
