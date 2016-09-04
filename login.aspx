<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Popup Login page</title>
   
  <style>
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
<div>
        <a href="javascript:void(0)" class="toplink" onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
            Log In</a>
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
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" Width="145px" />
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
    </div>
    </form>
</body>
</html>