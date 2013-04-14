<%@ Page Title="Help Desk" Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="false" CodeFile="HelpDesk.aspx.cs" Inherits="HelpDesk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Employee Help Desk Request</h1>
<p>
    Station Number:
    <asp:TextBox ID="stationTextBox" runat="server" CssClass="textbox" />
</p>
<p>
    Problem Category:
    <asp:DropDownList ID="categoryList" runat="server" CssClass="dropdownmenu" />
</p>
<p>
    Problem Subject:
    <asp:DropDownList ID="subjectList" runat="server" CssClass="dropdownmenu" />
</p>
<p>
    Problem Description:
    <asp:TextBox ID="descriptionTextBox" runat="server" CssClass="textbox" Columns="40" Rows="4" TextMode="MultiLine" />
</p>
<p>
    <asp:Button ID="submitButton" runat="server" CssClass="button" Text="Submit Request" />
</p>
</asp:Content>

