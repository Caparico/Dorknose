<%@ Page Title="" Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="HelpDesk.aspx.cs" Inherits="HelpDesk" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Label id=lbl runat=server></asp:Label>
<h1>Employee Help Desk Request</h1>
<asp:Label ID="dbErrorMessage" ForeColor="Red" runat="server" />
<p>
    Station Number:
    <asp:TextBox ID="stationTextBox" runat="server" CssClass="textbox" />
    <asp:RequiredFieldValidator id="stationNumReq" runat="server" ControlToValidate="stationTextBox" ErrorMessage="<br />You must enter a station number!" Display="Dynamic" />
    <asp:CompareValidator id="stationNumCheck" runat="server" ControlToValidate="stationTextBox" Operator="DataTypeCheck" Type="Integer" ErrorMessage="<br />The value must be a number!" Display="Dynamic" />
    <asp:RangeValidator id="stationNumRangeCheck" runat="server" ControlToValidate="stationTextBox" MinimumValue="1" MaximumValue="50" Type="Integer" ErrorMessage="<br />Number must be between 1 and 50." Display="Dynamic" />
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
    <asp:RequiredFieldValidator id="descriptionReq" runat="server" ControlToValidate="descriptionTextBox" ErrorMessage="<br />You must enter a description!" Display="Dynamic" />
</p>
<p>
    <asp:Button ID="submitButton" runat="server" CssClass="button" Text="Submit Request" OnClick="submitButton_Click" />
</p>
</asp:Content>


