<%@ Page Language="C#" AutoEventWireup="true" CodeFile="submit.aspx.cs" Inherits="submit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 261px">
    <form id="form1" runat="server">
    <div>
    
        <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate">
        </asp:Login>
    
    </div>
        <p>
            Don&#39;t you have any Account? Get Registered here!</p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" Width="145px" />
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
