using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminTools : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadEmployeesList();
        }
    }
    private void LoadEmployeesList()
    {
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string connectionString = ConfigurationManager.ConnectionStrings["Dorknozzle"].ConnectionString;
        conn = new SqlConnection(connectionString);
        comm = new SqlCommand(
            "SELECT EmployeeID, Name FROM Employees", conn);
        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            employeesList.DataSource = reader;
            employeesList.DataValueField = "EmployeeID";
            employeesList.DataTextField = "Name";
            employeesList.DataBind();
            reader.Close();
        }
        catch
        {
            dbErrorLabel.Text = "Error loading the employees' list!<br />";
        }
        finally
        {
            conn.Close();
        }
        updateButton.Enabled = false;
        nameTextBox.Text = "";
        userNameTextBox.Text = "";
        addressTextBox.Text = "";
        cityTextBox.Text = "";
        stateTextBox.Text = "";
        zipTextBox.Text = "";
        homePhoneTextBox.Text = "";
        extensionTextBox.Text = "";
        mobilePhoneTextBox.Text = "";
     }
    protected void  updateButton_Click(object sender, EventArgs e)
    {

    }
    protected void  selectButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string connectionString =
        ConfigurationManager.ConnectionStrings["Dorknozzle"].ConnectionString;
        conn = new SqlConnection(connectionString);
        comm = new SqlCommand(
        "SELECT Name, Username, Address, City, State, Zip, " +
        "HomePhone, Extension, MobilePhone FROM Employees " +
        "WHERE EmployeeID = @EmployeeID", conn);
        comm.Parameters.Add("@EmployeeID", System.Data.SqlDbType.Int);
        comm.Parameters["@EmployeeID"].Value = employeesList.SelectedItem.Value;
        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            if (reader.Read())
            {
                nameTextBox.Text = reader["Name"].ToString();
                userNameTextBox.Text = reader["Username"].ToString();
                addressTextBox.Text = reader["Address"].ToString();
                cityTextBox.Text = reader["City"].ToString();
                stateTextBox.Text = reader["State"].ToString();
                zipTextBox.Text = reader["Zip"].ToString();
                homePhoneTextBox.Text = reader["HomePhone"].ToString();
                extensionTextBox.Text = reader["Extension"].ToString();
                mobilePhoneTextBox.Text = reader["MobilePhone"].ToString();
            }
            reader.Close();
            updateButton.Enabled = true;
        }
        catch
        {
            dbErrorLabel.Text = "Error loading the employee's details!<br />";
        }
        finally
        {
            conn.Close();
        }
    }
}