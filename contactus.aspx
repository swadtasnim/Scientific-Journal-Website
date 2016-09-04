<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contactus.aspx.cs" Inherits="contactus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/png" href="kuet/logo.png ">
	<title>Journal Jam</title>

	<link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <link href="CSS/loginpage.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #sceince {
            margin-left: 0px;
            width: 794px;
            margin-top: 0px;
        }
        
        
      .black_overlay
        {
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
        }
        .white_content
        {
            display: none;
            position: absolute;
            top: 25%;
            left: 35%;
            width: 35%;
            padding: 0px;
            border: 0px solid #CC9933;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }
        .headertext
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 18px;
            color: #Bgfhgf;
            font-weight: bold;
        }
        .textfield
        {
            border: 1px solid #CC9933;
            width: 135px;
        }
        .buttonsubmit
        {
            background-color: #e3bfc3;
            color: White;
            font-size: 11px;
            font-weight: bold;
            border: 1px solid #7f9db9;
            width: 68px;
        }

  
    
    </style>

</head>
<body>
    <form id="form1" runat="server">
<div id="wrapp">
<div id="one">
<div id="navbar">
<ul id="nav">
	<li style="display:inline;margin-left:30px;"><a href="home.aspx">Home</a></li>
    <li style="display:inline;margin-left:30px;"><a href="about.aspx">About</a></li>
    <li style="display:inline;margin-left:30px;"><a href="gridmember.aspx">Authors</a></li>
    <li style="display:inline;margin-left:30px;"><a href="javascript:void(0)" class="toplink" onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">Submit Paper</a></li>
    <li style="display:inline;margin-left:30px;"><a href="">Contact Us</a></li>
</ul>
	
</div>
    <div id="light" class="white_content">
            <table cellpadding="0" cellspacing="0" border="0" style="background-color: #90bab7;"
                width="100%">
                <tr>
                    <td height="16px">
                        <a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
                            <img src="images/quit.png" style="border-style: none; border-color: inherit; border-width: 0px;
                                height: 17px; width: 16px;" align="right" /></a>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 16px; padding-right: 16px; padding-bottom: 16px">
                        <table align="center" border="0" cellpadding="0" cellspacing="0" style="background-color: #fff"
                            width="100%">
                            <tr>
                                <td align="center" colspan="2" class="headertext">
                                    Login Form
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <table>
                                        <tr>
                                            <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate">
        </asp:Login>
                                        </tr>
                                         <tr>
                                            <td>
                                                Don't you have any Account? Get Registered here!</p>
                                        <asp:Button ID="B" runat="server" OnClick="B_Click" Text="Register" Width="145px" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="10px">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    <div id="fade" class="black_overlay">
        </div>
<div class="header">

<img id="logo" src="kuet/logo.png">

<h1 >
	Journal Jam
</h1>
	
