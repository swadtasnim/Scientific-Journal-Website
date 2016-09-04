<%@ Page Language="C#" AutoEventWireup="true" CodeFile="publish.aspx.cs" Inherits="publish" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/png" href="kuet/logo.png ">
	<title>Journal Jam</title>

	<link rel="stylesheet" type="text/css" href="stylesheet.css">
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
    <li style="display:inline;margin-left:30px;"><a href="topdf.aspx"><asp:Label ID="Vwfiles" runat="server" Text="View Files"> </asp:Label></a></li>
	<li style="display:inline;margin-left:30px;"><a href="publish.aspx"><asp:Label ID="lblpublish" runat="server" Text="Files to Publish"></asp:Label></a></li>
	<li style="display:inline;margin-left:30px;"><a href="memberlist.aspx"><asp:Label ID="lblmember" runat="server" Text="View Members"></asp:Label></a></li>
	<li style="display:inline;margin-left:30px;"><a href=""><asp:LinkButton ID="Logout" runat="server" Text="Logout" OnClick="btnlogout_Click"></asp:LinkButton></a></li>
</ul>
	
</div>


</div>
<div id="two" style="background-color:#d0cc95; margin-left: 84px; margin-right: 0px; height: 974px;">


    <div>
    
        
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="onrowdatabound" EnableModelValidation="True" Height="846px" Width="1009px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" style="margin-top: 0px" >
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="visited"  />
                <asp:BoundField DataField="fname" HeaderText="File Name"  ItemStyle-HorizontalAlign="Center">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="btype" HeaderText="Type" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="date" HeaderText="Date"  ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                
                 
                 
                
                 
                 <asp:TemplateField ShowHeader="False">
                     <ItemTemplate>
                         <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" OnClick="Go_to_review"
                             CommandArgument='<%# Eval("id") %>' Text="View Review"></asp:LinkButton>
                     </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ShowHeader="False">
                     <ItemTemplate>
                         <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" OnClick="Publish"
                             CommandArgument='<%# Eval("id") %>' Text='<%# Eval("published") %>'>'></asp:LinkButton>
                     </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="false" OnClick="Delete_file"
                            CommandArgument='<%# Eval("id") %>' Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                
                 
                 </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        </asp:GridView>
    
    </div>
    </div>
            </div>
    </form>
     <script type="text/javascript">
         //Place as last thing before the closing </body> tag
         if (location.search.indexOf('reloaded=yes') < 0) {
             var hash = window.location.hash;
             var loc = window.location.href.replace(hash, '');
             loc += (loc.indexOf('?') < 0 ? '?' : '&') + 'reloaded=yes';
             // SET THE ONE TIME AUTOMATIC PAGE RELOAD TIME TO 5000 MILISECONDS (5 SECONDS):
             setTimeout(function () { window.location.href = loc + hash; }, 3000);
         }
</script>
</body>
</html>
