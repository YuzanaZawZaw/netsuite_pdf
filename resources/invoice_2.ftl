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
        <#--  <link name="明朝体" type="font" subtype="truetype" src="${minchoFont?html}" src-bold="${minchoBoldFont?html}" bytes="2" />  -->

        <!-- 角印のロード -->
      	<#assign image_url="http://6570575-sb1.shop.netsuite.com/core/media/media.nl?id=17342&c=6570575_SB1&h=Np4scV1Aj4cJu4EUZadIusAVPyGMIHABz3Oh2N3b_GOpuBoi" />

        <!-- ===============================
	        グローバル変数の設定
	    ================================ -->

        <!--  開発モード切り替え  -->
        <#assign development_mode=true />

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
        <#assign totalNetWeightWire=385.03 />
        <#assign totalNetWeightSpool=16643 />
        <#assign totalGrossWeight=7.50 />

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
                      	<td colspan="2">
       						<@netAndSign /> <!-- 合計、サイン -->
                      	</td>
                  	</tr>
                    <tr>
                        <td align="left" class="fs9">
                          	S/N No.: 22-09-628,22-09-629,22-09-630
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
                        	<span class="fs11">
                                CU-229-074
                            </span>
                      	</b>
                  	</td>
                </tr>
                <tr>
                    <td>
                    	Date of Tokyo
                  	</td>
                    <td>
                      	15.Sep,2022
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
                          	Signetics Corp.
                      	</b>
                  	</td>
                </tr>
                <tr>
                    <td colspan="22" class="pl22">
                      	711, Pyeonghwa-ro,<br />
 						Tanhyeon - myeon, Paju-si,<br/>
                        Gyeonggi - do, 10861 Korea
                  	</td>
                </tr>
                <tr>
              		<td colspan="22" class="pl27">
                  		<@attnAndTel /> <!-- Attn & Tel -->
                  	</td>
              	</tr>
            </table>
        </#macro>

      	<!-- SHIP TO Attn & Tel -->
       	<#macro attnAndTel>
          <table style="line-height: 8; margin-top: 0pt;">
            	<tr>
                    <td colspan="3">
                      	Attn:
                  	</td>
                    <td colspan="19">
                      	Mr. YT Seo
                  	</td>
                </tr>
                <tr>
                    <td colspan="3">
                      	Tel :
                  	</td>
                    <td colspan="19">
                      	+82-31-940-7983(Direct)
                  	</td>
                </tr>
          </table>
        </#macro>

        <!-- BILL To Attn -->
       	<#macro attn>
          <table style="line-height: 8; margin-top: 0pt;">
            	<tr>
                    <td colspan="3">
                      	Attn:
                  	</td>
                    <td colspan="19">
                      	Account Dept.
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
                          	Signetics Corp.
                      	</b>
                  	</td>
                </tr>
              	<tr>
                    <td colspan="22" class="pl22">
                      	711, Pyeonghwa-ro,<br />
 						Tanhyeon - myeon, Paju-si,<br/>
                        Gyeonggi - do, 10861 Korea
                  	</td>
                </tr>
              	<tr>
              		<td colspan="22" class="pl27">
                  		<@attn />	<!-- Attn & Tel -->
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
                      	2022090081
                  	</td>
                </tr>
              	<tr>
                  	<td></td>
                  	<td class="poNumber">
                      	2022090154
                  	</td>
              	</tr>
              	<tr>
                  	<td></td>
                  	<td class="poNumber">
                      	2022090202
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
                      	Net 30days
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
                      	KOREA
                  	</td>
                </tr>
                <tr>
                    <td colspan="2">
                      	Means of Transport and Route :
                  	</td>
                </tr>
              	<tr>
                  	<td align="right" style="padding-right: 25pt;">
                      	Shipped per
                  	</td>
                    <td>
                      	<span style="padding-left: 25pt;">On or about</span><br />
                        AIR FREIGHT
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
                      	KOREA
                  	</td>
                </tr>
            </table>
        </#macro>

        <!-- 詳細、アイテム一覧 -->
        <#macro detailAndList>
            <table>
                <tr>
                    <td class="detailTbl">
                        <@marksAndNums /> <!-- 詳細 -->
                    </td>
                    <td class="listTbl">
                      	<@itemList /> <!-- アイテム一覧 -->
                    </td>
                </tr>
            </table>
        </#macro>

        <!-- 宛先 -->
        <#macro marksAndNums>
            <table>
                <tr>
                    <td align="center" class="detailAndListTopTitle">
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
                        <img src="${image_url?html}" style="width: 25%; height: 33px; padding: 0 60px 0px 10px;" />
                    </td>
                </tr>
                <tr>
                    <td>
                      	NIPPON MICROMETAL
                  	</td>
                </tr>
                <tr>
                    <td>
                      	<@poNumber /> <!-- P/O Number -->
                  	</td>
                </tr>
                <tr>
                    <td>
                      	MADE IN JAPAN
                  	</td>
                </tr>
                <tr>
                    <td>
                      	C/No. &nbsp;&nbsp; 1 - 2
                  	</td>
                </tr>
            </table>
        </#macro>

        <!-- P/O Number -->
        <#macro poNumber>
            <table class="poNumberSml" style="margin-bottom: 3pt;">
                <tr >
                    <td colspan="3">
                      	P/O No.
                  	</td>
                    <td colspan="4" style="margin-left: -8pt;">
                      	2022090081
                  	</td>
                </tr>
              	<tr>
                  	<td colspan="3"></td>
                  	<td colspan="4" style="margin-left: -8pt;">
                      	2022090154
                  	</td>
              	</tr>
              	<tr>
                  	<td colspan="3"></td>
                  	<td colspan="4" style="margin-left: -8pt;">
                      	2022090202
                  	</td>
              	</tr>
            </table>
        </#macro>

        <!-- アイテム一覧 -->
        <#macro itemList>
            <table style="width: 94%;">
                <tr>
                    <td colspan="9" class="detailAndListTopTitle" align="center" style="margin-left: -10pt;">
                      	Number and kind of Packages;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Description of Goods
                  	</td>
                    <td colspan="5" class="detailAndListTopTitle" align="center">
                      	Quantity
                  	</td>
                    <td colspan="5" class="detailAndListTopTitle" align="center">
                      	Unit Price
                  	</td>
                    <td colspan="5" class="detailAndListTopTitle" align="center">
                      	Amount
                  	</td>
                </tr>

                <tr class="mt6">
                  	<td colspan="24">
                      	<b class="fs10">
                          	Copper Bonding Wire
                      	</b>
                  	</td>
                </tr>

              	<!-- 1番目のアイテム -->
                <tr class="listPoNumber">
                	<td align="right" colspan="1" class="listNumber">
                 		1:
                	</td>
                	<td colspan="8">
                      	SKT<b>#&nbsp;<span class="fs11">203-2011-070</span></b>
                  	</td>
                	<td colspan="15" class="fs9">
                      	( P/O No; 2022090081 )
                  	</td>
                </tr>

                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="8" class="pl9 fs9">
                        EX1&nbsp;&nbsp;0.7mil&nbsp;&nbsp;6000feet/sp
                  	</td>
                	<td colspan="5" class="fs11" align="right" style="margin-right: 16pt;">
                        ${360000?string(",##0")} FT
                	</td>
                	<td colspan="5" class="fs11" align="right">
                     
                      	&#x40;us&#x24;${0.01277?string(",##0.00000")}
                	</td>
                	<td align="right" colspan="5" class="fs11">
                      	US&#x24;${4597.2?string(",##0.00")}
                	</td>
                </tr>

              	<!-- 2番目のアイテム -->
                <tr class="listPoNumber">
                	<td align="right" colspan="1" class="listNumber">
                 		2:
                	</td>
                	<td colspan="8">
                      	SKT<b>#&nbsp;<span class="fs11">203-2011-100</span></b>
                  	</td>
                	<td colspan="15" class="fs9">
                      	( P/O No; 2022090154 )
                  	</td>
                </tr>

                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="8" class="pl9 fs9">
                        EX1&nbsp;&nbsp;1.0mil&nbsp;&nbsp;6000feet/sp
                  	</td>
                	<td colspan="5" class="fs11" align="right" style="margin-right: 16pt;">
                        ${36000?string(",##0")} FT
                	</td>
                	<td colspan="5" class="fs11" align="right">
                     
                      	&#x40;us&#x24;${0.01195?string(",##0.00000")}
                	</td>
                	<td align="right" colspan="5" class="fs11">
                      	US&#x24;${430.20?string(",##0.00")}
                	</td>
                </tr>

                <!-- 3番目のアイテム -->
                <tr class="listPoNumber">
                	<td align="right" colspan="1" class="listNumber">
                 		3:
                	</td>
                	<td colspan="8">
                      	SKT<b>#&nbsp;<span class="fs11">203-2011-070</span></b>
                  	</td>
                	<td colspan="15" class="fs9">
                      	( P/O No; 2022090081 )
                  	</td>
                </tr>

                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="8" class="pl9 fs9">
                        EX1&nbsp;&nbsp;0.7mil&nbsp;&nbsp;6000feet/sp
                  	</td>
                	<td colspan="5" class="fs11" align="right" style="margin-right: 16pt;">
                        ${120000?string(",##0")} FT
                	</td>
                	<td colspan="5" class="fs11" align="right">
                     
                      	&#x40;us&#x24;${0.01277?string(",##0.00000")}
                	</td>
                	<td align="right" colspan="5" class="fs11">
                      	US&#x24;${1532.4?string(",##0.00")}
                	</td>
                </tr>

                <!-- 4番目のアイテム -->
                <tr class="listPoNumber">
                	<td align="right" colspan="1" class="listNumber">
                 		4:
                	</td>
                	<td colspan="8">
                      	SKT<b>#&nbsp;<span class="fs11">203-2011-070</span></b>
                  	</td>
                	<td colspan="15" class="fs9">
                      	( P/O No; 2022090081 )
                  	</td>
                </tr>

                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="8" class="pl9 fs9">
                        EX1&nbsp;&nbsp;0.7mil&nbsp;&nbsp;6000feet/sp
                  	</td>
                	<td colspan="5" class="fs11" align="right" style="margin-right: 16pt;">
                        ${120000?string(",##0")} FT
                	</td>
                	<td colspan="5" class="fs11" align="right">
                     
                      	&#x40;us&#x24;${0.01277?string(",##0.00000")}
                	</td>
                	<td align="right" colspan="5" class="fs11">
                      	US&#x24;${1532.4?string(",##0.00")}
                	</td>
                </tr>

                <!-- 5番目のアイテム -->
                <tr class="listPoNumber">
                	<td align="right" colspan="1" class="listNumber">
                 		5:
                	</td>
                	<td colspan="8">
                      	SKT<b>#&nbsp;<span class="fs11">203-2011-070</span></b>
                  	</td>
                	<td colspan="15" class="fs9">
                      	( P/O No; 2022090081 )
                  	</td>
                </tr>

                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="8" class="pl9 fs9">
                        EX1&nbsp;&nbsp;0.7mil&nbsp;&nbsp;6000feet/sp
                  	</td>
                	<td colspan="5" class="fs11" align="right" style="margin-right: 16pt;">
                        ${120000?string(",##0")} FT
                	</td>
                	<td colspan="5" class="fs11" align="right">
                     
                      	&#x40;us&#x24;${0.01277?string(",##0.00000")}
                	</td>
                	<td align="right" colspan="5" class="fs11">
                      	US&#x24;${1532.4?string(",##0.00")}
                	</td>
                </tr>

                <!-- 6番目のアイテム -->
                <tr class="listPoNumber">
                	<td align="right" colspan="1" class="listNumber">
                 		6:
                	</td>
                	<td colspan="8">
                      	SKT<b>#&nbsp;<span class="fs11">203-2011-070</span></b>
                  	</td>
                	<td colspan="15" class="fs9">
                      	( P/O No; 2022090081 )
                  	</td>
                </tr>

                <tr class="listPrice">
                	<td colspan="1"></td>
                	<td colspan="8" class="pl9 fs9">
                        EX1&nbsp;&nbsp;0.7mil&nbsp;&nbsp;6000feet/sp
                  	</td>
                	<td colspan="5" class="fs11" align="right" style="margin-right: 16pt;">
                        ${120000?string(",##0")} FT
                	</td>
                	<td colspan="5" class="fs11" align="right">
                     
                      	&#x40;us&#x24;${0.01277?string(",##0.00000")}
                	</td>
                	<td align="right" colspan="5" class="fs11">
                      	US&#x24;${1532.4?string(",##0.00")}
                	</td>
                </tr>

				<!-- 合計 -->
                <tr class="mt10">
                  	<td colspan="24" class="fs9">
                        Spool WN-8
                  	</td>
                </tr>

                <tr>
                	<td colspan="1"></td>
                	<td colspan="8" class="pl9 fs8">
                        ( Made of Ni plater aluminium )
                  	</td>
                	<td colspan="5" class="fs8" align="right" style="margin-right: 16pt;">
                        (86 spools)
                	</td>
                	<td colspan="5" class="fs8" align="right">
                        (&#x40;us&#x24;1.00)
                	</td>
                	<td align="right" colspan="5" class="fs8">
                        (US&#x24;86.00)<br/>

                    </td>
                </tr>

                <tr class="listPrice">
                	<td colspan="17">
                    </td>

                	<td align="right" colspan="7" class="fs8">
                        (No Commercial Value)
                    </td>
                </tr>

                <tr class="listTotal">
                    <td colspan="4">
                      	
                  	</td>
                    <td colspan="3" class="boderPaddingTop">
                      	Total:
                  	</td>
                    <td colspan="7" class="fs11 boderPaddingTop" align="right" style="padding-right: 16pt;">
                        ${516000.0?string(",##0.00")} FT
                  	</td>
                    <td colspan="10" align="right" class="boderPaddingTop">
                      	<b>
                          	US&#x24;${totalAmount?string(",##0.00")}
                      	</b>
                  	</td>
                </tr>

                <tr>
                	<td colspan="1"></td>
                	<td colspan="8">
                       
                  	</td>
                	<td colspan="5" class="fs8" align="right" style="margin-right: 16pt;">
                        (86 spools)
                	</td>
                	<td colspan="5">
                       
                	</td>
                	<td align="right" colspan="5" class="fs8">
                        (US&#x24;86.00)<br/>
                    </td>
                </tr>

                <tr>
                	<td colspan="1">
                    </td>
                	<td colspan="8">
                        
                  	</td>
                	<td colspan="4">
                       
                	</td>
                	<td colspan="4">
                        
                	</td>
                	<td align="right" colspan="7" class="fs8">
                        (No Commercial Value)
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
                    <td colspan="22" class="fs10" style="height: 25pt;">
                      	Note: Please return the spool after use
                  	</td>
                </tr>
                <tr>
                    <td>
                        <Br/>
                    </td>
                </tr>
                <tr>
                    <td colspan="17" class="pl110 fs10">
                      	Total net weight
                  	</td>
                    <td colspan="4" align="right" class="fs10">
                        ${totalNetWeightWire?string(",##0.00")} 
                    </td>
                    <td colspan="1">
                        g
                    </td>
                </tr>
                <tr>
                    <td colspan="17" class="pl110 fs10">
                      	Total gross weight
                  	</td>
                    <td colspan="4" align="right" class="fs10">
                        ${totalGrossWeight?string(",##0.00")}
                    </td>
                    <td colspan="1">
                        kg
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
            <#if (development_mode==true)>
                td {
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
                width: 75%;
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
                margin-left: 45pt;
            }

            .poNumber {
                font-weight: bold;
                font-size: 14pt !important;
                line-height: 12pt;
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
                margin: 1pt 10pt 10pt 0pt;
                padding: 0 0 0 3pt;
            }

            .listTotal,
            .listPoNumber,
            .listPrice td {
                font-size: 10pt;
            }

            .listPrice {
                margin-bottom: 5pt;
            }

            .fs11 {
                font-size: 11pt !important;
            }

            .fs10 {
                font-size: 10pt !important;
            }

            .fs9 {
                font-size: 9pt !important;
            }

            .fs8 {
                font-size: 8pt !important;
            }

            .pl110 {
                padding-left: 110pt;
            }

            .pl22 {
                padding-left: 22pt;
            }

            .pl27 {
                padding-left: 27pt;
            }

            .pl13 {
                padding-left: 13pt;
            }

            .pl9 {
                padding-left: 9pt;
            }

            .mt6 {
                margin-top: 6pt;
            }

            .mt10 {
                margin-top: 10pt;
            }

            .boderPaddingTop{
                border-top: 1px;
                padding-top: 5px;
            }

            .netAndSign td {
                font-size: 9pt;
            }

            .netAndSign {
                /* margin-top: 10pt;*/
            }

            .footer {
                width: 100%;
                font-size: 7pt;
            }

            .signAdjust {
                height: 35pt;
                border-bottom: 1px;
                margin-bottom: 5pt;
                margin-left: -25pt;
            }

            .listNumber{
                font-size: 9pt;
            }

        </style>
    </head>

    <!-- =================================================
        Body設定
    ================================================== -->
    <body header="nlheader" header-height="12%" footer="nlfooter" footer-height="12%" padding="0.2in 0.2in 0.2in 0.2in" size="A4">
        <@invoiceBody /> <!-- 請求書本文 -->
        <@detailAndList /> <!-- 詳細、アイテム一覧 -->
    </body>
</pdf>