using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddressBook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }
    private void BindGrid()
    {
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string connectionString = ConfigurationManager.ConnectionStrings["Dorknozzle"].ConnectionString;
        conn = new SqlConnection(connectionString);
        comm = new SqlCommand(
            "SELECT EmployeeID, Name, City, State, MobilePhone " +
            "FROM Employees", conn);
        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            grid.DataSource = reader;
            grid.DataKeyNames = new string[] { "EmployeeID" };
            grid.DataBind();
            reader.Close();
        }
        finally
        {
            conn.Close();
        }
    }
    protected void grid_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDetails();
    }
    private void BindDetails()
    {
        int selectedRowIndex = grid.SelectedIndex;
        int employeeId = (int)grid.DataKeys[selectedRowIndex].Value;
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string connectionString = ConfigurationManager.ConnectionStrings["Dorknozzle"].ConnectionString;
        conn = new SqlConnection(connectionString);
        comm = new SqlCommand(
            "SELECT EmployeeID, Name, Address, City, State, Zip, HomePhone, Extension " +
            "FROM Employees " +
            "WHERE EmployeeID=@EmployeeID", conn);
        comm.Parameters.Add("EmployeeID", System.Data.SqlDbType.Int);
        comm.Parameters["EmployeeID"].Value = employeeId;
        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            employeeDetails.DataSource = reader;
            employeeDetails.DataKeyNames = new string[] { "EmployeeID" };
            employeeDetails.DataBind();
            reader.Close();
        }
        finally
        {
            conn.Close();
        }
    }
    protected void grid_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int selectedRowIndex = grid.SelectedIndex;
        int employeeId = (int)grid.DataKeys[selectedRowIndex].Value;
        if (employeeId == 1)
        {
            e.Cancel = true;
        }
    }
    protected void employeeDetails_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        employeeDetails.ChangeMode(e.NewMode);
        BindDetails();
    }
    protected void employeeDetails_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int employeeId = (int)employeeDetails.DataKey.Value;
        TextBox newAddressTextBox = (TextBox)employeeDetails.FindControl("editAddressTextBox");
        TextBox newCityTextBox = (TextBox)employeeDetails.FindControl("editCityTextBox");
        TextBox newStateTextBox = (TextBox)employeeDetails.FindControl("editStateTextBox");
        TextBox newZipTextBox = (TextBox)employeeDetails.FindControl("editZipTextBox");
        TextBox newHomePhoneTextBox = (TextBox)employeeDetails.FindControl("editHomePhoneTextBox");
        TextBox newExtensionTextBox = (TextBox)employeeDetails.FindControl("editExtensionTextBox");
        string newAddress = newAddressTextBox.Text;
        string newCity = newCityTextBox.Text;
        string newState = newStateTextBox.Text;
        string newZip = newZipTextBox.Text;
        string newHomePhone = newHomePhoneTextBox.Text;
        string newExtension = newExtensionTextBox.Text;
        SqlConnection conn;
        SqlCommand comm;
        string connectionString = ConfigurationManager.ConnectionStrings["Dorknozzle"].ConnectionString;
        conn = new SqlConnection(connectionString);
        comm = new SqlCommand(
            "UPDATE Employees " +
            "SET Address = @NewAddress, City = @NewCity, State = @NewState, Zip = @NewZip, HomePhone = @NewHomePhone, Extension = @NewExtension " +
            "WHERE EmployeeID = @EmployeeID", conn);
        // with a stored procedure:
        //comm = new SqlCommand("UpdateEmployeeDetails", conn);
        //comm.CommandType = System.Data.CommandType.StoredProcedure;
        comm.Parameters.Add("EmployeeID", System.Data.SqlDbType.Int);
        comm.Parameters["EmployeeID"].Value = employeeId;
        comm.Parameters.Add("NewAddress", System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["NewAddress"].Value = newAddress;
        comm.Parameters.Add("NewCity", System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["NewCity"].Value = newCity;
        comm.Parameters.Add("NewState", System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["NewState"].Value = newState;
        comm.Parameters.Add("NewZip", System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["NewZip"].Value = newZip;
        comm.Parameters.Add("NewHomePhone", System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["NewHomePhone"].Value = newHomePhone;
        comm.Parameters.Add("NewExtension", System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["NewExtension"].Value = newExtension;
        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
        }
        finally
        {
            conn.Close();
        }
        employeeDetails.ChangeMode(DetailsViewMode.ReadOnly);
        BindGrid();
        BindDetails();
    }
}