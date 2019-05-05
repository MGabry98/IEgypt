<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="WebApplication6.User" %>

<!DOCTYPE html>

<html >
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
  <li><a href="RegisterViewer">Register as Viewer</a></li>
  <li><a href="RegisterContributor">Register as Contributor</a></li>
  <li><a href="RegisterManager">Register as Content Manager</a></li>
  <li><a href="RegisterReviewer">Register as Authorized Reviewer</a></li>
</ul>
               <p>
             <asp:Label  runat="server" Text="Login" color="darkblue" font-size="200%" padding= "10px" Font-Names="Century Gothic"></asp:Label><br>
            <asp:Label  runat="server" Text="email: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="Txt_mail" runat="server"></asp:TextBox><br>
            <asp:Label  runat="server" Text="Password: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_pass" type="password" runat="server"></asp:TextBox><br>
            <asp:Button ID="Btn_login" runat="server" Text="Login " onclick="Login" Font-Names="Showcard Gothic" style="margin-left: 134px"/><br>



                </p><br>


            <!-- <h1>Registration</h1> -->
            <!--<p>     
                        <asp:Label  runat="server" Text="Registration" color="darkblue" font-size="200%" padding= "10px" Font-Names="Century Gothic"></asp:Label><br>
    
            <asp:Label ID="Label1" runat="server" Text="User Type: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_user_type" runat="server"></asp:TextBox><br>
                User Type is either Viewer or Contributor or Authorized Reviewer or Content Manager<br>


               <!--  <select id="saad" name="saad">
                    <option>Viewer</option>
                    <option>Contributor</option>
                    <option>Authorized Reviewer</option>
                    <option>Content Manager</option>
                </select><br>
                <asp:Label ID="Label2" runat="server" Text=""  Font-Names="Century Gothic"></asp:Label>

                <script>
                    var x = document.getElementById("saad").value;
                    document.getElementById("Label2").innerText = x;
                </script> 
            
           
                
                <asp:Button ID="btn_register" runat="server" Text="Register"  Font-Names="Showcard Gothic" style="margin-left: 134px"/><br>
               
                </p> -->

            <br>


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
              <br />
              <br />

         

        </div>
    </form>
</body>
</html>
