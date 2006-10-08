<% do_pagehead(); %>
		<title><% nvram_get("router_name"); %> - WDS</title>
		<script type="text/javascript"><![CDATA[

document.title = "<% nvram_get("router_name"); %>" + wds.titl;

function SelSubnet(F,num) {
	setElementsActive("wl_br1_nat", "wl_br1_netmask3", num == 1);
	F.change_action.value = "gozila_cgi";
	F.submit_button.value = "Wireless_WDS";
	F.submit_type.value = "save";
 	
 	F.action.value = "Apply";
	F.submit();
}

function SelWDS(index, num, F) {
	if(index==1){
		F.wl_wds1_enable.value=F.wl_wds1_enable.options[num].value;
	} else if(index==2) {
		F.wl_wds2_enable.value=F.wl_wds2_enable.options[num].value;
	} else if(index==3){
		F.wl_wds3_enable.value=F.wl_wds3_enable.options[num].value;
	} else if(index==4){
		F.wl_wds4_enable.value=F.wl_wds4_enable.options[num].value;
	} else if(index==5){
		F.wl_wds5_enable.value=F.wl_wds5_enable.options[num].value;
	} else if(index==6){
		F.wl_wds6_enable.value=F.wl_wds6_enable.options[num].value;
	} else if(index==7){
		F.wl_wds7_enable.value=F.wl_wds7_enable.options[num].value;
	} else if(index==8) {
		F.wl_wds8_enable.value=F.wl_wds8_enable.options[num].value;
	} else if(index==9){
		F.wl_wds9_enable.value=F.wl_wds9_enable.options[num].value;
	} else if(index==10){
		F.wl_wds10_enable.value=F.wl_wds10_enable.options[num].value;
	}
	F.change_action.value = "gozila_cgi";
	F.submit_button.value = "Wireless_WDS";
	F.submit_type.value = "save";
	
	F.action.value = "Apply";
	F.submit();
}

function to_submit(F) {
	F.change_action.value = "";
	F.submit_type.value = "";
	F.submit_button.value = "Wireless_WDS";
//	F.save_button.value = "Saved";
	F.save_button.value = sbutton.saving;

	F.action.value = "Apply";
	apply(F);
}

function setWDS(val) {
	if (val == "0") {
		setElementsActive("wl_wds1_enable", "wl_br1_netmask3", val == "1");
	} else {
		setElementsActive("wl_wds1_enable", "wl_br1_enable", val == "1");
		setElementsActive("wl_br1_nat", "wl_br1_netmask3", <% nvram_get("wl_br1_enable"); %> == "1");
	}
}

addEvent(window, "load", function() {
	var wds = "1";
	setElementsActive("wl_br1_nat", "wl_br1_netmask3", "<% nvram_get("wl_br1_enable"); %>" == 1);
//	if ("ap" != "<% nvram_get("wl0_mode"); %>" || "psk2" == "<% nvram_get("wl0_akm"); %>" || "wpa2" == "<% nvram_get("wl0_akm"); %>"){
//		var wds = "0";
//		setWDS(wds);
//		alert(errmsg.err48);
//	}
});

		]]></script>
	</head>

  <body class="gui">
  	  <% showad(); %>
      <div id="wrapper">
         <div id="content">
            <div id="header">
               <div id="logo">
                  <h1><% show_control(); %></h1>
               </div>
			<% do_menu("Wireless_Basic.asp","Wireless_WDS.asp"); %>
            </div>
            <div id="main">
               <div id="contents">
                  <form name="wds" action="apply.cgi" method="<% get_http_method(); %>">
                  	<input type="hidden" name="submit_button" value="Wireless_WDS" />
                  	<input type="hidden" name="change_action" />
                  	<input type="hidden" name="submit_type" />
                  	<input type="hidden" name="commit" value="1" />
                  	<input type="hidden" name="action" value="Apply" />
                  	<h2><% tran("wds.h2"); %></h2>
                     <div>
                      <fieldset>
                        <legend><% tran("wds.legend"); %></legend>
                        <div class="setting">
                           <div class="label"><% tran("wds.wl_mac"); %></div><% nvram_get("wl0_hwaddr"); %>&nbsp;
                        </div>

                        <div class="setting">
                          <select name="wl_wds1_enable" size="1" onchange="SelWDS(1,this.form.wl_wds1_enable.selectedIndex,this.form)">
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"0\" <% nvram_selmatch("wl_wds1_enable", "0", "selected"); %>>" + share.disable + "</option>");
]]></script>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"1\" <% nvram_selmatch("wl_wds1_enable", "1", "selected"); %>>" + share.point2point + "</option>");
]]></script>
                            <% show_wds_subnet(1); %>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"3\" <% nvram_selmatch("wl_wds1_enable", "3", "selected"); %>>" + share.lan + "</option>");
]]></script>
                          </select>
                          <input type="hidden" name="wl_wds1_hwaddr" value="6" />
                          <input class="num" name="wl_wds1_hwaddr0" size="2" maxlength="2" onblur="valid_mac(this,0)" value="<% get_wds_mac("1", "0"); %>" />:<input class="num" name="wl_wds1_hwaddr1" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("1", "1"); %>" />:<input class="num" name="wl_wds1_hwaddr2" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("1", "2"); %>" />:<input class="num" name="wl_wds1_hwaddr3" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("1", "3"); %>" />:<input class="num" name="wl_wds1_hwaddr4" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("1", "4"); %>" />:<input class="num" name="wl_wds1_hwaddr5" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("1", "5"); %>" />&nbsp;&nbsp;
                          <input name="wl_wds1_desc" size="30" maxlength="30" value="<% nvram_get("wl_wds1_desc"); %>" />
                          <% get_wdsp2p(1); %>
                        </div>

                        <div class="setting">
                          <select name="wl_wds2_enable" size="1" onchange="SelWDS(2,this.form.wl_wds2_enable.selectedIndex,this.form)">
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"0\" <% nvram_selmatch("wl_wds2_enable", "0", "selected"); %>>" + share.disable + "</option>");
]]></script>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"1\" <% nvram_selmatch("wl_wds2_enable", "1", "selected"); %>>" + share.point2point + "</option>");
]]></script>
                            <% show_wds_subnet(2); %>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"3\" <% nvram_selmatch("wl_wds2_enable", "3", "selected"); %>>" + share.lan + "</option>");
]]></script>
                          </select>
                          <input type="hidden" name="wl_wds2_hwaddr" value="6" />
                          <input class="num" name="wl_wds2_hwaddr0" size="2" maxlength="2" onblur="valid_mac(this,0)" value="<% get_wds_mac("2", "0"); %>" />:<input class="num" name="wl_wds2_hwaddr1" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("2", "1"); %>" />:<input class="num" name="wl_wds2_hwaddr2" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("2", "2"); %>" />:<input class="num" name="wl_wds2_hwaddr3" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("2", "3"); %>" />:<input class="num" name="wl_wds2_hwaddr4" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("2", "4"); %>" />:<input class="num" name="wl_wds2_hwaddr5" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("2", "5"); %>" />&nbsp;&nbsp;
                          <input name="wl_wds2_desc" size="30" maxlength="30" value="<% nvram_get("wl_wds2_desc"); %>" />
                          <% get_wdsp2p(2); %>
                        </div>

                        <div class="setting">
                          <select name="wl_wds3_enable" size="1" onchange="SelWDS(3,this.form.wl_wds3_enable.selectedIndex,this.form)">
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"0\" <% nvram_selmatch("wl_wds3_enable", "0", "selected"); %>>" + share.disable + "</option>");
]]></script>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"1\" <% nvram_selmatch("wl_wds3_enable", "1", "selected"); %>>" + share.point2point + "</option>");
]]></script>
                            <% show_wds_subnet(3); %>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"3\" <% nvram_selmatch("wl_wds3_enable", "3", "selected"); %>>" + share.lan + "</option>");
]]></script>
                          </select>
                          <input type="hidden" name="wl_wds3_hwaddr" value="6" />
                          <input class="num" name="wl_wds3_hwaddr0" size="2" maxlength="2" onblur="valid_mac(this,0)" value="<% get_wds_mac("3", "0"); %>" />:<input class="num" name="wl_wds3_hwaddr1" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("3", "1"); %>" />:<input class="num" name="wl_wds3_hwaddr2" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("3", "2"); %>" />:<input class="num" name="wl_wds3_hwaddr3" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("3", "3"); %>" />:<input class="num" name="wl_wds3_hwaddr4" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("3", "4"); %>" />:<input class="num" name="wl_wds3_hwaddr5" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("3", "5"); %>" />&nbsp;&nbsp;
                          <input name="wl_wds3_desc" size="30" maxlength="30" value="<% nvram_get("wl_wds3_desc"); %>" />
                          <% get_wdsp2p(3); %>
                        </div>

                        <div class="setting">
                          <select name="wl_wds4_enable" size="1" onchange="SelWDS(4,this.form.wl_wds4_enable.selectedIndex,this.form)">
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"0\" <% nvram_selmatch("wl_wds4_enable", "0", "selected"); %>>" + share.disable + "</option>");
]]></script>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"1\" <% nvram_selmatch("wl_wds4_enable", "1", "selected"); %>>" + share.point2point + "</option>");
]]></script>
                            <% show_wds_subnet(4); %>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"3\" <% nvram_selmatch("wl_wds4_enable", "3", "selected"); %>>" + share.lan + "</option>");
]]></script>
                          </select>
                          <input type="hidden" name="wl_wds4_hwaddr" value="6" />
                          <input class="num" name="wl_wds4_hwaddr0" size="2" maxlength="2" onblur="valid_mac(this,0)" value="<% get_wds_mac("4", "0"); %>" />:<input class="num" name="wl_wds4_hwaddr1" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("4", "1"); %>" />:<input class="num" name="wl_wds4_hwaddr2" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("4", "2"); %>" />:<input class="num" name="wl_wds4_hwaddr3" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("4", "3"); %>" />:<input class="num" name="wl_wds4_hwaddr4" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("4", "4"); %>" />:<input class="num" name="wl_wds4_hwaddr5" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("4", "5"); %>" />&nbsp;&nbsp;
                          <input name="wl_wds4_desc" size="30" maxlength="30" value="<% nvram_get("wl_wds4_desc"); %>" />
                          <% get_wdsp2p(4); %>
                        </div>

                        <div class="setting">
                          <select name="wl_wds5_enable" size="1" onchange="SelWDS(5,this.form.wl_wds5_enable.selectedIndex,this.form)">
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"0\" <% nvram_selmatch("wl_wds5_enable", "0", "selected"); %>>" + share.disable + "</option>");
]]></script>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"1\" <% nvram_selmatch("wl_wds5_enable", "1", "selected"); %>>" + share.point2point + "</option>");
]]></script>
                            <% show_wds_subnet(5); %>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"3\" <% nvram_selmatch("wl_wds5_enable", "3", "selected"); %>>" + share.lan + "</option>");
]]></script>
                          </select>
                          <input type="hidden" name="wl_wds5_hwaddr" value="6" />
                          <input class="num" name="wl_wds5_hwaddr0" size="2" maxlength="2" onblur="valid_mac(this,0)" value="<% get_wds_mac("5", "0"); %>" />:<input class="num" name="wl_wds5_hwaddr1" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("5", "1"); %>" />:<input class="num" name="wl_wds5_hwaddr2" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("5", "2"); %>" />:<input class="num" name="wl_wds5_hwaddr3" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("5", "3"); %>" />:<input class="num" name="wl_wds5_hwaddr4" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("5", "4"); %>" />:<input class="num" name="wl_wds5_hwaddr5" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("5", "5"); %>" />&nbsp;&nbsp;
                          <input name="wl_wds5_desc" size="30" maxlength="30" value="<% nvram_get("wl_wds5_desc"); %>" />
                          <% get_wdsp2p(5); %>
                        </div>

                        <div class="setting">
                          <select name="wl_wds6_enable" size="1" onchange="SelWDS(6,this.form.wl_wds6_enable.selectedIndex,this.form)">
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"0\" <% nvram_selmatch("wl_wds6_enable", "0", "selected"); %>>" + share.disable + "</option>");
]]></script>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"1\" <% nvram_selmatch("wl_wds6_enable", "1", "selected"); %>>" + share.point2point + "</option>");
]]></script>
                            <% show_wds_subnet(6); %>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"3\" <% nvram_selmatch("wl_wds6_enable", "3", "selected"); %>>" + share.lan + "</option>");
]]></script>
                          </select>
                          <input type="hidden" name="wl_wds6_hwaddr" value="6" />
                          <input class="num" name="wl_wds6_hwaddr0" size="2" maxlength="2" onblur="valid_mac(this,0)" value="<% get_wds_mac("6", "0"); %>" />:<input class="num" name="wl_wds6_hwaddr1" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("6", "1"); %>" />:<input class="num" name="wl_wds6_hwaddr2" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("6", "2"); %>" />:<input class="num" name="wl_wds6_hwaddr3" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("6", "3"); %>" />:<input class="num" name="wl_wds6_hwaddr4" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("6", "4"); %>" />:<input class="num" name="wl_wds6_hwaddr5" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("6", "5"); %>" />&nbsp;&nbsp;
                          <input name="wl_wds6_desc" size="30" maxlength="30" value="<% nvram_get("wl_wds6_desc"); %>" />
                          <% get_wdsp2p(6); %>
                        </div>

                        <div class="setting">
                          <select name="wl_wds7_enable" size="1" onchange="SelWDS(7,this.form.wl_wds7_enable.selectedIndex,this.form)">
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"0\" <% nvram_selmatch("wl_wds7_enable", "0", "selected"); %>>" + share.disable + "</option>");
]]></script>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"1\" <% nvram_selmatch("wl_wds7_enable", "1", "selected"); %>>" + share.point2point + "</option>");
]]></script>
                            <% show_wds_subnet(7); %>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"3\" <% nvram_selmatch("wl_wds7_enable", "3", "selected"); %>>" + share.lan + "</option>");
]]></script>
                          </select>
                          <input type="hidden" name="wl_wds7_hwaddr" value="6" />
 	          			  <input class="num" name="wl_wds7_hwaddr0" size="2" maxlength="2" onblur="valid_mac(this,0)" value="<% get_wds_mac("7", "0"); %>" />:<input class="num" name="wl_wds7_hwaddr1" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("7", "1"); %>" />:<input class="num" name="wl_wds7_hwaddr2" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("7", "2"); %>" />:<input class="num" name="wl_wds7_hwaddr3" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("7", "3"); %>" />:<input class="num" name="wl_wds7_hwaddr4" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("7", "4"); %>" />:<input class="num" name="wl_wds7_hwaddr5" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("7", "5"); %>" />&nbsp;&nbsp;
               			  <input name="wl_wds7_desc" size="30" maxlength="30" value="<% nvram_get("wl_wds7_desc"); %>" />
               			  <% get_wdsp2p(7); %>
               			</div>
               			    
               			<div class="setting">
                   		  <select name="wl_wds8_enable" size="1" onchange="SelWDS(8,this.form.wl_wds8_enable.selectedIndex,this.form)">
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"0\" <% nvram_selmatch("wl_wds8_enable", "0", "selected"); %>>" + share.disable + "</option>");
]]></script>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"1\" <% nvram_selmatch("wl_wds8_enable", "1", "selected"); %>>" + share.point2point + "</option>");
]]></script>
                            <% show_wds_subnet(8); %>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"3\" <% nvram_selmatch("wl_wds8_enable", "3", "selected"); %>>" + share.lan + "</option>");
]]></script>
                   		  </select>
                   		  <input type="hidden" name="wl_wds8_hwaddr" value="6" />
                   		  <input class="num" name="wl_wds8_hwaddr0" size="2" maxlength="2" onblur="valid_mac(this,0)" value="<% get_wds_mac("8", "0"); %>" />:<input class="num" name="wl_wds8_hwaddr1" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("8", "1"); %>" />:<input class="num" name="wl_wds8_hwaddr2" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("8", "2"); %>" />:<input class="num" name="wl_wds8_hwaddr3" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("8", "3"); %>" />:<input class="num" name="wl_wds8_hwaddr4" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("8", "4"); %>" />:<input class="num" name="wl_wds8_hwaddr5" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("8", "5"); %>" />&nbsp;&nbsp;
                   		  <input name="wl_wds8_desc" size="30" maxlength="30" value="<% nvram_get("wl_wds8_desc"); %>" />
                          <% get_wdsp2p(8); %>
                        </div>

                        <div class="setting">
                          <select name="wl_wds9_enable" size="1" onchange="SelWDS(9,this.form.wl_wds9_enable.selectedIndex,this.form)">
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"0\" <% nvram_selmatch("wl_wds9_enable", "0", "selected"); %>>" + share.disable + "</option>");
]]></script>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"1\" <% nvram_selmatch("wl_wds9_enable", "1", "selected"); %>>" + share.point2point + "</option>");
]]></script>
                            <% show_wds_subnet(9); %>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"3\" <% nvram_selmatch("wl_wds9_enable", "3", "selected"); %>>" + share.lan + "</option>");
]]></script>
                          </select>
			              <input type="hidden" name="wl_wds9_hwaddr" value="6" />
			              <input class="num" name="wl_wds9_hwaddr0" size="2" maxlength="2" onblur="valid_mac(this,0)" value="<% get_wds_mac("9", "0"); %>" />:<input class="num" name="wl_wds9_hwaddr1" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("9", "1"); %>" />:<input class="num" name="wl_wds9_hwaddr2" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("9", "2"); %>" />:<input class="num" name="wl_wds9_hwaddr3" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("9", "3"); %>" />:<input class="num" name="wl_wds9_hwaddr4" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("9", "4"); %>" />:<input class="num" name="wl_wds9_hwaddr5" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("9", "5"); %>" />&nbsp;&nbsp;
			              <input name="wl_wds9_desc" size="30" maxlength="30" value="<% nvram_get("wl_wds9_desc"); %>" />
			              <% get_wdsp2p(9); %>
                        </div>

                        <div class="setting">
                          <select name="wl_wds10_enable" size="1" onchange="SelWDS(10,this.form.wl_wds10_enable.selectedIndex,this.form)">
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"0\" <% nvram_selmatch("wl_wds10_enable", "0", "selected"); %>>" + share.disable + "</option>");
]]></script>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"1\" <% nvram_selmatch("wl_wds10_enable", "1", "selected"); %>>" + share.point2point + "</option>");
]]></script>
                            <% show_wds_subnet(10); %>
                            <script type="text/javascript"><![CDATA[
document.write("<option value=\"3\" <% nvram_selmatch("wl_wds10_enable", "3", "selected"); %>>" + share.lan + "</option>");
]]></script>
                          </select>
			              <input type="hidden" name="wl_wds10_hwaddr" value="6" />
			              <input class="num" name="wl_wds10_hwaddr0" size="2" maxlength="2" onblur="valid_mac(this,0)" value="<% get_wds_mac("10", "0"); %>" />:<input class="num" name="wl_wds10_hwaddr1" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("10", "1"); %>" />:<input class="num" name="wl_wds10_hwaddr2" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("10", "2"); %>" />:<input class="num" name="wl_wds10_hwaddr3" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("10", "3"); %>" />:<input class="num" name="wl_wds10_hwaddr4" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("10", "4"); %>" />:<input class="num" name="wl_wds10_hwaddr5" size="2" maxlength="2" onblur="valid_mac(this,1)" value="<% get_wds_mac("10", "5"); %>" />&nbsp;&nbsp;
			              <input name="wl_wds10_desc" size="30" maxlength="30" value="<% nvram_get("wl_wds10_desc"); %>" />
			              <% get_wdsp2p(10); %>
                        </div>

                        </fieldset>
                        <br/>
                        <fieldset>
                          <legend><% tran("wds.legend2"); %></legend>
                        <div class="setting">
                           <div class="label"><% tran("wds.label"); %></div>
                           <input class="spaceradio" type="radio" name="wl_lazywds" value="1" <% nvram_selmatch("wl_lazywds", "1", "checked"); %> /><% tran("share.enable"); %>&nbsp;
                           <input class="spaceradio" type="radio" name="wl_lazywds" value="0" <% nvram_selmatch("wl_lazywds", "0", "checked"); %> /><% tran("share.disable"); %>
						   <span class="default"><script type="text/javascript"><![CDATA[
document.write("(" + share.deflt + ": " + share.disable + ")");
]]></script></span>
                        </div>
                        <div class="setting">
                           <div class="label"><% tran("wds.label2"); %></div>
                           <input class="spaceradio" type="radio" name="wl_br1_enable" value="1" OnClick="SelSubnet(this.form,1)" <% nvram_selmatch("wl_br1_enable", "1", "checked"); %> /><% tran("share.enable"); %>&nbsp;
                           <input class="spaceradio" type="radio" name="wl_br1_enable" value="0" OnClick="SelSubnet(this.form,0)" <% nvram_selmatch("wl_br1_enable", "0", "checked"); %> /><% tran("share.disable"); %>
                        </div>
                        <div class="setting">
                           <div class="label"><% tran("share.nat"); %></div>
                           <select name="wl_br1_nat">
                              <script type="text/javascript"><![CDATA[
document.write("<option value='<% nvram_selmatch("wl_br1_nat", "0", "selected"); %>'>" + share.disable + "</option>");
]]></script>
                              <script type="text/javascript"><![CDATA[
document.write("<option value='<% nvram_selmatch("wl_br1_nat", "1", "selected"); %>'>" + wds.nat1 + "</option>");
]]></script>
                              <script type="text/javascript"><![CDATA[
document.write("<option value='<% nvram_selmatch("wl_br1_nat", "2", "selected"); %>'>" + wds.nat2 + "</option>");
]]></script>
                           </select>
                        </div>
                        <div class="setting">
                           <div class="label"><% tran("share.ip"); %></div>
                           <input type="hidden" name="wl_br1_ipaddr" value="4" />
                           <input class="num" name="wl_br1_ipaddr0" size="3" maxlength="3" onblur="valid_range(this,0,255,share.ip)" value="<% get_br1_ip("0"); %>" />.<input class="num" name="wl_br1_ipaddr1" size="3" maxlength="3" onblur="valid_range(this,0,255,share.ip)" value="<% get_br1_ip("1"); %>" />.<input class="num" name="wl_br1_ipaddr2" size="3" maxlength="3" onblur="valid_range(this,0,255,share.ip)" value="<% get_br1_ip("2"); %>" />.<input class="num" name="wl_br1_ipaddr3" size="3" maxlength="3" onblur="valid_range(this,0,255,share.ip)" value="<% get_br1_ip("3"); %>" />
                        </div>
                        <div class="setting">
                           <div class="label"><% tran("share.subnet"); %></div>
                           <input type="hidden" name="wl_br1_netmask" value="4" /><input class="num" name="wl_br1_netmask0" size="3" maxlength="3" onblur="valid_range(this,0,255,share.subnet)" value="<% get_br1_netmask("0"); %>" />.<input class="num" name="wl_br1_netmask1" size="3" maxlength="3" onblur="valid_range(this,0,255,share.subnet)" value="<% get_br1_netmask("1"); %>" />.<input class="num" name="wl_br1_netmask2" size="3" maxlength="3" onblur="valid_range(this,0,255,share.subnet)" value="<% get_br1_netmask("2"); %>" />.<input class="num" name="wl_br1_netmask3" size="3" maxlength="3" onblur="valid_range(this,0,255,share.subnet)" value="<% get_br1_netmask("3"); %>" />
                        </div>
                     </fieldset>
                     </div>
                     <br/>
                     <div class="submitFooter">
                     	<script type="text/javascript"><![CDATA[
document.write("<input type=\"button\" name=\"save_button\" value=\"" + sbutton.save + "\" onclick=\"to_submit(this.form)\" />");
]]></script>
                     	<script type="text/javascript"><![CDATA[
document.write("<input type=\"reset\" value=\"" + sbutton.cancel + "\" />");
]]></script>
                     </div>
                  </form>
               </div>
            </div>
				<div id="helpContainer">
					<div id="help">
						<div><h2><% tran("share.help"); %></h2></div>
						<br />
						<a href="javascript:openHelpWindow<% nvram_selmatch("dist_type","micro","Ext"); %>('HWDS.asp')"><% tran("share.more"); %></a>
					</div>
				</div>
				<div id="floatKiller"></div>
				<% do_statusinfo(); %>
			</div>
		</div>
	</body>
</html>