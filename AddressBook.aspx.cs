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
}