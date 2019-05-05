<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterReviewer.aspx.cs" Inherits="WebApplication6.RegisterReviewer" %>

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
  <li><a href="User.aspx">Home</a></li>
 <!-- <li><a href="highlight.html">Highlight</a></li>
  <li><a href="about.html">About</a></li> -->
</ul>
              <h1>Register as Reviewer</h1><br>
            <p>
            <asp:Label ID="Label2" runat="server" Text="Email: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_email" runat="server"></asp:TextBox><br>
            <asp:Label ID="Label3" runat="server" Text="password: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox type="password" ID="txt_password" runat="server"></asp:TextBox><br>
            <asp:Label ID="Label4" runat="server" Text="First name: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_first_name" runat="server"></asp:TextBox><br>
            <asp:Label ID="Label5" runat="server" Text="Middle name: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_middle_name" runat="server"></asp:TextBox><br>
            <asp:Label ID="Label6" runat="server" Text="Last name: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_last_name" runat="server"></asp:TextBox><br>
            <asp:Label ID="Label7" runat="server" Text="Birthdate: "  Font-Names="Century Gothic"></asp:Label>
            <asp:Textbox type="date" id="txt_birthdate" runat="server"></asp:Textbox><br>
            <asp:Label ID="Label1" runat="server" Text="Hire Date: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_hiredate" type="date" runat="server"></asp:TextBox><br>
            <asp:Label ID="Label8" runat="server" Text="working hours: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_working_hours" type="number" runat="server"></asp:TextBox><br>
            <asp:Label ID="Label9" runat="server" Text="payment ratio: "  Font-Names="Century Gothic"></asp:Label>
            <asp:TextBox ID="txt_ratio" type="number" runat="server"></asp:TextBox><br>    
            <asp:Button ID="btn_register" runat="server" Text="Register" onclick="RegisterReviewer1" Font-Names="Showcard Gothic" style="margin-left: 134px"/><br>
            </p>
            <br>
            

        </div>
    </form>
</body>
</html>
