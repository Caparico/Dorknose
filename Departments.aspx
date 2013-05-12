<%@ Page Title="Dorknozzle Departments" Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="Departments.aspx.cs" Inherits="Departments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Dorknozzle Departments</h1>
    <asp:GridView ID="departmentsGrid" runat="server" AllowPaging="True" 
        PageSize="4" AllowSorting="True" 
        onpageindexchanging="departmentsGrid_PageIndexChanging" 
        onsorting="departmentsGrid_Sorting">
    </asp:GridView>
</asp:Content>