</div>
    </div>
    <div id="two">
        <div style="height: 806px; margin-left: 0px; margin-top: 71px">

            <p style="box-sizing: border-box; margin: 0px 0px 1.5rem; padding: 0px; vertical-align: baseline; font-weight: normal; font-family: NexusSerif, Georgia, serif; font-size: 1.25rem; line-height: 1.625rem; text-rendering: optimizeLegibility; max-width: inherit; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">
                &nbsp;</p>
            <h2 style="box-sizing: border-box; margin: 0px 0px 0.373rem; padding: 0px; vertical-align: baseline; font-family: NexusSerif, Georgia, serif; font-style: normal; color: rgb(34, 34, 34); text-rendering: optimizeLegibility; line-height: 1.4; font-size: 1.75rem; max-width: inherit; font-weight: 100; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">Contact us</h2>
            <p style="box-sizing: border-box; margin: 0px 0px 1.5rem; padding: 0px; vertical-align: baseline; font-weight: normal; font-family: NexusSerif, Georgia, serif; font-size: 1.25rem; line-height: 1.625rem; text-rendering: optimizeLegibility; max-width: inherit; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">
                Journal Jam<br style="box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: baseline;" />
                360 Park Avenue South, 9th Floor<br style="box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: baseline;" />
                New York, NY 10010</p>
            <h2 style="box-sizing: border-box; margin: 0px 0px 0.373rem; padding: 0px; vertical-align: baseline; font-family: NexusSerif, Georgia, serif; font-style: normal; color: rgb(34, 34, 34); text-rendering: optimizeLegibility; line-height: 1.4; font-size: 1.75rem; max-width: inherit; font-weight: 100; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">Other useful contacts</h2>
            <ul style="box-sizing: border-box; margin: 0px 0px 1.25rem; padding: 0px; vertical-align: baseline; line-height: 1.625rem; list-style-position: outside; font-family: NexusSans, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 1.25rem; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">
                <li style="box-sizing: border-box; margin: 0px 0px 0.5rem 1rem; padding: 0px; vertical-align: baseline; list-style: none; font-size: 1em; line-height: 1.5em; font-family: NexusSerif, Georgia, serif; position: relative;"><strong style="box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: baseline; line-height: inherit; font-weight: 700;">Contact Customer Service:</strong><span class="Apple-converted-space">&nbsp;</span>Visit the<span class="Apple-converted-space">&nbsp;</span>Journal Jam<a href="" rel="external" style="box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: baseline; line-height: inherit; transition: all 111ms ease-out; color: rgb(0, 115, 152); text-decoration: none; word-break: break-word; word-wrap: break-word; background: 0px 0px;" target="_blank"> Support Center</a>.</li>
            </ul>
            <ul style="box-sizing: border-box; margin: 0px 0px 1.25rem; padding: 0px; vertical-align: baseline; line-height: 1.625rem; list-style-position: outside; font-family: NexusSans, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 1.25rem; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">
                <li style="box-sizing: border-box; margin: 0px 0px 0.5rem 1rem; padding: 0px; vertical-align: baseline; list-style: none; font-size: 1em; line-height: 1.5em; font-family: NexusSerif, Georgia, serif; position: relative;"><strong style="box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: baseline; line-height: inherit; font-weight: 700;">Submit a journal article.</strong><span class="Apple-converted-space">&nbsp;</span>To find an Journal Jam journal and its Guide for Authors — and to find out how to submit your paper for publication — see<span class="Apple-converted-space">&nbsp;</span><a href="" style="box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: baseline; line-height: inherit; transition: all 111ms ease-out; color: rgb(0, 115, 152); text-decoration: none; word-break: break-word; word-wrap: break-word; background: 0px 0px;" target="_blank">Publishing with Journal Jam: step by step</a>.</li>
            </ul>
            <ul style="box-sizing: border-box; margin: 0px 0px 1.25rem; padding: 0px; vertical-align: baseline; line-height: 1.625rem; list-style-position: outside; font-family: NexusSans, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 1.25rem; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">
                <li style="box-sizing: border-box; margin: 0px 0px 0.5rem 1rem; padding: 0px; vertical-align: baseline; list-style: none; font-size: 1em; line-height: 1.5em; font-family: NexusSerif, Georgia, serif; position: relative;"><strong style="box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: baseline; line-height: inherit; font-weight: 700;">Learn about book publishing.</strong><span class="Apple-converted-space">&nbsp;</span>Visit the<span class="Apple-converted-space">&nbsp;</span><a href="" style="box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: baseline; line-height: inherit; transition: all 111ms ease-out; color: rgb(0, 115, 152); text-decoration: none; word-break: break-word; word-wrap: break-word; background: 0px 0px;" target="_blank">Science and Technology Books page</a>.</li>
            </ul>
            <ul style="box-sizing: border-box; margin: 0px 0px 1.25rem; padding: 0px; vertical-align: baseline; line-height: 1.625rem; list-style-position: outside; font-family: NexusSans, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 1.25rem; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">
                <li style="box-sizing: border-box; margin: 0px 0px 0.5rem 1rem; padding: 0px; vertical-align: baseline; list-style: none; font-size: 1em; line-height: 1.5em; font-family: NexusSerif, Georgia, serif; position: relative;"><strong style="box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: baseline; line-height: inherit; font-weight: 700;">Find a research paper or book chapter.</strong><span class="Apple-converted-space">&nbsp;</span>Search Journal Jam&#39;s catalog of more than 2,500 journals and 11,000 books on<span class="Apple-converted-space">&nbsp;</span><a href="" rel="external" style="box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: baseline; line-height: inherit; transition: all 111ms ease-out; color: rgb(0, 115, 152); text-decoration: none; word-break: break-word; word-wrap: break-word; background: 0px 0px;" target="_blank">ScienceDirect.</a></li>
            </ul>
            <ul style="box-sizing: border-box; margin: 0px 0px 1.25rem; padding: 0px; vertical-align: baseline; line-height: 1.625rem; list-style-position: outside; font-family: NexusSans, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 1.25rem; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">
                <li style="box-sizing: border-box; margin: 0px 0px 0.5rem 1rem; padding: 0px; vertical-align: baseline; list-style: none; font-size: 1em; line-height: 1.5em; font-family: NexusSerif, Georgia, serif; position: relative;"><strong style="box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: baseline; line-height: inherit; font-weight: 700;">Get permission:</strong><span class="Apple-converted-space">&nbsp;</span><a href="" style="box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: baseline; line-height: inherit; transition: all 111ms ease-out; color: rgb(0, 115, 152); text-decoration: none; word-break: break-word; word-wrap: break-word; background: 0px 0px;" target="_blank">Obtain permission to re-use materials in Journal Jam&#39;s books and journals</a>.</li>
            </ul>
            <ul style="box-sizing: border-box; margin: 0px 0px 1.25rem; padding: 0px; vertical-align: baseline; line-height: 1.625rem; list-style-position: outside; font-family: NexusSans, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 1.25rem; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
                <li style="box-sizing: border-box; margin: 0px 0px 0.5rem 1rem; padding: 0px; vertical-align: baseline; list-style: none; font-size: 1em; line-height: 1.5em; font-family: NexusSerif, Georgia, serif; position: relative;"><strong style="box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: baseline; line-height: inherit; font-weight: 700;">Inquire about writing for the Elsevier Connect blog:</strong><span class="Apple-converted-space">&nbsp;</span>Contact<span class="Apple-converted-space">&nbsp;</span><a href="" rel="external" style="box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: baseline; line-height: inherit; transition: all 111ms ease-out; color: rgb(0, 115, 152); text-decoration: none; word-break: break-word; word-wrap: break-word; background: 0px 0px;" target="_blank">Editor-in-Chief Alison Bert</a>. (Please note, the editor cannot respond to inquiries that are not related to this blog.)</li>
            </ul>
            <h3 id="STBooks" style="box-sizing: border-box; margin: 0px 0px 0.373rem; padding: 0px; vertical-align: baseline; font-family: NexusSerif, Georgia, serif; font-style: normal; color: rgb(34, 34, 34); text-rendering: optimizeLegibility; line-height: 1.4; font-size: 1.375rem; max-width: inherit; font-weight: 100; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">&nbsp;</h3>
            <p style="box-sizing: border-box; margin: 0px 0px 1.5rem; padding: 0px; vertical-align: baseline; font-weight: normal; font-family: NexusSerif, Georgia, serif; font-size: 1.25rem; line-height: 1.625rem; text-rendering: optimizeLegibility; max-width: inherit; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
                &nbsp;</p>

        </div>
    </div>
    <div id="thrww">
<div id="footer">
	
    <span style="color:white; font-family: NexusSans, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 15.04px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 26.32px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; ">Copyright ©&nbsp; Khandaker Tasnim Huq Swad,2016<br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </span></div>
	
</div>

    </form>

 </body>
    
</html>
