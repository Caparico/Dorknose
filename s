[1mdiff --git a/AddressBook.aspx b/AddressBook.aspx[m
[1mindex cbb72b9..d27a53e 100644[m
[1m--- a/AddressBook.aspx[m
[1m+++ b/AddressBook.aspx[m
[36m@@ -14,76 +14,10 @@[m
             <asp:ButtonField CommandName="Select" Text="Select" />[m
         </Columns>[m
     </asp:GridView><br />[m
[31m-    <asp:DetailsView ID="employeeDetails" runat="server" AutoGenerateRows="False">[m
[31m-        <Fields>[m
[31m-            <asp:TemplateField HeaderText="Address">[m
[31m-                <EditItemTemplate>[m
[31m-                    <asp:TextBox ID="editAddressTextBox" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>[m
[31m-                </EditItemTemplate>[m
[31m-                <InsertItemTemplate>[m
[31m-                    <asp:TextBox ID="insertAddressTextBox" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>[m
[31m-                </InsertItemTemplate>[m
[31m-                <ItemTemplate>[m
[31m-                    <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("Address") %>'></asp:Label>[m
[31m-                </ItemTemplate>[m
[31m-            </asp:TemplateField>[m
[31m-            <asp:TemplateField HeaderText="City">[m
[31m-                <EditItemTemplate>[m
[31m-                    <asp:TextBox ID="editCityTextBox" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>[m
[31m-                </EditItemTemplate>[m
[31m-                <InsertItemTemplate>[m
[31m-                    <asp:TextBox ID="insertCityTextBox" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>[m
[31m-                </InsertItemTemplate>[m
[31m-                <ItemTemplate>[m
[31m-                    <asp:Label ID="cityLabel" runat="server" Text='<%# Bind("City") %>'></asp:Label>[m
[31m-                </ItemTemplate>[m
[31m-            </asp:TemplateField>[m
[31m-            <asp:TemplateField HeaderText="State">[m
[31m-                <EditItemTemplate>[m
[31m-                    <asp:TextBox ID="editStateTextBox" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>[m
[31m-                </EditItemTemplate>[m
[31m-                <InsertItemTemplate>[m
[31m-                    <asp:TextBox ID="insertStateTextBox" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>[m
[31m-                </InsertItemTemplate>[m
[31m-                <ItemTemplate>[m
[31m-                    <asp:Label ID="stateLabel" runat="server" Text='<%# Bind("State") %>'></asp:Label>[m
[31m-                </ItemTemplate>[m
[31m-            </asp:TemplateField>[m
[31m-            <asp:TemplateField HeaderText="Zip">[m
[31m-                <EditItemTemplate>[m
[31m-                    <asp:TextBox ID="editZipTextBox" runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>[m
[31m-                </EditItemTemplate>[m
[31m-                <InsertItemTemplate>[m
[31m-                    <asp:TextBox ID="insertZipTextBox" runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>[m
[31m-                </InsertItemTemplate>[m
[31m-                <ItemTemplate>[m
[31m-                    <asp:Label ID="zipLabel" runat="server" Text='<%# Bind("Zip") %>'></asp:Label>[m
[31m-                </ItemTemplate>[m
[31m-            </asp:TemplateField>[m
[31m-            <asp:TemplateField HeaderText="Home Phone">[m
[31m-                <EditItemTemplate>[m
[31m-                    <asp:TextBox ID="editHomePhoneTextBox" runat="server" Text='<%# Bind("HomePhone") %>'></asp:TextBox>[m
[31m-                </EditItemTemplate>[m
[31m-                <InsertItemTemplate>[m
[31m-                    <asp:TextBox ID="insertHomePhoneTextBox" runat="server" Text='<%# Bind("HomePhone") %>'></asp:TextBox>[m
[31m-                </InsertItemTemplate>[m
[31m-                <ItemTemplate>[m
[31m-                    <asp:Label ID="homePhoneLabel" runat="server" Text='<%# Bind("HomePhone") %>'></asp:Label>[m
[31m-                </ItemTemplate>[m
[31m-            </asp:TemplateField>[m
[31m-            <asp:TemplateField HeaderText="Extension">[m
[31m-                <EditItemTemplate>[m
[31m-                    <asp:TextBox ID="editExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>'></asp:TextBox>[m
[31m-                </EditItemTemplate>[m
[31m-                <InsertItemTemplate>[m
[31m-                    <asp:TextBox ID="insertExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>'></asp:TextBox>[m
[31m-                </InsertItemTemplate>[m
[31m-                <ItemTemplate>[m
[31m-                    <asp:Label ID="extensionLabel" runat="server" Text='<%# Bind("Extension") %>'></asp:Label>[m
[31m-                </ItemTemplate>[m
[31m-            </asp:TemplateField>[m
[31m-            <asp:CommandField ShowEditButton="True" />[m
[31m-        </Fields>[m
[32m+[m[32m    <asp:DetailsView ID="employeeDetails" runat="server" AutoGenerateRows="False"[m[41m [m
[32m+[m[32m        AutoGenerateDeleteButton="True" AutoGenerateEditButton="True"[m[41m [m
[32m+[m[32m        AutoGenerateInsertButton="True" DataKeyNames="EmployeeID"[m[41m [m
[32m+[m[32m        DataSourceID="employeeDataSource">[m
         <HeaderTemplate>[m
             <%#Eval("Name")%>[m
         </HeaderTemplate>[m
[36m@@ -92,5 +26,46 @@[m
         ConnectionString="<%$ ConnectionStrings:Dorknozzle %>" [m
         SelectCommand="SELECT [EmployeeID], [Name], [City], [MobilePhone] FROM [Employees] ORDER BY [Name]">[m
     </asp:SqlDataSource>[m
[32m+[m[32m    <asp:SqlDataSource ID="employeeDataSource" runat="server"[m[41m [m
[32m+[m[32m        ConnectionString="<%$ ConnectionStrings:Dorknozzle %>"[m[41m [m
[32m+[m[32m        DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @EmployeeID"[m[41m [m
[32m+[m[32m        InsertCommand="INSERT INTO [Employees] ([DepartmentID], [Name], [Username], [Password], [Address], [City], [State], [Zip], [HomePhone], [Extension], [MobilePhone]) VALUES (@DepartmentID, @Name, @Username, @Password, @Address, @City, @State, @Zip, @HomePhone, @Extension, @MobilePhone)"[m[41m [m
[32m+[m[32m        SelectCommand="SELECT * FROM [Employees] WHERE ([EmployeeID] = @EmployeeID)"[m[41m [m
[32m+[m[32m        UpdateCommand="UPDATE [Employees] SET [DepartmentID] = @DepartmentID, [Name] = @Name, [Username] = @Username, [Password] = @Password, [Address] = @Address, [City] = @City, [State] = @State, [Zip] = @Zip, [HomePhone] = @HomePhone, [Extension] = @Extension, [MobilePhone] = @MobilePhone WHERE [EmployeeID] = @EmployeeID">[m
[32m+[m[32m        <DeleteParameters>[m
[32m+[m[32m            <asp:Parameter Name="EmployeeID" Type="Int32" />[m
[32m+[m[32m        </DeleteParameters>[m
[32m+[m[32m        <InsertParameters>[m
[32m+[m[32m            <asp:Parameter Name="DepartmentID" Type="Int32" />[m
[32m+[m[32m            <asp:Parameter Name="Name" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="Username" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="Password" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="Address" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="City" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="State" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="Zip" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="HomePhone" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="Extension" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="MobilePhone" Type="String" />[m
[32m+[m[32m        </InsertParameters>[m
[32m+[m[32m        <SelectParameters>[m
[32m+[m[32m            <asp:ControlParameter ControlID="grid" Name="EmployeeID"[m[41m [m
[32m+[m[32m                PropertyName="SelectedValue" Type="Int32" />[m
[32m+[m[32m        </SelectParameters>[m
[32m+[m[32m        <UpdateParameters>[m
[32m+[m[32m            <asp:Parameter Name="DepartmentID" Type="Int32" />[m
[32m+[m[32m            <asp:Parameter Name="Name" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="Username" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="Password" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="Address" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="City" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="State" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="Zip" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="HomePhone" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="Extension" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="MobilePhone" Type="String" />[m
[32m+[m[32m            <asp:Parameter Name="EmployeeID" Type="Int32" />[m
[32m+[m[32m        </UpdateParameters>[m
[32m+[m[32m    </asp:SqlDataSource>[m
 </asp:Content>[m
 [m
