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
        <!--
        <link name="明朝体" type="font" subtype="truetype" src="${minchoFont?html}" src-bold="${minchoBoldFont?html}" bytes="2" />
		 -->
        <!-- 角印のロード -->
      	<#assign image_url="http://6570575-sb1.shop.netsuite.com/core/media/media.nl?id=17342&c=6570575_SB1&h=Np4scV1Aj4cJu4EUZadIusAVPyGMIHABz3Oh2N3b_GOpuBoi" />

        <!-- ===============================
	        グローバル変数の設定
	    ================================ -->

        <!--  開発モード切り替え  -->
        

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
                        <td align="center" class="mainTitle" colspan="2">
                        	${mainTitle}
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="headerMainSmlFont" colspan="2">
                          	158-1,Sayamagahara
                      	</td>
                    </tr>
                    <tr>
                        <td align="center" class="headerMainSmlFont" colspan="2">
                          	Iruma City,Saitama 358-0032,Japan
                      	</td>
                    </tr>
                    <tr style="margin-bottom: 4pt;">
                        <td align="center" class="headerMainSmlFont" colspan="2">
                          	TEL:81-4-2934-6101 FAX:81-4-2934-5454
                      	</td>
                    </tr>
                  	<tr>
                    	<td align="center" class="invoiceTitle">
                    		${docTitle}
                  		</td>
                        <td style="border: 1px; border-right: none;">
                            <@invoiceNoDate /> <!-- 請求書番号、日付 -->
                        </td>
               	 	</tr>
                </table>
            </macro>

            <!-- フッター -->
            <macro id="nlfooter">
                <table class="footer">
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
                    <td style="border-bottom: 1px;">
                        <@shipToAndBillTo /> <!-- 送り先、請求書送付先 -->
                    </td>
                    <td style="border-left: 1px; border-bottom: 1px;">
                        <@purchaseOrderAndTransport /> <!-- 発注書、輸送 -->
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
                <tr>
                    <td>
                        <@shipTo /> <!-- 送り先 -->
                    </td>
                </tr>
                <tr style="margin-top: 7pt;">
                    <td>
                        <@billTo /> <!-- 請求書送付先 -->
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
                    <td colspan="22" class="pl13">
                      	<b>
                          	Carsem (M) Sdn. Bhd. (124522-U)
                      	</b>
                  	</td>
                </tr>
                <tr>
                    <td colspan="22" class="pl22">
                      	Jalan Lapangan Terbang,<br />
 						31350 Ipoh, Perak, Malaysia (M-Site)
                  	</td>
                </tr>
                <tr>
              		<td colspan="22" class="pl27">
                  		<@attnAndTel /> <!-- Attn & Tel -->
                  	</td>
              	</tr>
            </table>
        </#macro>

      	<!-- Attn & Tel -->
       	<#macro attnAndTel>
          <table style="line-height: 8; margin-top: 5pt;">
            	<tr>
                    <td colspan="3">
                      	Attn:
                  	</td>
                    <td colspan="19">
                      	Ms. Lee Fee Ching
                  	</td>
                </tr>
                <tr>
                    <td colspan="3">
                      	Tel :
                  	</td>
                    <td colspan="19">
                      	605-3123333
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
                    <td colspan="22" class="pl13">
                      	<b>
                          	Carsem (M) Sdn. Bhd. (124522-U)
                      	</b>
                  	</td>
                </tr>
              	<tr>
                    <td colspan="22" class="pl22">
                      	Jalan Lapangan Terbang,<br />
 						31350 Ipoh, Perak, Malaysia (M-Site)
                  	</td>
                </tr>
              	<tr>
              		<td colspan="22" class="pl27">
                  		<@attnAndTel />	<!-- Attn & Tel -->
                  	</td>
              	</tr>
            </table>
        </#macro>

        <!-- 発注書、輸送 -->
        <#macro purchaseOrderAndTransport>
            <table class="purchaseOrderAndTransport">
                <tr style="margin-top: 3pt;">
                    <td class="poNumber">
                      	P/O No.:
                  	</td>
                    <td class="poNumber">
                      	C00291050
                  	</td>
                </tr>
              	<tr>
                  	<td></td>
                  	<td class="poNumberSml">
                      	C00291000
                  	</td>
              	</tr>
              	<tr>
                  	<td></td>
                  	<td class="poNumberSml">
                      	C00291000
                  	</td>
              	</tr>
                <tr style="margin-top: 6pt;">
                    <td style="height: 20pt;">
                      	Incoterms :
                  	</td>
                    <td>
                      	EX Works
                  	</td>
                </tr>
                <tr>
                    <td style="height: 20pt;">
                      	Terms of Payment :
                  	</td>
                    <td>
                      	45 days TT remittance
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
                    <td style="height: 20pt;">
                      	Country of Destination:
                  	</td>
                    <td>
                      	MALAYSIA
                  	</td>
                </tr>
                <tr>
                    <td colspan="2">
                      	Means of Transport and Route :
                  	</td>
                </tr>
              	<tr>
                  	<td align="right" style="padding-right: 20pt;">
                      	Shipped per
                  	</td>
                    <td>
                      	On or about<br />
                        AIR Freight
                  	</td>
                </tr>
                <tr>
                    <td align="right" style="padding-right: 25pt;">
                      	From
                  	</td>
                    <td>
                      	Tokyo, Japan
                  	</td>
                </tr>
                <tr>
                    <td align="right" style="padding-right: 35pt;">
                      	To
                  	</td>
                    <td>
                      	MALAYSIA
                  	</td>
                </tr>
            </table>
        </#macro>

        <!-- 詳細、一覧 -->
        <#macro detailAndList>
            <table>
                <tr>
                    <td class="detailTbl">
                        <@marksAndNums /> <!-- 詳細 -->
                    </td>
                    <td class="listTbl"> <!-- 一覧 -->
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
            <table class="detailTd">
                <tr>
                    <td>
                      	I/V No.&nbsp;&nbsp; CU-229-039
                  	</td>
                </tr>
                <tr>
                    <td>
                        <img src="${image_url?html}" style="width: 30%; height: 45px; padding-right: 5px;" />
                    </td>
                </tr>
                <tr>
                    <td>
                      	NIPPON MICROMETAL
                  	</td>
                </tr>
                <tr>
                    <td>
                      	P/O No.&nbsp;&nbsp; C00291050
                  	</td>
                </tr>
                <tr>
                    <td>
                      	MADE IN JAPAN
                  	</td>
                </tr>
                <tr>
                    <td>
                      	C/No. &nbsp;&nbsp; 1 - 3
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

                <tr class="mt6">
                  	<td colspan="22">
                      	<b class="fs10">
                          	Copper Wire
                      	</b>
                      	<b class="fs8">
                          	(Tariff code/HS Code 7408 19 0000)
                      	</b>
                  	</td>
                </tr>

              	<!-- 1番目のアイテム -->
                <tr class="listPoNumber">
                	<td colspan="1" class="listNumber">
                 		1:
                	</td>
                	<td colspan="9">
                      	P/No. <b>101403</b>
                  	</td>
                	<td colspan="12">
                      	<span class="descSml">
                          	Description
                      	</span>
                      	: W1.0-1118-CU-WN8-EX1-NMC
                  	</td>
                </tr>

                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="9" class="pl9">
                      	EX1p&nbsp;&nbsp; 1.0mil&nbsp;&nbsp; 3.28KFT/sp
                  	</td>
                	<td colspan="4" class="pl16">
                        ${quantity?string(",##0.00")} kft
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      	US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>

              	<!-- 2番目のアイテム -->
                <tr class="listPoNumber">
                	<td colspan="1" class="listNumber">
                 		2:
                	</td>
                	<td colspan="9">
                      	P/No. <b>101380</b>
                  	</td>
                	<td colspan="12">
                      	<span class="descSml">
                          	Description
                      	</span>
                      	: W0.8-0817-CU-WN8-EX1-NMC
                  	</td>
                </tr>
                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="9" class="pl9">
                      	EX1p&nbsp;&nbsp; 0.8mil&nbsp;&nbsp; 3.28KFT/sp
                  	</td>
                	<td colspan="4" class="pl16">
                        101.68 kft
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      	US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>

              	<!-- 3番目のアイテム -->
                <tr class="listPoNumber">
                	<td colspan="1" class="listNumber">
                 		3:
                	</td>
                	<td colspan="9">
                      	P/No. <b>439735</b>
                  	</td>
                	<td colspan="12">
                      	<span class="descSml">
                          	Description
                        </span>
                        : W1.2-1322-CU-WN8-EX1-NMC
                  	</td>
                </tr>
                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="9" class="pl9">
                      	EX1p&nbsp;&nbsp; 1.2mil&nbsp;&nbsp; 3.28KFT/sp
                  	</td>
                	<td colspan="4" class="pl16">
                        ${quantity?string(",##0.00")} kft
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      	US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>

              	<!-- 4番目のアイテム -->
                <tr class="listPoNumber">
                	<td colspan="1" class="listNumber">
                 		4:
                	</td>
                	<td colspan="9">
                      	P/No. <b>101407</b>
                  	</td>
                	<td colspan="12">
                      	<span class="descSml">
                          	Description
                        </span>
                        : W0.9-1322-CU-WN8-EX1-NMC
                  	</td>
                </tr>
                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="9" class="pl9">
                      	EX1p&nbsp;&nbsp; 0.9mil&nbsp;&nbsp; 3.28KFT/sp
                  	</td>
                	<td colspan="4" class="pl16">
                        ${quantity?string(",##0.00")} kft
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      	US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>

              	<!-- 5番目のアイテム -->
                <tr class="listPoNumber">
                	<td colspan="1" class="listNumber">
                 		5:
                	</td>
                	<td colspan="9">
                      	P/No. <b>101403</b>
                  	</td>
                	<td colspan="12">
                      	<span class="descSml">
                          	Description
                        </span>
                        : W0.9-1322-CU-WN8-EX1-NMC
                  	</td>
                </tr>
                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="9" class="pl9">
                      	EX1p&nbsp;&nbsp; 0.9mil&nbsp;&nbsp; 3.28KFT/sp
                  	</td>
                	<td colspan="4" class="pl16">
                        ${quantity?string(",##0.00")} kft
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      	US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>

              	<!-- 6番目のアイテム -->
                <tr class="listPoNumber">
                	<td colspan="1" class="listNumber">
                 		6:
                	</td>
                	<td colspan="9">
                      	P/No. <b>101403</b>
                  	</td>
                	<td colspan="12">
                      	<span class="descSml">
                          	Description
                      	</span>
                      	: W0.9-1322-CU-WN8-EX1-NMC
                  	</td>
                </tr>
                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="9" class="pl9">
                      	EX1p&nbsp;&nbsp; 0.9mil&nbsp;&nbsp; 3.28KFT/sp
                  	</td>
                	<td colspan="4" class="pl16">
                        ${quantity?string(",##0.00")} kft
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      	US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>

              	<!-- 7番目のアイテム -->
                <tr class="listPoNumber">
                	<td colspan="1" class="listNumber">
                 		7:
                	</td>
                	<td colspan="9">
                      	P/No. <b>101403</b>
                  	</td>
                	<td colspan="12">
                      	<span class="descSml">
                          	Description
                      	</span>
                      	: W0.9-1322-CU-WN8-EX1-NMC
                  	</td>
                </tr>
                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="9" class="pl9">
                      	EX1p&nbsp;&nbsp; 0.9mil&nbsp;&nbsp; 3.28KFT/sp
                  	</td>
                	<td colspan="4" class="pl16">
                        ${quantity?string(",##0.00")} kft
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      	US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>

              	<!-- 8番目のアイテム (spools) -->
                <tr class="listPoNumber">
                	<td colspan="1" class="listNumber">
                 		8:
                	</td>
                	<td colspan="9">
                      	P/No. <b>101403</b>
                  	</td>
                	<td colspan="12">
                      	<span class="descSml">
                          	Description
                      	</span>
                      	: W0.9-1322-CU-WN8-EX1-NMC
                  	</td>
                </tr>
                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="9" class="pl9">
                      	EX1p&nbsp;&nbsp; 0.9mil&nbsp;&nbsp; 3.28KFT/sp
                  	</td>
                	<td colspan="4" class="pl16">
                        ${quantity?string(",##0.00")} kft
                	</td>
                	<td colspan="4">
                      	&#x40;us&#x24;${unitPrice?string(",##0.00")}
                	</td>
                	<td colspan="4">
                      	US&#x24;${amount?string(",##0.00")}
                	</td>
                </tr>

				<!-- 合計 -->
                <tr class="listTotal" style="border-top: 1px;">
                    <td colspan="10" align="right" style="padding-right: 20pt;">
                      	Total:
                  	</td>
                    <td colspan="6" class="pl9">
                        ${totalKft?string(",##0.00")} kft
                  	</td>
                    <td colspan="6" align="right">
                      	<b>
                          	US&#x24;${totalAmount?string(",##0.00")}
                      	</b>
                  	</td>
                </tr>
            </table>
        </#macro>

        <!-- 合計、サイン -->
        <#macro netAndSign>
            <table class="netAndSign">
                <tr>
                    <td style="width: 50%;">
                        <@net /> <!-- 合計 -->
                    </td>
                    <td style="width: 17%;"></td>
                    <td style="width: 33%;">
                        <@sign /> <!-- サイン -->
                    </td>
                </tr>
            </table>
        </#macro>

        <!-- 合計 -->
        <#macro net>
            <table style="margin-top: 10pt;">
                <tr>
                    <td colspan="22" style="height: 25pt;">
                      	Note: Please return the spool after use
                  	</td>
                </tr>
                <tr>
                    <td colspan="17" class="pl80">
                      	Total net weight
                  	</td>
                    <td colspan="5" align="right">
                        ${totalNetWeightWire?string(",##0.00")} g
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

      	<!-- barcode pdf417 -->
      	<#macro barcodePdf417>
              <table class="barcodeTbl">

                	<!-- 1st barcode -->
					<tr style="margin-top: 25pt;">
						<td>
                            <barcode codetype="pdf417" showtext="true" height="20" width="180" value="1P439732*DW1.0-1118-CU-WN8-EX1-NMC*L220902-2902C-NMC*Q252.56*PC00291050*ICU-229-039*N1OF1*E20230228"/>
                        </td>
					</tr>
                    <tr>
                      	<td class="barcodeSerialNumber">
                        	1P439732*DW1.0-1118-CU-WN8-EX1-NMC*L220902-2902C-NMC*Q252.56*PC00291050*ICU-229-039*N1OF1*E20230228
                        </td>
                    </tr>

                	<!-- 2nd barcode -->
                	<tr style="margin-top: 25pt;">
						<td>
                            <barcode codetype="pdf417" showtext="true" height="20" width="180" value="1P439732*DW1.0-1118-CU-WN8-EX1-NMC*L220902-2902C-NMC*Q252.56*PC00291050*ICU-229-039*N1OF1*E20230228"/>
                        </td>
					</tr>
                    <tr>
                      	<td class="barcodeSerialNumber">
                            1P439732*DW1.0-1118-CU-WN8-EX1-NMC*L220902-2902C-NMC*Q252.56*PC00291050*ICU-229-039*N1OF1*E20230228
                        </td>
                    </tr>

                	<!-- 3rd barcode -->
                	<tr style="margin-top: 25pt;">
						<td>
                            <barcode codetype="pdf417" showtext="true" height="20" width="180" value="1P439732*DW1.0-1118-CU-WN8-EX1-NMC*L220902-2902C-NMC*Q252.56*PC00291050*ICU-229-039*N1OF1*E20230228"/>
                        </td>
					</tr>
                    <tr>
                      	<td class="barcodeSerialNumber">
                            1P439732*DW1.0-1118-CU-WN8-EX1-NMC*L220902-2902C-NMC*Q252.56*PC00291050*ICU-229-039*N1OF1*E20230228
                        </td>
                    </tr>

                	<!-- 4th barcode -->
                	<tr style="margin-top: 25pt;">
						<td>
                            <barcode codetype="pdf417" showtext="true" height="20" width="180" value="1P439732*DW1.0-1118-CU-WN8-EX1-NMC*L220902-2902C-NMC*Q252.56*PC00291050*ICU-229-039*N1OF1*E20230228"/>
                        </td>
					</tr>
                    <tr>
                      	<td class="barcodeSerialNumber">
                            1P439732*DW1.0-1118-CU-WN8-EX1-NMC*L220902-2902C-NMC*Q252.56*PC00291050*ICU-229-039*N1OF1*E20230228
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
          	margin-bottom: -2pt;
        }

        .headerMainSmlFont {
            font-size: 10pt;
          	line-height: 9pt;
        }

        .invoiceTitle {
            font-size: 21pt;
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
          	margin-left: 45pt;
          	/*padding-bottom:5pt;*/
        }

        .poNumber {
            font-weight: bold;
            font-size: 13pt !important;
          	line-height: 10pt;
        }

        .poNumberSml {
            font-weight: normal;
            font-size: 11pt !important;
          	line-height: 7pt;
        }

        .invoiceNoDate td {
            font-size: 10pt;
        }

        .invoiceNoDate {
          	margin-left: 45pt;
        }

        .shipToAndBillTo td {
            font-size: 11pt;
        }

        .shipToAndBillTo {
            padding-left: 5pt;
            padding-right: 20pt;
        }

        .shipBillSml {
            font-size: 8pt !important;
          	font-weight: 400;
        }

        .detailAndListTopTitle {
            font-size: 7.5pt;
        }

        .detailTd td {
            font-size: 10pt;
        }

        .detailTd {
            border: 1px;
            margin: 10pt 10pt 10pt 0pt;
            padding: 5pt 5pt 5pt 10pt;
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

        .fs11 {
            font-size: 11pt !important;
        }

        .fs10 {
            font-size: 10pt !important;
        }

        .fs8 {
            font-size: 8pt !important;
        }

        .pl80 {
            padding-left: 80pt;
        }

        .pl22 {
            padding-left: 22pt;
        }

        .pl27 {
            padding-left: 27pt;
        }

        .pl16 {
            padding-left: 16pt;
        }

        .pl13 {
            padding-left: 13pt;
        }

        .pl9 {
            padding-left: 9pt;
        }

        .pl8 {
            padding-left: 8pt;
        }

        .mt6 {
            margin-top: 6pt;
        }

        .netAndSign td {
            font-size: 9pt;
        }

        .netAndSign {
            margin-top: 10pt;
        }

        .footer {
            width: 100%;
            font-size: 7pt;
        }

        .signAdjust {
            height: 35pt;
            border-bottom: 1px;
            margin-bottom: 5pt;
        }

        .spoolList td{
         	font-size: 9pt;
        }

        .listNumber{
            font-size: 9pt;
        }

        .barcodeTbl{
          	margin-left: 30pt;
        }

        .barcodeSerialNumber{
          	margin-top: 0.5pt;
            font-size: 7pt;
        }

        .descSml{
            font-size: 9pt;
        }
        </style>
    </head>

    <!-- =================================================
        Body設定
    ================================================== -->
    <body header="nlheader" header-height="12%" footer="nlfooter" footer-height="10pt" padding="0.5in 0.5in 0.3in 0.5in" size="A4">
        <@invoiceBody />
        <@detailAndList />
        <@netAndSign />
      	<pbr /> <!-- page break -->
      	<@barcodePdf417 />
    </body>
</pdf>