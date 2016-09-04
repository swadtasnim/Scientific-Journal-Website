<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/png" href="kuet/logo.png ">
	<title>Journal Jam</title>

	<link rel="stylesheet" type="text/css" href="stylesheet.css">
    
    <style type="text/css">
        #TextArea1 {
            width: 752px;
            height: 351px;
            margin-left: 217px;
        }
        #TextArea2 {
            width: 776px;
            height: 221px;
            margin-left: 179px;
            margin-top: 0px;
        }
        #txtbio {
            width: 779px;
            height: 490px;
        }
        #lblbio {
            width: 812px;
            height: 347px;
        }
        #lblresearch {
            height: 236px;
            width: 771px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapp">
<div id="one">
<div class="header">

<img id="logo" src="kuet/logo.png">

<h1 >
	Journal Jam
</h1>
	
</div>
<div id="navbar">
<ul id="nav">
	<li style="display:inline;margin-left:30px;"><a href="profile.aspx"><asp:Label ID="name" runat="server" Text=""></asp:Label></a></li>
    <li style="display:inline;margin-left:30px;"><a href=""><asp:LinkButton ID="lblreview" runat="server" Text="Files to Review" OnClick="btnreview_Click"></asp:LinkButton></a></li>
    <li style="display:inline;margin-left:30px;"><a href="frompdf.aspx"><asp:Label ID="lblsubmit" runat="server" Text="Submit Paper"></asp:Label></a></li>
	<li style="display:inline;margin-left:30px;"><a href="topdf.aspx"><asp:Label ID="Vwfiles" runat="server" Text="View Files"> </asp:Label></a></li>
	<li style="display:inline;margin-left:30px;"><a href="publish.aspx"><asp:Label ID="lblpublish" runat="server" Text="Files to Publish"></asp:Label></a></li>
	<li style="display:inline;margin-left:30px;"><a href="memberlist.aspx"><asp:Label ID="lblmember" runat="server" Text="View Members"></asp:Label></a></li>

	<li style="display:inline;margin-left:30px;"><a href=""><asp:LinkButton ID="Logout" runat="server" Text="Logout" OnClick="btnlogout_Click"></asp:LinkButton></a></li>
</ul>
	
</div>


</div>

    
    <div id="two" style="background-color:#d0cc95; margin-left: 84px; margin-right: 0px; height: 1404px;">
        <p style="height: 17px ;font-size:large">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        </p>
        <p style="height: 17px ;font-size:large">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p style="height: 17px ;font-size:large">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Welcome&nbsp;&nbsp;
            <asp:Label ID="lblusername" runat="server" Text="Label"></asp:Label>
            &nbsp;&nbsp;&nbsp;!!!&nbsp;&nbsp;
        </p>
        <asp:Image ID="Image1" runat="server" Height="124px" style="margin-left: 72px" Width="113px" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblfullname" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Biography:<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div style="height: 427px; margin-left: 178px; margin-right: 95px">
        <p>
            <asp:Label ID="lblbio" runat="server" Text="Label"></asp:Label></p></div>
        <br />
&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Reasearch Interest<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :<div style="height: 187px; margin-left: 178px; margin-right: 95px">
            <div style="height: 109px; margin-left: 20px"><p>
                <asp:Label ID="lblresearch" runat="server" Text="Label"></asp:Label>
            </p></div>
        
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;<br />
        <br />
&nbsp;Contact :&nbsp;&nbsp;
        <asp:Label ID="lblcontact" runat="server" Text="Label"></asp:Label>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="update.aspx">
            <asp:Label ID="lblupdate" runat="server" Text="Update Profile"></asp:Label>
            </a>
            </p>
            </div>
           

            </div>
             <div id="thrww">

<div id="footer">
	 <span style="color:white; font-family: NexusSans, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 15.04px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 26.32px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; ">Copyright ©&nbsp; Khandaker Tasnim Huq Swad,2016<br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
     <br />
	
    <span style="color:white; font-family: NexusSans, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 15.04px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 26.32px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; ">
    <asp:Label ID="Label2" runat="server"></asp:Label>
       
    </span>
    </span>
</div>
	
</div>
            </div>
    </form>
</body>
</html>
