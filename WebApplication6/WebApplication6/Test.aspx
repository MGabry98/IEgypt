<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
      <style>
         body{height:100%;
   width:100%;
   background-image:url('Cairo.png');
   background-repeat:no-repeat;  
   background-size:cover;  
}
    p{
border: 8px solid powderblue;
color: black;
font-size: 110%;
padding: 20px;}

    h1{
color: darkblue;
font-size: 300%;
padding: 20px;
}
     ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #111111;
}
 </style>
<body>

    <form id="form1" runat="server">
        <div>

            
                <ul>
  <li><a href="Contributor">Home</a></li>
  <li><a href="ContShowProfile">Show info</a></li>
  <li><a href="ContEditProfile">Edit profile</a></li>
  <li><a href="User">Logout</a></li>
</ul>
                <h1>

                </h1>
            <asp:TextBox ID="Content1" runat="server" >Enter Content To Be Deleted</asp:TextBox>
            <asp:Button ID="btnDelete" runat="server" Text="Delete Content" BackColor="Red" ForeColor="White" OnClick="BtnDelete_Click"/>
            <asp:TextBox ID="Events1" runat="server" >Enter Event ID</asp:TextBox>
            <asp:Button ID="btnEvents" runat="server" Text="Show Events" BackColor="Blue" ForeColor="Black" OnClick="BtnEvents_Click"/>
            <asp:GridView ID="Grid10" runat="server" style="margin-top : 23px" BackColor="#66CCFF"></asp:GridView>
            
            <asp:Button ID="btnNotify" runat="server" Text="Show Notifications" BackColor="Yellow" ForeColor="Black" OnClick="BtnNotify_Click"/>
            <asp:GridView ID="GridView1" runat="server" style="margin-top : 23px" BackColor="#66CCFF"></asp:GridView>
            <asp:Label ID="Status" runat="server" ForeColor="Black" BackColor="Red" Width="5%" Height="18px"> </asp:Label>
            <asp:TextBox ID="Request_ID" runat="server" >Enter Request ID</asp:TextBox>
            <asp:Button ID="btnRespond" runat="server" Text="Respond" BackColor="Black" ForeColor="White" OnClick="BtnRespond_Click"/>
            <asp:RadioButtonList ID="R" runat="server" RepeatLayout="Flow">
            <asp:ListItem Value="1">Accept</asp:ListItem>
            <asp:ListItem Value="0">Reject</asp:ListItem>
            </asp:RadioButtonList>
            <h1>

            </h1>
            <asp:TextBox ID="txtMsg" runat="server" >Enter Message Here</asp:TextBox>
            
            <asp:Button ID="btnSendMsg" runat="server" Text="Send Message" BackColor="Black" ForeColor="White" OnClick="BtnSendMsg_Click"/>
            <asp:TextBox ID="txtVID" runat="server" >Enter Viewer ID </asp:TextBox>
            
            <h1>

            </h1>
            <asp:Button ID="ShowMsg" runat="server" Text="Show Messages" BackColor="Green" ForeColor="Black" OnClick="BtnShowMsg_Click"/>
            <asp:GridView ID="GridView2" runat="server" style="margin-top : 23px" BackColor="#66CCFF"></asp:GridView>
            <h1>

            </h1>
          
            <asp:GridView ID="GridView3" runat="server" style="margin-top : 23px" BackColor="#66CCFF"></asp:GridView>








           
            <table style="margin-top: 20%;">
                
                <tr>
                    <td>&nbsp;Content Link</td>
                    <td>&nbsp;<asp:TextBox ID="txtContent" runat="server" ></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;SubCategoryName</td>
                    <td>&nbsp;<asp:TextBox ID="SCN" runat="server" ></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
                 <tr>
                    <td>&nbsp;CategoryName</td>
                    <td>&nbsp;<asp:TextBox ID="CN" runat="server" ></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;Request_id</td>
                    <td>&nbsp;<asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
            <asp:GridView ID="Grid1" runat="server" style="margin-top : 23px" BackColor="#66CCFF"></asp:GridView>
                    </td>
                    <td>&nbsp;<asp:Button ID="btnUpLoad" runat="server" Text="UpLoadNewContent" BackColor="Green" ForeColor="White" OnClick="btnUpLoadNewContent_Click"/>
                    
                    </td>
                    <td>&nbsp;</td>
                </tr>
               
            </table>




             <
            <table style="margin-top: 20%;" align="center">
                <tr>
                    <td>&nbsp;Type</td>
                    <td>&nbsp;<asp:TextBox ID="txtType" runat="server"></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;Content Link</td>
                    <td>&nbsp;<asp:TextBox ID="txtLink" runat="server" ></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;SubCategoryName</td>
                    <td>&nbsp;<asp:TextBox ID="SCN1" runat="server" ></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
                 <tr>
                    <td>&nbsp;CategoryName</td>
                    <td>&nbsp;<asp:TextBox ID="CN1" runat="server" ></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;<asp:Button ID="Button1" runat="server" Text="UpLoad" BackColor="Green" ForeColor="White" OnClick="btnUpLoad_Click"/>
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" BackColor="White" Width="100%" Height="18px"> </asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
               
            </table>

        </div>
    </form>
</body>
</html>
