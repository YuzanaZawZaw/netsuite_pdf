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

      	<!-- 固定値 -->
        <#assign packingID="4SCU-229-014" />
        <#assign quantity="Q6560000" />
        <#assign customerPartNo="P30ASA00001D018" />
        <#assign transID="KMY624510518940" />
        <#assign nXPLotNo="229014NP" />
        <#assign expiryDate="24.Feb,2023" />
        <#assign noOfCartons=86 />
        <!--===========================START TESTING============================-->
        <#assign monthArray=[31,28,31,30,31,30,31,31,30,31,30,31] />
        

        <!-- ===============================
	        ヘッダー＆フッター設定
	    ================================ -->        

        <!-- ===============================
	        function
	    ================================ -->
        <#--  function to figure out the number of days in month.  -->
        <#macro getDaysInMonth thisMonth thisYear>
            <#if thisMonth!=2>
                ${monthArray[thisMonth-1]}
                <#elseif thisYear%4!=0>
                    ${monthArray[1]}
                <#elseif thisYear%100==0 && thisYear%400!=0>
                    ${monthArray[1]}
                <#else>
                    ${monthArray[1]+1}
            </#if>
        </#macro>

        <!-- ===============================
	        macro
	    ================================ -->

        <!--barcode code39-->
        <#macro detailAndList>
            <table>
                <!--1st barcode-->
                <tr>
                    <td align="left" class="fs11">
                        (4S) Packing ID :
                    </td>    
                </tr>
                <tr>
                    <td>
                    </td>    
                </tr>
                <tr>
                    <td align="left" class="fs9 ml50">
                        ${packingID}
                    </td> 
                    <td rowspan="5">
                        <@from/><!-- from -->
                    </td>
                </tr>
                <tr>
                    <td align="left" class="ml32">
                        <barcode codetype="code39" showtext="false" height="32pt" width="200pt" value="${packingID}"/>
                    </td>
                </tr>    
                <tr>
                    <td align="left" class="mt-8">
                        <br/><br/><br/>
                  	</td>
                </tr>
                <!--2nd barcode-->
                <tr>
                    <td align="left" class="fs11">
                        (Q)  Quantity :
                    </td>    
                </tr>
                <tr>
                    <td>
                    </td>    
                </tr>
                <tr>
                    <td align="left" class="fs9 ml50">
                        Q6560000
                    </td> 
                </tr>
                <tr>
                    <td align="left" class="ml32">
                        <barcode codetype="code39" showtext="false" height="32pt" width="190pt" value="Q6560000"/>
                    </td> 
                </tr>    
                <tr>
                    <td align="left" class="mt-8">
                    	<br/><br/><br/>
                  	</td>
                </tr>
                <!--3rd barcode-->
                <tr>
                    <td align="left" class="fs11">
                        (P) Customer Part No ID :
                    </td>    
                </tr>
                <tr>
                    <td>
                    </td>    
                </tr>
                <tr>
                    <td align="left" class="fs9 ml50">
                        P30ASA00001D018
                    </td> 
                </tr>
                <tr>
                    <td align="left" class="ml32">
                        <barcode codetype="code39" showtext="false" height="32pt" width="250pt" value="P30ASA00001D018"/>
                    </td> 
                    <td rowspan="5" valign="bottom">
                        <@billTo/><!-- 請求書送付先 -->
                    </td>
                </tr>    
                <tr>
                    <td align="left" class="mt-8">
                    	<br/><br/><br/>
                  	</td>
                </tr>
                <!--4th barcode-->
                <tr>
                    <td align="left" class="fs11">
                        (K) Trans ID :
                    </td>    
                </tr>
                <tr>
                    <td>
                    </td>    
                </tr>
                <tr>
                    <td align="left" class="fs9 ml50">
                        KMY624510518940
                    </td> 
                </tr>
                <tr>
                    <td align="left" class="ml32">
                        <barcode codetype="code39" showtext="false" height="32pt" width="240pt" value="KMY624510518940"/>
                    </td> 
                </tr>    
                <tr>
                    <td align="left" class="mt-8">
                    	<br/><br/><br/>
                  	</td>
                </tr>
                <!--5th barcode-->
                <tr>
                    <td align="left" class="fs11">
                        NXP Lot No :
                    </td>    
                </tr>
                <tr>
                    <td>
                    </td>    
                </tr>
                <tr>
                    <td align="left" class="fs9 ml50">
                        229014NP
                    </td> 
                </tr>
                <tr>
                    <td align="left" class="ml32">
                        <barcode codetype="code39" showtext="false" height="32pt" width="200pt" value="229014NP"/>
                    </td> 
                </tr>    
                <tr>
                    <td align="left" class="mt-8">
                    	<br/><br/><br/>
                  	</td>
                </tr>
                <!--6th barcode-->
                <tr>
                    <td align="left" class="fs11">
                        Expiry date :
                    </td>    
                </tr>
                <tr>
                    <td>
                    </td>    
                </tr>
                <tr>
                    <td align="left" class="fs9 ml50">
                        <#--  ${nsformat_date("02-24-2023T10:40:00.000")}  -->
                        <#--  <@getDaysInMonth thisMonth=2 thisYear=2100/>  -->
                        <#--  <#assign aDateTime = .now>
                        <#assign aDate = aDateTime?date>
                        <#--  ${aDateTime?iso("UTC")}  -->
                        <#-- SimpleDateFormat patterns:
                        ${aDate?string["MM/dd/yyyy"]}  -->

                        <#assign foo = false>
                        ${foo?then('Y', 'N')}
                    </td> 
                </tr>
                <tr>
                    <td align="left" class="ml32">
                        <barcode codetype="code39" showtext="false" height="32pt" width="200pt" value="02/24/2023"/>
                    </td> 
                </tr>    
                <tr>
                    <td align="left" class="mt-8">
                    	<br/><br/><br/>
                  	</td>
                </tr>
                <!--7th barcode-->
                <tr>
                    <td align="left" class="fs11">
                        No of Cartons :
                    </td>    
                </tr>
                <tr>
                    <td>
                    </td>    
                </tr>
                <tr>
                    <td align="left" class="fs9 ml50">
                        86
                    </td> 
                </tr>
                <tr>
                    <td align="left" class="ml32">
                        <barcode codetype="code39" showtext="false" height="32pt" value="86"/>
                    </td> 
                </tr>    
                <tr>
                    <td align="left" class="mt-8">
                    	<br/><br/><br/>
                  	</td>
                </tr>
            </table>
        </#macro>
        
        <!--from-->
        <#macro from>
            <table style="margin-bottom: 5pt;" class="pl30">
                <tr>
                    <td class="fs9">
                      	From : 
                  	</td>
                </tr>
                <tr>
                    <td class="fs11" style="padding-top: 6pt;padding-bottom: 6pt;">
                        NIPPON MICROMETAL CORPORATION
                  	</td>
                </tr>
              	<tr>
              		<td class="fs11" style="padding-left: 22pt;">
                  		158-1,Sayamagahara<br/>
 						Iruma City,Saitama 358-0032,Japan<br/>
                  	</td>
              	</tr>
            </table>
        </#macro>

        <!-- 請求書送付先 -->
        <#macro billTo>
            <table style="margin-bottom: 5pt;" class="pl30">
                <tr>
                    <td class="fs9">
                      	Bill to :
                  	</td>
                </tr>
                <tr>
                    <td class="fs11" style="padding-top: 6pt;padding-bottom: 6pt;">
                        NXP Malaysia Sdn. Bhd.
                  	</td>
                </tr>
              	<tr>
              		<td class="fs11" style="padding-left: 22pt;">
                  		Free Industrial Zone Sungei Way<br/>
                        No.2, Jalan SS 8/2<br/>
                        47300 Petaling Jaya Selangor, Malaysia
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

        .fs11 {
            font-size: 11pt !important;
        }
        
       .fs9 {
            font-size: 9pt !important;
        }

		.ml50{
			margin-left: 50pt;
		}
		
		.ml32{
			margin-left: 32pt;
		}

        .pl30{
            padding-left: 30pt;
        }
        .mt-8{
            margin-top:-8pt;
        }
        </style>
    </head>
    <!-- =================================================
        Body設定
    ================================================== -->
    <body padding="0.2in 0.2in 0.2in 0.2in" size="A4">       
        <@detailAndList /><!--barcode code39-->
    </body>
</pdf>
