<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication6._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<html>
<title>IEGYPT</title>


Name of Original Content: <input type="text" name="Search_Org_name" ><br>
Category of Original Content: <input type="text" name="Search_Org_name_category" ><br>


<button type="button" onclick="button1clicked">Search for Original content by name</button>
<button type="button" onclick="button2clicked">Search for Original content by category</button>


</html>
</asp:Content>