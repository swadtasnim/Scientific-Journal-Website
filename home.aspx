<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/png" href="kuet/logo.png ">
	<title>Journal Jam</title>

	<link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <link href="CSS/loginpage.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #sceince {
            margin-left: 72px;
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

<div id="image">
	<img id="sceince" src="kuet/science.jpg">
</div>
</div>

<div id="two">
<h2 id="h2journal">Scientific Journals</h2>
  <p  id="pjournal">
	
	Scientific Journals are multidimensional Open Access gateways for the exploration of scientific discoveries and new research in the medical and other Scientifics. These journals are periodical publications intended to communicate with the scientific community to further the progress of mankind. Scientific Journals represent the collaborative efforts of many scientists and scholars from various disciplines.<br><br>
	
    Science literatures have evolved from time to time in terms of specialization and target audience. Reports of new research findings are important to fuel novel assumptions and discoveries that can only be in existence through the publication of Science journals. Although some Science Journals are multidisciplinary, most journals are highly specialized and they publish articles related to specific scientific fields. In an attempt to maintain quality and ensure validity of the research being published, Science Journals subject the articles through a rigorous peer-review process, honoring copyrights. Science Journals may include various types of articles such as, letters, short communications, review articles, research articles, case reports, editorials, and other supplementary articles. The rules and guidelines of article writing as well as formatting may vary with the type of the journal and the publisher.
    <br><br>
   
	</p>

	<div id="listhead" style="float:left;background-color:; height:40px; width:50%">
	<h2 id="h2list">Journals List By Subject </h2>
	</div>
	<div class="box">
        <div class="container-1" style="width:300px;padding-top:20px; padding-left:750px; background-color:;">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
      <asp:TextBox ID="TextBox1" placeholder="search items" runat="server" Height="24px" tyle="margin-left: 0px" Width="202px"></asp:TextBox>
            
            <asp:Button ID="Button1" runat="server" Height="30px" style="margin-top: 0px" Text="Go" Width="43px" BackColor="#993300" OnClick="Button1_Click1" />
            <asp:AutoCompleteExtender ID="TextBox1_AutoCompleteExtender" runat="server" BehaviorID="TextBox1_AutoCompleteExtender" Enabled="True" MinimumPrefixLength="1" ServiceMethod="GetCompletionList" TargetControlID="TextBox1">
       
                 </asp:AutoCompleteExtender>
  </div>

	<br>
	<div style="height:20px"></div>
	<div id="list">
	<ul class="ollist">
	
	 <li>General Science</li> <br>
	     <div  class="divlist">
             
             
             <br />
             <asp:GridView ID="GridView1" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton1" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
        <br /><br/>
	 <li>Neuroscience & Psychology</li><br>
	    <div class="divlist">
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:GridView ID="GridView2" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton2" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	            &nbsp;</p>
	    </div>
	    <br><br>
	 <li>Genetics & Molicular Biology</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView3" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton3" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
	     <br><br>
     <li>Biochemistry</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView4" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton4" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
	     <br><br>
	<li>Engineering</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView5" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton5" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
	     <br><br>
	 <li>Chemistry</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView6" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton6" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
	     <br><br>
	 <li>Physics</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView7" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton7" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
	     <br><br>
	     
	<li>Mathematics</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView8" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton8" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
	     <br><br>
	<li>Material Sciences</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView9" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton9" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
	     <br><br>
    <li>Social & Political Science</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView10" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton10" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
	     <br><br>
	<li>Earth & Environmental Science</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView11" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton11" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
	     <br><br>
	<li>Chemical Engineering</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView12" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton12" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
	     <br><br>
	<li>Medical</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView13" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton13" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
	     <br><br>
	<li>Agri Food & Aqua</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView14" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton14" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
	     <br><br>
	<li>Immunology & Microbiology</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView15" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton15" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
	     <br><br>
	<li>Pharmaceutical Sciences</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView16" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton16" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
	     <br><br>
	<li>Informatics</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView17" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton17" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>
	     <br><br>
	<li>Business and Management</li> <br>
	     <div  class="divlist">
             <asp:GridView ID="GridView18" runat="server" border="0" gridline="none" Height="351px" style="margin-left: 69px; margin-top: 0px" Width="752px" AutoGenerateColumns="False" EnableModelValidation="True" >
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="Linkbuton18" runat="server"  Text='<%# Eval("papername") %>'
                                 CommandArgument='<%# Eval("papername") %>' OnClick="Go_to_review" ></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             
             </asp:GridView>
	     </div>

	     </ul>

	
</div>
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

    </form>

 </body>
    
</html>
