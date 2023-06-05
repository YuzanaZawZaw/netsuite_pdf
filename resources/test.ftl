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
        <#assign docTitle="TESTING" />
        <!--===========================START TESTING============================-->
        <#assign monthArray=[31,28,31,30,31,30,31,31,30,31,30,31] />
        

        <!-- ===============================
	        ヘッダー＆フッター設定
	    ================================ -->        
        <macrolist>
            <!-- ヘッダー -->
            <macro id="nlheader">
                <table>
                    <tr>
                        <td align="center" class="docTitleAdjustment docTitle">
                        	${docTitle}
                        </td>
                    </tr>
                </table>
            </macro>

            <!-- フッター -->
            <macro id="nlfooter">
                <table class="footer footerAdjustment">
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

        <#macro detailAndList>
            <table>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        Date :
                    </td>   
                    <td align="left" class="fs9 ml20" width="70%">
                        <#--  ${nsformat_date("02-24-2023T10:40:00.000")}  -->
                        <#--  <@getDaysInMonth thisMonth=2 thisYear=2100/>  -->
                        <#--  ${aDateTime?iso("UTC")}   -->
                        <#-- SimpleDateFormat patterns:-->
                        <#assign aDateTime = .now>
                        <#assign aDate = aDateTime?date>
                        ${aDate?string["MM/dd/yyyy"]}<br/>
                        <#--  <#assign foo = false>
                        ${foo?then('Y', 'N')}  -->
                    </td>  
                </tr>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        Built-ins for booleans
                    </td>
                    <td align="left" class="fs9 ml20" width="70%">
                        <#assign x = 30>
                        <#assign y = 20>
                        <#-- Prints 100 plus the maximum of x and y: -->
                        ${100 + (x > y)?then(x, y)}
                    </td>
                </tr>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        chunk
                    </td>
                    <td align="left" class="fs9 ml20" width="70%">
                        <#assign seq = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']>
                        <#list seq?chunk(3,'-') as row>
                            <#list row as cell>${cell}</#list>
                        </#list>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        drop_while
                    </td>
                    <td align="left" class="fs9 ml20" width="70%">
                        <#assign xs = [1, 2, -3, 4, -5, 6]>
                        Drop while positive:
                            <#list xs?drop_while(x -> x > 0) as x>${x} </#list>
                        <br/>
                        Filer for positives:
                            <#list xs?filter(x -> x > 0) as x>${x} </#list>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        filter
                    </td>
                    <td align="left" class="fs9 ml20" width="70%">
                        <#assign xs = [1, -2, 3, 4, -5]>
                        Positives:
                            <#list xs?filter(x -> x > 0) as x>${x} </#list>
                            <br/>
                        Negatives:
                            <#list xs?filter(x -> x < 0) as x>${x} </#list>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        min, max
                    </td>
                    <td align="left" class="fs9 ml20" width="70%">
                        min ::${[1, 2, 3]?min}
                        <br/>
                        max ::${[1, 2, 3]?max}
                    </td>
                </tr>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        take_while
                    </td>
                    <td align="left" class="fs9 ml20" width="70%">
                        Take while positive:
                        <#list xs?take_while(x -> x > 0) as x>${x} </#list>
                        <br/>
                        Filter for positives:
                        <#list xs?filter(x -> x > 0) as x>${x} </#list>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        Filtering missing (null) values
                    </td>
                    <td align="left" class="fs9 ml20" width="70%">
                        First::
                        <#assign colors = ["red", "green", "blue"]>
                        ${colors?join(",,, ")}
                    </td>
                </tr>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        seq_contains
                    </td>
                    <td align="left" class="fs9 ml20" width="70%">
                        <#assign x = ["red", 16, "blue", "cyan"]>
                        "blue": ${x?seq_contains("blue")?string("yes", "no")}<br/>
                        "yellow":${x?seq_contains("yellow")?string("yes","no")}<br/>
                        16: ${x?seq_contains(16)?string("yes", "no")}<br/>
                        "16": ${x?seq_contains("16")?string("yes", "no")}
                    </td>
                </tr>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        seq_index_of
                    </td>
                    <td align="left" class="fs9 ml20" width="70%">
                        <#assign colors = ["red", "green", "blue"]>
                        The index of "blue"::${colors?seq_index_of("blue")}<br/>
                        The index of "red"::${colors?seq_index_of("red")}<br/>
                        The index of "purple"::${colors?seq_index_of("purple")}
                    </td>
                </tr>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        seq_index_of
                    </td>
                    <td align="left" class="fs9 ml20" width="70%">
                        <#assign names = ["Joe", "Fred", "Joe", "Susan"]>
                        No 2nd param: ${names?seq_index_of("Joe")}<br/>
                        -2:&nbsp;&nbsp;&nbsp;${names?seq_index_of("Joe", -2)}<br/>
                        -2:&nbsp;&nbsp;&nbsp;${names?seq_index_of("Joe", -2)}<br/>
                        -1:&nbsp;&nbsp;&nbsp;${names?seq_index_of("Joe", -1)}<br/>
                        0:&nbsp;&nbsp;&nbsp;&nbsp;${names?seq_index_of("Joe", 0)}<br/>
                        1:&nbsp;&nbsp;&nbsp;&nbsp;${names?seq_index_of("Joe", 1)}<br/>
                        2:&nbsp;&nbsp;&nbsp;&nbsp;${names?seq_index_of("Joe", 2)}<br/>
                        3:&nbsp;&nbsp;&nbsp;&nbsp;${names?seq_index_of("Joe", 3)}<br/>
                        4:&nbsp;&nbsp;&nbsp;&nbsp;${names?seq_index_of("Joe", 4)}
                    </td>
                </tr>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        seq_last_index_of
                    </td>
                    <td align="left" class="fs9 ml20" width="70%">
                        <#assign names = ["Joe", "Fred", "Joe", "Susan"]>
                        No 2nd param: ${names?seq_last_index_of("Joe")}
                        -2:&nbsp;&nbsp;&nbsp;${names?seq_last_index_of("Joe", -2)}<br/>
                        -1:&nbsp;&nbsp;&nbsp;${names?seq_last_index_of("Joe", -1)}<br/>
                        0:&nbsp;&nbsp;&nbsp;&nbsp;${names?seq_last_index_of("Joe", 0)}<br/>
                        1:&nbsp;&nbsp;&nbsp;&nbsp;${names?seq_last_index_of("Joe", 1)}<br/>
                        2:&nbsp;&nbsp;&nbsp;&nbsp;${names?seq_last_index_of("Joe", 2)}<br/>
                        3:&nbsp;&nbsp;&nbsp;&nbsp;${names?seq_last_index_of("Joe", 3)}<br/>
                        4:&nbsp;&nbsp;&nbsp;&nbsp;${names?seq_last_index_of("Joe", 4)}
                    </td>
                </tr>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        sort
                    </td>
                    <td align="left" class="fs9 ml20" width="70%">
                        <#assign ls = ["whale", "Barbara", "zeppelin", "aardvark", "beetroot"]?sort>
                        <#list ls as i>${i} </#list>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        sort_by
                    </td>
                    <td align="left" class="fs9 ml20" width="70%">
                        <#assign ls = [
                                    {"name":"whale", "weight":2000},
                                    {"name":"Barbara", "weight":53},
                                    {"name":"zeppelin", "weight":-200},
                                    {"name":"aardvark", "weight":30},
                                    {"name":"beetroot", "weight":0.3}
                        ]>
                        Sort by name::<br/>
                        <#list ls?sort_by("name") as i>
                            -${i.name}: ${i.weight}<br/>
                        </#list>
                        <br/>
                        Sort by weight::<br/>
                        <#list ls?sort_by("weight") as i>
                            -${i.name}: ${i.weight}<br/>
                        </#list>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        sort
                    </td>
                    <td align="left" class="fs9 ml20" width="70%">
                        <#assign members = [
                        {"name": {"first": "Joe", "last": "Smith"}, "age": 40},
                        {"name": {"first": "Fred", "last": "Crooger"}, "age": 35},
                        {"name": {"first": "Amanda", "last": "Fox"}, "age": 25}]>
                        Sort by name.last::<br/>
                        <#list members?sort_by(['name','last']) as i>
                            -${i.name.first}, ${i.name.last} : ${i.age} years old<br/>
                        </#list>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="fs11" width="30%">
                        Built-ins for hashes
                    </td>
                    <td align="left" class="fs9 ml20" width="70%">
                        keys : 
                        <#assign myHash = { "name": "mouse", "price": 50 }>
                        <#list myHash?keys as k>
                            ${k}<br/>
                        </#list>
                        <br/>
                        values:
                        <#list myHash?values as v>
                            ${v}<br/>
                        </#list>
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

        .docTitle {
            font-size: 21pt;
        }

        .docTitleAdjustment {
            border: 1px;
            border-right: none;
            border-left: none;
            vertical-align: middle;
            letter-spacing: 5pt;
        }

        .footerAdjustment {
            width: 100%;
            font-size: 7pt;
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
        .ml20{
            margin-left: 20pt;
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
    <body header="nlheader" header-height="5%" footer="nlfooter" footer-height="10pt" padding="0.2in 0.2in 0.2in 0.2in" size="A4">       
        <@detailAndList /><!--barcode code39-->
    </body>
</pdf>
