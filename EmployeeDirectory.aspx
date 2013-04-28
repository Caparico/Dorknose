<%@ Page Title="Dorknozzle Employee Directory" Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="EmployeeDirectory.aspx.cs" Inherits="EmployeeDirectory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Employee Directory</h1>
    <asp:Repeater ID="employeesRepeater" runat="server">
        <ItemTemplate>
            Employee ID: <strong><%#Eval("EmployeeID") %></strong><br />
            Name: <strong><%#Eval("Name") %></strong><br />
            Username: <strong><%#Eval("Username") %></strong><br />
        </ItemTemplate>
        <SeparatorTemplate>
            <hr />
        </SeparatorTemplate>
    </asp:Repeater>
</asp:Content>

