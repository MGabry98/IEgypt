<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="WebApplication6.Staff" %>

<!DOCTYPE html>

<html">
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
  <li><a href="StaffShowInfo">Show info</a></li>
  <li><a href="StaffEdit">Edit profile</a></li>
  <li><a href="User">Logout</a></li>
</ul>


             <p>
              <asp:Label ID="lbl_name_org" runat="server" Text="Name of Original Content: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_name_org" runat="server"></asp:TextBox><br> 
            <asp:Label ID="lbl_cat_org" runat="server" Text="Category of Original Content: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_cat_org" runat="server"></asp:TextBox><br>
            <asp:Button ID="btn_cat_org" runat="server" Text="Search for Original content" onclick="SearchOrgContent" Font-Names="Showcard Gothic" style="margin-left: 134px"/><br>
              </p>
                <br>
             <asp:GridView ID="grid1" runat="server" style="margin-top: 23px"  BackColor="#66CCFF" >
         </asp:GridView> 
            
                <br>
            <br>


            <p>
              <asp:Label ID="lbl_contributor_name" runat="server" Text="Contributor name "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_contributor_name" runat="server"></asp:TextBox><br>
            <asp:Button ID="btn_contributor_name" runat="server" Text="Search for Contributor" onclick="SearchContributor" Font-Names="Showcard Gothic" style="margin-left: 134px"/><br>
            </p>
                <br>
            <asp:GridView ID="grid2" runat="server" style="margin-top: 23px"  BackColor="#66CCFF" >
         </asp:GridView> 
            <br>
            <br>




           


            <p>
              <asp:Button ID="Button1" runat="server" Text="Show contributors  " onclick="Show_Contributor" Font-Names="Showcard Gothic" style="margin-left: 134px"/><br>
              <asp:Label  runat="server" Text="Contributors are shown in the order of the highest years of experience."  Font-Names="Century Gothic"></asp:Label>


                </p>
              <asp:GridView ID="grid3" runat="server" style="margin-top: 23px"  BackColor="#66CCFF" >
         </asp:GridView> 



            <p>
            
            <asp:Label runat="server" Text="Search for Original Content Along with the Contributor who uploaded it (if no contributor were added then all Original Content will be shown) "  Font-Names="Century Gothic"></asp:Label>
            <br>

                <asp:Label  runat="server" Text="Contributor name: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_cont_name" runat="server"></asp:TextBox><br>
             <asp:Button ID="Button2" runat="server" Text="Search  " onclick="Show_Org" Font-Names="Showcard Gothic" style="margin-left: 134px"/><br>


                 </p>
              <asp:GridView ID="grid4" runat="server" style="margin-top: 23px"  BackColor="#66CCFF" >
         </asp:GridView> 

            
    <asp:Button runat="server" Text="Deactivate my Account" OnClick="Deactivate" Font-Names="Showcard Gothic" style="margin-left: 134px"/>
        </div>
    </form>
</body>
</html>
