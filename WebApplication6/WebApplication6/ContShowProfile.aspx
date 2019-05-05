<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContShowProfile.aspx.cs" Inherits="ContShowProfile" %>

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
  <li><a href="ContEditProfile">Edit profile</a></li>
  <li><a href="User">Logout</a></li>
</ul>
            <br>
            <p>
<l1>First name:- </l1>
<asp:Label ID="lbl_firstname" runat="server"  Text="" font-size="130%" padding= "7px" Font-Names="Century Gothic"></asp:Label>


<l1>Middle name:- </l1>
<asp:Label ID="lbl_middlename" runat="server"   font-size="130%" padding= "7px" Font-Names="Century Gothic"></asp:Label>
<l1>Last name:- </l1>
<asp:Label ID="lbl_lastname" runat="server"   font-size="130%" padding= "7px" Font-Names="Century Gothic"></asp:Label><br>
<br><br>
<l1>Email:- </l1>
<asp:Label ID="lbl_mail" runat="server"   font-size="130%" padding= "7px" Font-Names="Century Gothic"></asp:Label><br>
<br><br>
<l1>Password:- </l1>
<asp:Label ID="lbl_password" runat="server" Text="*****"  font-size="130%" padding= "7px" Font-Names="Century Gothic"></asp:Label>
            
      
<asp:Button  ID="showpass" runat="server" Text="Show Password" onclick="Showpass" Font-Names="Showcard Gothic" style="margin-left: 134px"/>      <br>
<br><br>
<l1>Birthdate:- </l1>
<asp:Label ID="lbl_birthdate" runat="server"   font-size="130%" padding= "7px" Font-Names="Century Gothic"></asp:Label><br>
<br><br>
<l1>specilization:- </l1>
<asp:Label ID="lbl_specilization" runat="server"   font-size="130%" padding= "7px" Font-Names="Century Gothic"></asp:Label><br>
<br><br>
<l1>Portofolio link:- </l1>
<asp:Label ID="lbl_link" runat="server"   font-size="130%" padding= "7px" Font-Names="Century Gothic"></asp:Label><br>
<br><br>
<l1>Years of experience:- </l1>
<asp:Label ID="lbl_years_experience" runat="server"   font-size="130%" padding= "7px" Font-Names="Century Gothic"></asp:Label><br>
<br><br>
                </p>

        </div>
    </form>
</body>
</html>

