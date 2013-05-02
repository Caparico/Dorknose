<%@ Page Title="Dorknozzle Employee Directory" Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="EmployeeDirectory.aspx.cs" Inherits="EmployeeDirectory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Employee Directory</h1>
    <asp:DataList ID="employeesList" runat="server" 
        onitemcommand="employeesList_ItemCommand">
        <ItemTemplate>
        <asp:Literal ID="extraDetailsLiteral" runat="server" EnableViewState="false" />
            Name: <strong><%#Eval("Name")%></strong><br />
            Username: <strong><%#Eval("Username")%></strong><br />
        <asp:LinkButton ID="detailsButton" runat="server"
            Text='<%#"View more on " + Eval("Name")%>'
            CommandName="MoreDetailsPlease"
            CommandArgument='<%#Eval("EmployeeID")%>' />
        </ItemTemplate>
        <SeparatorTemplate>
            <hr />
        </SeparatorTemplate>
    </asp:DataList>
</asp:Content>

