<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContEditProfile.aspx.cs" Inherits="ContEditProfile" %>

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

    l1{
color: darkblue;
font-size: 180%;
padding: 7px;
    }
   

    h1{
color: darkblue;
font-size: 150%;
padding: 7px;
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
  <li><a href="ContShowProfile">Show profile</a></li>
  <li><a href="User">Logout</a></li>
</ul>

 <h1>Edit my info</h1><br>
            <p>
            <asp:Label ID="Label2" runat="server" Text="Email: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_email" ReadOnly="true" runat="server"></asp:TextBox>
                  <asp:Button  ID="btn_email" runat="server" Text="Edit Email" OnClick="EmailChanged" Font-Names="Showcard Gothic" style="margin-left: 134px"/>
            <asp:TextBox ID="txt_newemail" visible="false" runat="server"></asp:TextBox><br>
                <br>
            <asp:Label ID="Label3" runat="server" Text="password: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox type="password" ReadOnly="true" ID="txt_password" runat="server"></asp:TextBox>
             <asp:Button  ID="btn_pass" runat="server" Text="Edit Password" OnClick="passchanged" Font-Names="Showcard Gothic" style="margin-left: 134px"/>
            <asp:TextBox ID="txt_newpass" type="password" visible="false" runat="server"></asp:TextBox><br><br>

                
            <asp:Label ID="Label4" runat="server" Text="First name: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_first_name" ReadOnly="true" runat="server"></asp:TextBox>
            <asp:Button  ID="btn_firstname" runat="server" Text="Edit First name" OnClick="firstnamechanged" Font-Names="Showcard Gothic" style="margin-left: 134px"/>
            <asp:TextBox ID="Txt_newfirstname" visible="false" runat="server"></asp:TextBox><br><br>



            <asp:Label ID="Label5" runat="server" Text="Middle name: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_middle_name" ReadOnly="true" runat="server"></asp:TextBox>
            <asp:Button  ID="btn_middle" runat="server" Text="Edit middle name" OnClick="middlenamechanged" Font-Names="Showcard Gothic" style="margin-left: 134px"/>
            <asp:TextBox ID="txt_newmiddle" visible="false" runat="server"></asp:TextBox><br><br>




            <asp:Label ID="Label6" runat="server" Text="Last name: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_last_name" ReadOnly="true" runat="server"></asp:TextBox>
            <asp:Button  ID="btn_last" runat="server" Text="Edit Last name" OnClick="lastnamechanged" Font-Names="Showcard Gothic" style="margin-left: 134px"/>
            <asp:TextBox ID="txt_newlast" visible="false" runat="server"></asp:TextBox><br><br>


            <asp:Label ID="Label7" runat="server" Text="Birthdate: "  Font-Names="Century Gothic"></asp:Label>
            <asp:Textbox id="txt_birthdate" ReadOnly="true" runat="server"></asp:Textbox>
             <asp:Button  ID="btn_bd" runat="server" Text="Edit Birthdate" OnClick="birthdaychanged" Font-Names="Showcard Gothic" style="margin-left: 134px"/>
            <asp:TextBox type="date" ID="txt_newbirthdate" visible="false" runat="server"></asp:TextBox><br><br>








            <asp:Label ID="Label8" runat="server" Text="Specialization: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_specialization" ReadOnly="true" runat="server"></asp:TextBox>
            <asp:Button  ID="btn_spec" runat="server" Text="Edit Specialization" OnClick="specchanged" Font-Names="Showcard Gothic" style="margin-left: 134px"/>
            <asp:TextBox ID="txt_newspec" visible="false" runat="server"></asp:TextBox><br><br>



            <asp:Label ID="Label1" runat="server" Text="Portofolio Link: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_link" ReadOnly="true" runat="server"></asp:TextBox>
            <asp:Button  ID="btn_link" runat="server" Text="Edit Portofolio Link" OnClick="linkChanged" Font-Names="Showcard Gothic" style="margin-left: 134px"/>
            <asp:TextBox ID="txt_newlink" visible="false" runat="server"></asp:TextBox><br><br>
            
                
            <asp:Label ID="Label9" runat="server" Text="Years of experience: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_yof" ReadOnly="true" runat="server"></asp:TextBox>
             <asp:Button  ID="btn_yof" runat="server" Text="Edit Years of experience" OnClick="yearsChanged" Font-Names="Showcard Gothic" style="margin-left: 134px"/>
            <asp:TextBox ID="txt_newyof" visible="false" runat="server"></asp:TextBox><br><br>
            <br><br>
             <asp:Button   runat="server" Text="Update Info" OnClick="Update" Font-Names="Showcard Gothic" style="margin-left: 200px"/>
               

                </p>
    
        
        
        </div>
    </form>
</body>
</html>
