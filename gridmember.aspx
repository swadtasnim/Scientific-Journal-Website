<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gridmember.aspx.cs" Inherits="gridmember" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/png" href="kuet/logo.png ">
	<title>Journal Jam</title>

	<link rel="stylesheet" type="text/css" href="stylesheet.css">
     <style type="text/css">
        
        
        
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

  
    
         #thrww {
             margin-top: 506px;
         }

  
    
    </style>
    
</head>
<body>
    <form id="form2" runat="server">
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
	<div class="container-1" style="width:300px;padding-top:20px; padding-left:750px; background-color:;">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
      <asp:TextBox ID="TextBox1" placeholder="search items" runat="server" Height="24px" tyle="margin-left: 0px" Width="202px"></asp:TextBox>
            
            <asp:Button ID="Button1" runat="server" Height="30px" style="margin-top: 0px" Text="Go" Width="43px" BackColor="#993300" OnClick="Button1_Click1" />
            <asp:AutoCompleteExtender ID="TextBox1_AutoCompleteExtender" runat="server" BehaviorID="TextBox1_AutoCompleteExtender" Enabled="True" MinimumPrefixLength="1" ServiceMethod="GetCompletionList" TargetControlID="TextBox1">
       
                 </asp:AutoCompleteExtender>
  </div>
    <div style="height: 1435px; margin-top: 22px;">
    
    
	

	


    
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" Height="795px" Width="100%" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" style="margin-right: 49px; margin-top: 0px; margin-left: 53px;" >
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                
                <asp:TemplateField HeaderText="Image">
        <ItemTemplate>
        <asp:Image ID="Image1" runat="server" Width="80px" Height="90px" 
                   ImageUrl='<%# "Handler.ashx?username=" + Convert.ToString(Eval("username"))%>'/>
        </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:TemplateField>
                <asp:BoundField DataField="fullname" HeaderText="Fullname" ItemStyle-HorizontalAlign="Center"  >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="Status" ItemStyle-HorizontalAlign="Center"  >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false"  Text="View Profile"
                            OnClick="gotomprofile"
                            CommandArgument='<%# Eval("username") %>'></asp:LinkButton>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        </asp:GridView>
        </div>
    </div>
     <div id="thrww">
<div id="footer">
	
    <span style="color:white; font-family: NexusSans, 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 15.04px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 26.32px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; ">Copyright ©&nbsp; Khandaker Tasnim Huq Swad,2016<br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server"></asp:Label>
       
    </span></div>
	
</div>
	
</div>

</div>
    </form>
</body>
</html>
