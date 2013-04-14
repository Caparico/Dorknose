<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
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
    <title>Login Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <!-- UserName -->
        <p>
            Username: <asp:TextBox ID="usernameTextBox" runat="server" />
            <asp:RequiredFieldValidator ID="usernameReq" runat="server" ControlToValidate="usernameTextBox" ErrorMessage="Username is required, buddy!" SetFocusOnError="true" Display="Dynamic" />
        </p>
        <!-- Password -->
        <p>
            Password: <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator ID="passwordReq" runat="server" ControlToValidate="passwordTextBox" ErrorMessage="Password is required, buddy!" SetFocusOnError="true" Display="Dynamic" />
        </p>
        <!--Submit Button -->
        <p>
            <asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="submitButton_Click" />
        </p>
    </div>
    </form>
</body>
</html>
