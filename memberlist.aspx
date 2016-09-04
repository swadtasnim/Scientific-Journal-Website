<%@ Page Language="C#" AutoEventWireup="true" CodeFile="memberlist.aspx.cs" Inherits="memberlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/png" href="kuet/logo.png ">
	<title>Journal Jam</title>

	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>
<body style="height: 1346px">
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
    <li style="display:inline;margin-left:30px;"><a href="topdf.aspx"><asp:Label ID="Vwfiles" runat="server" Text="View Files"> </asp:Label></a></li>
	<li style="display:inline;margin-left:30px;"><a href="publish.aspx"><asp:Label ID="lblpublish" runat="server" Text="Files to Publish"></asp:Label></a></li>
	<li style="display:inline;margin-left:30px;"><a href="memberlist.aspx"><asp:Label ID="lblmember" runat="server" Text="View Members"></asp:Label></a></li>
	<li style="display:inline;margin-left:30px;"><a href=""><asp:LinkButton ID="Logout" runat="server" Text="Logout" OnClick="btnlogout_Click"></asp:LinkButton></a></li>
</ul>
	
</div>


</div>
 <div id="two" style="background-color:#d0cc95; margin-left: 84px; margin-right: 0px; height: 1318px;">
    <div style="height: 1007px">
    
    &nbsp;&nbsp;&nbsp;
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" Height="446px" style="margin-left: 68px" Width="593px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="username" HeaderText="Name" ItemStyle-HorizontalAlign="Center">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="fullname" HeaderText="Fullname" ItemStyle-HorizontalAlign="Center">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="Status" ItemStyle-HorizontalAlign="Center">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandArgument='<%# Eval("username") %>' OnClick="Makermem" Text="Make member"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        </asp:GridView>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" Height="483px" style="margin-left: 69px; margin-top: 107px" Width="592px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" >
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="username" HeaderText="Name" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="fullname" HeaderText="Fullname" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="Status"  ItemStyle-HorizontalAlign="Center">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandArgument='<%# Eval("username") %>' OnClick="Makereviewer" Text="Make Reviewer"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandArgument='<%# Eval("username") %>' OnClick="Deletemem" Text="Disable_Account"></asp:LinkButton>
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
