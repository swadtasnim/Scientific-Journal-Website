<%@ Page Language="C#" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

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
    <li style="display:inline;margin-left:30px;"><a href="contactus.aspx">Contact Us</a></li>
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
                Journal Jam is a world-leading publisher of scientific, technical and medical resources with 7,000 employees in more than 70 locations around the world. We produce more than 2,200 new titles a year, published internationally in 11 languages, and have over 20,000 books available to support researchers, professionals and students across the globe.</p>
            <p style="box-sizing: border-box; margin: 0px 0px 1.5rem; padding: 0px; vertical-align: baseline; font-weight: normal; font-family: NexusSerif, Georgia, serif; font-size: 1.25rem; line-height: 1.625rem; text-rendering: optimizeLegibility; max-width: inherit; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
                Our authors represent a broad range of specialty areas and are among the most well-respected and authoritative professionals in their communities. We invite you to join a community of world-renowned thought leaders who have published books with Journal Jam.</p>
            <h3 id="STBooks" style="box-sizing: border-box; margin: 0px 0px 0.373rem; padding: 0px; vertical-align: baseline; font-family: NexusSerif, Georgia, serif; font-style: normal; color: rgb(34, 34, 34); text-rendering: optimizeLegibility; line-height: 1.4; font-size: 1.375rem; max-width: inherit; font-weight: 100; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">Where does S&amp;T Books fit in?</h3>
            <p style="box-sizing: border-box; margin: 0px 0px 1.5rem; padding: 0px; vertical-align: baseline; font-weight: normal; font-family: NexusSerif, Georgia, serif; font-size: 1.25rem; line-height: 1.625rem; text-rendering: optimizeLegibility; max-width: inherit; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">
                Journal Jam&#39;s Science and Technology Books—S&amp;T Books—division reaches out to researchers, professionals and students across life sciences, physical sciences, engineering and computing with quality reference and foundational content on a diverse range of subjects.</p>
            <p style="box-sizing: border-box; margin: 0px 0px 1.5rem; padding: 0px; vertical-align: baseline; font-weight: normal; font-family: NexusSerif, Georgia, serif; font-size: 1.25rem; line-height: 1.625rem; text-rendering: optimizeLegibility; max-width: inherit; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">
                We publish under long-established imprints such as Academic Press, Butterworth-Heinemann and Morgan Kaufmann, and drive the advancement and application of science and technology through the delivery of targeted, reliable information to support research, learning and professional practice.</p>
            <h3 id="WhyUs" style="box-sizing: border-box; margin: 0px 0px 0.373rem; padding: 0px; vertical-align: baseline; font-family: NexusSerif, Georgia, serif; font-style: normal; color: rgb(34, 34, 34); text-rendering: optimizeLegibility; line-height: 1.4; font-size: 1.375rem; max-width: inherit; font-weight: 100; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">Why publish with us?</h3>
            <p style="box-sizing: border-box; margin: 0px 0px 1.5rem; padding: 0px; vertical-align: baseline; font-weight: normal; font-family: NexusSerif, Georgia, serif; font-size: 1.25rem; line-height: 1.625rem; text-rendering: optimizeLegibility; max-width: inherit; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
                By collaborating with Journal Jam, you will engage in a partnership with a team of highly skilled publishing professionals who support your vision and can offer expert guidance on how to turn your idea into a successful published reality.</p>
            <p style="box-sizing: border-box; margin: 0px 0px 1.5rem; padding: 0px; vertical-align: baseline; font-weight: normal; font-family: NexusSerif, Georgia, serif; font-size: 1.25rem; line-height: 1.625rem; text-rendering: optimizeLegibility; max-width: inherit; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">
                We combine several hundred years of traditional publishing expertise with the innovative ideas, technologies and platforms needed to serve a diverse, fast-changing community in academia and industry.</p>
            <p style="box-sizing: border-box; margin: 0px 0px 1.5rem; padding: 0px; vertical-align: baseline; font-weight: normal; font-family: NexusSerif, Georgia, serif; font-size: 1.25rem; line-height: 1.625rem; text-rendering: optimizeLegibility; max-width: inherit; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
                As well as publishing in print, our new books are all optimized for delivery in a variety of electronic formats, including publication on the leading full-text scientific database<span class="Apple-converted-space">&nbsp;</span><a href="http://www.sciencedirect.com/" rel="external" style="box-sizing: border-box; margin: 0px; padding: 0px; vertical-align: baseline; line-height: inherit; transition: all 111ms ease-out; color: rgb(0, 115, 152); text-decoration: none; word-break: break-word; word-wrap: break-word; background: 0px 0px;" target="_blank">ScienceDirect</a>, which reaches more than 16 million users.</p>
            <p style="box-sizing: border-box; margin: 0px 0px 1.5rem; padding: 0px; vertical-align: baseline; font-weight: normal; font-family: NexusSerif, Georgia, serif; font-size: 1.25rem; line-height: 1.625rem; text-rendering: optimizeLegibility; max-width: inherit; color: rgb(80, 80, 80); font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; ">
                We have a long-standing commitment to quality, accuracy and reliability in our editorial and production activities, and the international sales and marketing reach to ensure your book is available and discoverable to the readers who need it across the globe.</p>
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