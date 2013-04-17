<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected void CheckUniqueUserName(Object s, ServerValidateEventArgs e)
    {
        string username = e.Value.ToLower();
        if (username == "andrei" || username == "cristian")
        {
            e.IsValid = false;
        }
    }
    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            submitButton.Text = "Valid";
        }
        else
        {
            submitButton.Text = "Invalid!";
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/style.min.css" rel="stylesheet" />
    <title>Login Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="grid">
    <div class="grid__item  one-half">
        <!-- UserName -->
        <p>
            New Username: <asp:TextBox ID="usernameTextBox" runat="server" />
            <asp:CustomValidator ID="usernameUnique" runat="server" ControlToValidate="usernameTextBox" OnServerValidate="CheckUniqueUserName" ErrorMessage="This username is already taken!" />
        </p>
        <!-- Email Address -->
        <p class="grid__item">
            Email address: <asp:TextBox ID="emailTextBox" runat="server" />
            <asp:RequiredFieldValidator ID="emailReq" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Email is required, buddy!" SetFocusOnError="true" Display="Dynamic" />
            <asp:RegularExpressionValidator id="emailValidator" runat="server" ControlToValidate="emailTextBox" ValidationExpression="^\S+@\S+\.\S+$" ErrorMessage="You must enter a VALID email address!" />
        </p>
        <!-- Password -->
        <p class="grid__item">
            Password: <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator ID="passwordReq" runat="server" ControlToValidate="passwordTextBox" ErrorMessage="Password is required, buddy!" SetFocusOnError="true" Display="Dynamic" />
        <!-- Confirm Password -->
        </p>
        <p class="grid__item">
            Comfirm: <asp:TextBox ID="confirmPasswordTextBox" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator ID="comfirmPasswordReq" runat="server" ControlToValidate="confirmPasswordTextBox" ErrorMessage="Password confirmation is required!" SetFocusOnError="true" Display="Dynamic" />
            <asp:CompareValidator ID="comparePasswords" runat="server" ControlToCompare="passwordTextBox" ControlToValidate="confirmPasswordTextBox" ErrorMessage="Your passwords do not match!" Display="Dynamic" />
        </p>
    </div>
    <div class="grid__item  one-third">
        <!-- Age -->
        <p class="grid__item">
            Age: <asp:TextBox ID="ageTextBox" runat="server" />
            <asp:RequiredFieldValidator ID="ageReq" runat="server" ControlToValidate="ageTextBox" ErrorMessage="Age is required!" SetFocusOnError="true" Display="Dynamic" />
            <asp:CompareValidator ID="ageCheck" runat="server" Operator="GreaterThan" Type="Integer" ControlToValidate="ageTextBox" ValueToCompare="15" ErrorMessage="You must be 16 years or older to enter this site." />
        </p>
        <!-- Birth Date -->
        <p class="grid__item">
            Birth Date: <asp:TextBox ID="birthDateTextBox" runat="server" />
            <asp:RangeValidator ID="birthDateRangeTest" runat="server" Type="Date" ControlToValidate="birthDateTextBox" MinimumValue="1/1/1970" MaximumValue="31/12/1979" ErrorMessage="You must be from the 70's to enter!" SetFocusOnError="true" Display="Dynamic" />
        </p>
 
    </div>
    <div class="grid__item  one-third">
        <!--Submit Button -->        
            <asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="submitButton_Click" CssClass="btn btn--positive btn--beta" />
        <!-- Validation summary -->
        <asp:ValidationSummary id="vSummary" ShowMessageBox="true" runat="server" />
    </div>
    </div>
    </form>
</body>
</html>
