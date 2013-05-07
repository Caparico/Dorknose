﻿<%@ Page Title="Address Book" Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="AddressBook.aspx.cs" Theme="Blue" Inherits="AddressBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Address Book</h1>
    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" 
        onselectedindexchanged="grid_SelectedIndexChanged">
        <Columns>
            <asp:boundField DataField="Name" HeaderText="Name" />
            <asp:boundField DataField="City" HeaderText="City" />
            <asp:boundField DataField="MobilePhone" HeaderText="Mobile Phone" />
            <asp:ButtonField CommandName="Select" Text="Select" />
        </Columns>
    </asp:GridView><br />
    <asp:DetailsView ID="employeeDetails" runat="server" AutoGenerateRows="False" 
        onmodechanging="employeeDetails_ModeChanging" 
        onitemupdating="employeeDetails_ItemUpdating">
        <Fields>
            <asp:TemplateField HeaderText="Address">
                <EditItemTemplate>
                    <asp:TextBox ID="editAddressTextBox" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="insertAddressTextBox" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City">
                <EditItemTemplate>
                    <asp:TextBox ID="editCityTextBox" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="insertCityTextBox" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="cityLabel" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="State">
                <EditItemTemplate>
                    <asp:TextBox ID="editStateTextBox" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="insertStateTextBox" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="stateLabel" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Zip">
                <EditItemTemplate>
                    <asp:TextBox ID="editZipTextBox" runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="insertZipTextBox" runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="zipLabel" runat="server" Text='<%# Bind("Zip") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Home Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="editHomePhoneTextBox" runat="server" Text='<%# Bind("HomePhone") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="insertHomePhoneTextBox" runat="server" Text='<%# Bind("HomePhone") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="homePhoneLabel" runat="server" Text='<%# Bind("HomePhone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Extension">
                <EditItemTemplate>
                    <asp:TextBox ID="editExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="insertExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="extensionLabel" runat="server" Text='<%# Bind("Extension") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Fields>
        <HeaderTemplate>
            <%#Eval("Name")%>
        </HeaderTemplate>
    </asp:DetailsView>
</asp:Content>

